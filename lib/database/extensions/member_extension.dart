import 'package:drift/drift.dart';
import 'package:on_time_server/database/database.dart';

extension MemberExtension on Database {
  Future<TimetableMember?> getTimetableMember(
    Expression<bool> Function($TimetableMembersTable) filter,
  ) {
    return (timetableMembers.select()..where(filter)).getSingleOrNull();
  }

  Future<List<TimetableMember>> getAllTimetableMembers(
    Expression<bool> Function($TimetableMembersTable) filter,
  ) {
    return (timetableMembers.select()..where(filter)).get();
  }
}
