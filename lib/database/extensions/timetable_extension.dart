import 'package:drift/drift.dart';
import 'package:on_time_server/database/database.dart';
import 'package:on_time_server/models/timetable_model.dart';
import 'package:on_time_server/tables/timetable_members.dart';

extension TimetableExtension on Database {
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
}
