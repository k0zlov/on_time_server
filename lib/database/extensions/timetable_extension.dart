import 'package:drift/drift.dart';
import 'package:on_time_server/database/database.dart';
import 'package:on_time_server/database/extensions/event_extension.dart';
import 'package:on_time_server/database/extensions/member_extension.dart';
import 'package:on_time_server/models/timetable_model.dart';
import 'package:on_time_server/tables/timetable_members.dart';

extension TimetableExtension on Database {
  Future<TimetableModel?> getTimetable(
    Expression<bool> Function($TimetablesTable) filter,
  ) async {
    final Timetable? timetable =
        await (timetables.select()..where(filter)).getSingleOrNull();

    if (timetable == null) {
      return null;
    }

    final TimetableModel model = TimetableModel(
      timetable: timetable,
      events: await getAllEvents(
        (tbl) => tbl.timetableId.equals(timetable.id),
      ),
      members: await getAllTimetableMembers(
        (tbl) => tbl.timetableId.equals(timetable.id),
      ),
    );

    return model;
  }

  Future<TimetableModel> createTimetable({
    required int userId,
    required TimetablesCompanion timetable,
  }) async {
    return transaction(() async {
      final Timetable table = await timetables.insertReturning(timetable);

      final TimetableMember member = await timetableMembers.insertReturning(
        TimetableMembersCompanion.insert(
          userId: userId,
          timetableId: table.id,
          role: const Value(TimetableMemberRoles.owner),
        ),
      );

      return TimetableModel(
        events: [],
        timetable: table,
        members: [member],
      );
    });
  }

  Future<List<TimetableModel>> getAllTimetables({
    required int userId,
  }) async {
    final List<TimetableMember> members = await getAllTimetableMembers(
      (tbl) => tbl.userId.equals(userId),
    );

    final List<int> timetableIds = members.map((e) => e.timetableId).toList();

    final List<Timetable> timetableList = await (timetables.select()
          ..where((tbl) => tbl.id.isIn(timetableIds)))
        .get();

    final List<TimetableModel> models = [];

    for (final Timetable t in timetableList) {
      models.add(
        TimetableModel(
          timetable: t,
          events: await getAllEvents(
            (tbl) => tbl.timetableId.equals(t.id),
          ),
          members: await getAllTimetableMembers(
            (tbl) => tbl.timetableId.equals(t.id),
          ),
        ),
      );
    }

    return models;
  }
}
