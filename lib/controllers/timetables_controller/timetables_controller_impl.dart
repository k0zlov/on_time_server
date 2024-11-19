import 'dart:async';
import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:on_time_server/controllers/timetables_controller/timetables_controller.dart';
import 'package:on_time_server/database/database.dart';
import 'package:on_time_server/database/extensions/member_extension.dart';
import 'package:on_time_server/database/extensions/timetable_extension.dart';
import 'package:on_time_server/exceptions/api_exception.dart';
import 'package:on_time_server/models/timetable_model.dart';
import 'package:on_time_server/models/timetable_socket_model.dart';
import 'package:on_time_server/sockets/timetables_socket.dart';
import 'package:on_time_server/utils/request_validator.dart';
import 'package:shelf/shelf.dart';
import 'package:uuid/v4.dart';

class TimetablesControllerImpl implements TimetablesController {
  const TimetablesControllerImpl({
    required this.websiteBaseUrl,
    required this.database,
    required this.socket,
  });

  final TimetablesSocket socket;

  final Database database;

  final String websiteBaseUrl;

  @override
  Future<Response> create(Request request) async {
    final User user = request.context['user']! as User;

    final Map<String, dynamic> body =
        RequestValidator.getBodyFromContext(request);

    final String title = body['title'] as String;
    final String? description = body['description'] as String?;
    final int rawStartTime = body['startTime'] as int;
    final int rawEndTime = body['endTime'] as int;

    if (rawStartTime > 86400 || rawStartTime < 0) {
      throw const ApiException.badRequest('Invalid start time.');
    }
    if (rawEndTime > 86400 || rawEndTime < 0) {
      throw const ApiException.badRequest('Invalid end time.');
    }

    if (title.length < 3) {
      throw const ApiException.badRequest(
        'Timetable title should be at least 3 symbols length.',
      );
    }

    if (rawStartTime >= rawEndTime) {
      throw const ApiException.badRequest(
        'Start time should be earlier than end time',
      );
    }

    final TimetableModel? timetable;

    try {
      timetable = await database.createTimetable(
        user: user,
        timetable: TimetablesCompanion.insert(
          title: title,
          description: Value(description),
          invitationCode: const UuidV4().generate(),
          startTime: rawStartTime,
          endTime: rawEndTime,
        ),
      );
    } catch (e) {
      throw const ApiException.internalServerError(
        'Could not create timetable.',
      );
    }

    return Response.ok(jsonEncode(timetable.toResponse()));
  }

  @override
  Future<Response> delete(Request request) async {
    final User user = request.context['user']! as User;

    final Map<String, dynamic> body =
        RequestValidator.getBodyFromContext(request);

    final int timetableId = body['id'] as int;

    final TimetableMember? member = await database.getTimetableMember(
      (tbl) => tbl.userId.equals(user.id) & tbl.timetableId.equals(timetableId),
    );

    if (member == null) {
      throw const ApiException.badRequest(
        'There is no timetable member with such ids.',
      );
    }

    if (!member.role.isOwner) {
      throw const ApiException.forbidden(
        'Only owner can delete timetable.',
      );
    }

    await socket.sendUpdate(
      timetableId: timetableId,
      eventType: TimetableSocketEventType.delete,
    );

    try {
      await database.timetables.deleteWhere(
        (tbl) => tbl.id.equals(timetableId),
      );
    } catch (e) {
      print(e);
      throw const ApiException.internalServerError(
        'Could not delete timetable.',
      );
    }

    return Response.ok('Successfully deleted timetable.');
  }

