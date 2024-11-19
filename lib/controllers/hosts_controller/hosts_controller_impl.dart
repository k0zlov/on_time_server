import 'dart:async';
import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:on_time_server/controllers/hosts_controller/hosts_controller.dart';
import 'package:on_time_server/database/database.dart';
import 'package:on_time_server/database/extensions/event_extension.dart';
import 'package:on_time_server/database/extensions/member_extension.dart';
import 'package:on_time_server/exceptions/api_exception.dart';
import 'package:on_time_server/sockets/timetables_socket.dart';
import 'package:on_time_server/utils/request_validator.dart';
import 'package:shelf/shelf.dart';

class HostsControllerImpl implements HostsController {
  HostsControllerImpl({
    required this.database,
    required this.socket,
  });

  final Database database;

  final TimetablesSocket socket;

  @override
  Future<Response> add(Request request) async {
    final User user = request.context['user']! as User;

    final Map<String, dynamic> body =
        RequestValidator.getBodyFromContext(request);

    final int eventId = body['eventId'] as int;
    final int memberId = body['memberId'] as int;

    final Event? foundEvent = await database.getEvent(
      (tbl) => tbl.id.equals(eventId),
    );

    if (foundEvent == null) {
      throw const ApiException.badRequest('There is no event with such ID');
    }

    final TimetableMember? foundMember = await database.getTimetableMember(
      (tbl) =>
          tbl.userId.equals(user.id) &
          tbl.timetableId.equals(
            foundEvent.timetableId,
          ),
    );

    if (foundMember == null || !foundMember.role.isAdmin) {
      throw const ApiException.forbidden(
        'You have no rights to edit events in that timetable',
      );
    }

    try {
      await database.eventHosts.insert().insert(
            EventHostsCompanion.insert(memberId: memberId, eventId: eventId),
          );
    } catch (e) {
      throw const ApiException.internalServerError(
        'Could not add event host.',
      );
    }

    unawaited(socket.sendUpdate(timetableId: foundEvent.timetableId));

    return Response.ok(jsonEncode('Successfully added new event host'));
  }

  @override
  Future<Response> remove(Request request) async {
    final User user = request.context['user']! as User;

    final Map<String, dynamic> body =
        RequestValidator.getBodyFromContext(request);

    final int id = body['id'] as int;

    final EventHost? eventHost = await (database.eventHosts.select()
          ..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();

    if (eventHost == null) {
      throw const ApiException.badRequest(
        'There is no event host with such id.',
      );
    }

    final Event? foundEvent = await database.getEvent(
      (tbl) => tbl.id.equals(eventHost.eventId),
    );

    if (foundEvent == null) {
      throw const ApiException.badRequest(
        'There is no event with such id.',
      );
    }

    final TimetableMember? foundMember = await database.getTimetableMember(
      (tbl) =>
          tbl.userId.equals(user.id) &
          tbl.timetableId.equals(foundEvent.timetableId),
    );

    if (foundMember == null || !foundMember.role.isAdmin) {
      throw const ApiException.forbidden(
        'You have no rights to edit events in that timetable',
      );
    }

    try {
      await database.eventHosts.deleteWhere(
        (tbl) => tbl.id.equals(id),
      );
    } catch (e) {
      throw const ApiException.internalServerError(
        'Could not remove event host.',
      );
    }

    unawaited(socket.sendUpdate(timetableId: foundEvent.timetableId));

    return Response.ok(jsonEncode('Successfully removed event host.'));
  }
}
