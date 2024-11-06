import 'dart:async';

import 'package:drift/drift.dart';
import 'package:on_time_server/controllers/events_controller/events_controller.dart';
import 'package:on_time_server/database/database.dart';
import 'package:on_time_server/database/extensions/event_extension.dart';
import 'package:on_time_server/database/extensions/member_extension.dart';
import 'package:on_time_server/exceptions/api_exception.dart';
import 'package:on_time_server/sockets/timetables_socket.dart';
import 'package:on_time_server/utils/date_time_extension.dart';
import 'package:on_time_server/utils/request_validator.dart';
import 'package:shelf/shelf.dart';

class EventsControllerImpl implements EventsController {
  EventsControllerImpl({
    required this.database,
    required this.socket,
  });

  final Database database;

  final TimetablesSocket socket;

  @override
  Future<Response> create(Request request) async {
    final User user = request.context['user']! as User;

    final Map<String, dynamic> body =
        RequestValidator.getBodyFromContext(request);

    final String title = body['title'] as String;
    final String? description = body['description'] as String?;
    final int timetableId = body['timetableId'] as int;
    final int day = body['day'] as int;
    final int startTime = body['startTime'] as int;
    final int endTime = body['endTime'] as int;
    final List<int>? hostIds =
        (body['hosts'] as List?)?.map((e) => e as int).toList();

    if (title.length < 3) {
      throw const ApiException.badRequest(
        'Title should be at least 3 symbols length.',
      );
    }

    if (day < 0 || day > 6) {
      throw const ApiException.badRequest(
        'Day parameter should be between 0 and 7.',
      );
    }

    if (endTime <= startTime) {
      throw const ApiException.badRequest(
        'End time should be later than start time.',
      );
    }
    if (startTime > 86400 || startTime < 0) {
      throw const ApiException.badRequest('Invalid start time.');
    }

    if (endTime > 86400 || endTime < 0) {
      throw const ApiException.badRequest('Invalid end time.');
    }

    final Timetable? timetable = await (database.timetables.select()
          ..where(
            (tbl) => tbl.id.equals(timetableId),
          ))
        .getSingleOrNull();

    if (timetable == null) {
      throw const ApiException.badRequest(
        'There is no timetable with such ID.',
      );
    }

    final TimetableMember? member = await database.getTimetableMember(
      (tbl) => tbl.userId.equals(user.id) & tbl.timetableId.equals(timetableId),
    );

    if (member == null || !member.role.isAdmin) {
      throw const ApiException.forbidden(
        'You have no rights to create events in that timetable',
      );
    }

    final bool canCreate = await database.validateEventsForDay(
      timetableId: timetableId,
      day: day,
      startTime: startTime,
      endTime: endTime,
    );

    if (!canCreate) {
      throw const ApiException.badRequest(
          'There already exists with such time');
    }

    try {
      await database.transaction(() async {
        final Event event = await database.events.insertReturning(
          EventsCompanion.insert(
            timetableId: timetableId,
            description: Value(description),
            title: title,
            day: day,
            endTime: DateTimeExtension.fromSecondsSinceMidnight(endTime),
            startTime: DateTimeExtension.fromSecondsSinceMidnight(startTime),
          ),
        );

        List<TimetableMember>? members;

        if (hostIds != null && hostIds.isNotEmpty) {
          members = await database.getAllTimetableMembers(
            (tbl) => tbl.timetableId.equals(timetableId) & tbl.id.isIn(hostIds),
          );
        }

        if (members != null && members.isNotEmpty) {
          await database.batch((b) {
            b.insertAll(
              database.eventHosts,
              [
                ...members!.map(
                  (e) => EventHostsCompanion.insert(
                    memberId: e.id,
                    eventId: event.id,
                  ),
                ),
              ],
            );
          });
        }
      });
    } catch (e) {
      print(e);
      throw const ApiException.internalServerError(
        'Could not create a new event',
      );
    }

    unawaited(socket.sendUpdate(timetableId: timetableId));

    return Response.ok('Successfully created an event.');
  }

  @override
  Future<Response> update(Request request) async {
    final User user = request.context['user']! as User;

    final Map<String, dynamic> body =
        RequestValidator.getBodyFromContext(request);

    final int eventId = body['id'] as int;
    final String? title = body['title'] as String?;
    final String? description = body['description'] as String?;
    final int? day = body['day'] as int?;
    final int? startTime = body['startTime'] as int?;
    final int? endTime = body['endTime'] as int?;

    final Event? event = await (database.events.select()
          ..where((tbl) => tbl.id.equals(eventId)))
        .getSingleOrNull();

    if (event == null) {
      throw const ApiException.badRequest('Event not found.');
    }

    final TimetableMember? member = await database.getTimetableMember(
      (tbl) =>
          tbl.userId.equals(user.id) &
          tbl.timetableId.equals(event.timetableId),
    );

    if (member == null || !member.role.isAdmin) {
      throw const ApiException.forbidden(
        'You have no rights to update events in that timetable',
      );
    }

    if (title != null && title.length < 3) {
      throw const ApiException.badRequest(
        'Title should be at least 3 symbols length.',
      );
    }

    if (startTime != null) {
      if (startTime > 86400 || startTime < 0) {
        throw const ApiException.badRequest('Invalid start time.');
      }
    }

    if (endTime != null) {
      if (endTime > 86400 || endTime < 0) {
        throw const ApiException.badRequest('Invalid end time.');
      }
    }

    final Event newEvent = event.copyWith(
      title: title,
      description: Value(description ?? event.description),
      day: day,
      startTime: startTime == null
          ? null
          : DateTimeExtension.fromSecondsSinceMidnight(startTime),
      endTime: endTime == null
          ? null
          : DateTimeExtension.fromSecondsSinceMidnight(endTime),
    );

    if (newEvent.endTime.toSecondsSinceMidnight() <=
        newEvent.startTime.toSecondsSinceMidnight()) {
      throw const ApiException.badRequest(
        'Start time should be earlier than end time.',
      );
    }

    try {
      await database.events.update().replace(newEvent);
    } on ApiException {
      rethrow;
    } catch (e) {
      throw const ApiException.internalServerError(
        'Could not update event.',
      );
    }

    unawaited(socket.sendUpdate(timetableId: event.timetableId));

    return Response.ok('Successfully updated event.');
  }

  @override
  Future<Response> delete(Request request) async {
    final User user = request.context['user']! as User;

    final Map<String, dynamic> body =
        RequestValidator.getBodyFromContext(request);

    final int eventId = body['id'] as int;

    final Event? event = await (database.events.select()
          ..where((tbl) => tbl.id.equals(eventId)))
        .getSingleOrNull();

    if (event == null) {
      throw const ApiException.badRequest('Event not found.');
    }

    final TimetableMember? member = await database.getTimetableMember(
      (tbl) =>
          tbl.userId.equals(user.id) &
          tbl.timetableId.equals(event.timetableId),
    );

    if (member == null || !member.role.isAdmin) {
      throw const ApiException.forbidden(
        'You have no rights to delete events in that timetable',
      );
    }

    try {
      await database.events.deleteOne(event);
    } on ApiException {
      rethrow;
    } catch (e) {
      throw const ApiException.internalServerError(
        'Could not update timetable.',
      );
    }

    unawaited(socket.sendUpdate(timetableId: event.timetableId));

    return Response.ok('Successfully deleted event.');
  }
}