  @override
  Future<Response> update(Request request) async {
    final User user = request.context['user']! as User;

    final Map<String, dynamic> body =
        RequestValidator.getBodyFromContext(request);

    final int timetableId = body['id'] as int;
    final String? newTitle = body['title'] as String?;
    final String? newDescription = body['description'] as String?;
    final int? newStartTime = body['startTime'] as int?;
    final int? newEndTime = body['endTime'] as int?;

    if (newTitle != null && newTitle.length < 3) {
      throw const ApiException.badRequest(
        'Timetable title should be at least 3 symbols length.',
      );
    }

    if (newStartTime != null) {
      if (newStartTime > 86400 || newStartTime < 0) {
        throw const ApiException.badRequest('Invalid start time.');
      }
    }

    if (newEndTime != null) {
      if (newEndTime > 86400 || newEndTime < 0) {
        throw const ApiException.badRequest('Invalid end time.');
      }
    }

    final TimetableMember? member = await database.getTimetableMember(
      (tbl) => tbl.userId.equals(user.id) & tbl.timetableId.equals(timetableId),
    );

    if (member == null) {
      throw const ApiException.badRequest('No timetable found with such ID.');
    }

    if (!member.role.isOwner) {
      throw const ApiException.forbidden(
        'Only the owner can update the timetable.',
      );
    }

    final Timetable? timetable = await (database.timetables.select()
          ..where((tbl) => tbl.id.equals(timetableId)))
        .getSingleOrNull();

    if (timetable == null) {
      throw const ApiException.internalServerError('Could not find timetable.');
    }

    final newTimetable = timetable.copyWith(
      title: newTitle,
      description: Value(newDescription),
      startTime: newStartTime,
      endTime: newEndTime,
    );

    if (newTimetable.endTime <= newTimetable.startTime) {
      throw const ApiException.badRequest(
        'Start time should be earlier than end time.',
      );
    }

    try {
      final bool updated =
          await database.timetables.update().replace(newTimetable);

      if (!updated) {
        throw const ApiException.internalServerError(
          'Failed to update timetable.',
        );
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw const ApiException.internalServerError(
        'Could not update timetable.',
      );
    }
    unawaited(socket.sendUpdate(timetableId: timetableId));

    return Response.ok(jsonEncode('Timetable updated successfully.'));
  }

  @override
  Future<Response> leave(Request request) async {
    final User user = request.context['user']! as User;

    final Map<String, dynamic> body =
        RequestValidator.getBodyFromContext(request);

    final int timetableId = body['id'] as int;

    final TimetableMember? member = await database.getTimetableMember(
      (tbl) => tbl.userId.equals(user.id) & tbl.timetableId.equals(timetableId),
    );

    if (member == null) {
      throw const ApiException.badRequest(
        'User is not a member of this timetable.',
      );
    }

    if (member.role.isOwner) {
      throw const ApiException.forbidden('Owner cannot leave the timetable.');
    }

    try {
      await database.timetableMembers.deleteWhere(
        (tbl) =>
            tbl.userId.equals(user.id) & tbl.timetableId.equals(timetableId),
      );
    } catch (e) {
      throw const ApiException.internalServerError(
        'Could not leave timetable.',
      );
    }

    unawaited(
      socket.sendUpdate(timetableId: timetableId, userToDelete: user.id),
    );

    return Response.ok(jsonEncode('Successfully left the timetable.'));
  }

  @override
  Future<Response> invitation(Request request, String code) async {
    final User user = request.context['user']! as User;

    final Timetable? timetable = await (database.timetables.select()
          ..where((tbl) => tbl.invitationCode.equals(code)))
        .getSingleOrNull();

    if (timetable == null) {
      throw const ApiException.badRequest(
        'There is no timetable with such invitation code.',
      );
    }

    final TimetableMember? foundMember = await database.getTimetableMember(
      (tbl) =>
          tbl.userId.equals(user.id) & tbl.timetableId.equals(timetable.id),
    );

    if (foundMember != null) {
      return Response.found(websiteBaseUrl);
    }

    try {
      await database.timetableMembers.insertOne(
        TimetableMembersCompanion.insert(
          userId: user.id,
          timetableId: timetable.id,
        ),
      );
    } catch (e) {
      throw const ApiException.internalServerError(
        'Could not add user to timetable.',
      );
    }

    unawaited(socket.sendUpdate(timetableId: timetable.id));

    return Response.found(websiteBaseUrl);
  }
}
