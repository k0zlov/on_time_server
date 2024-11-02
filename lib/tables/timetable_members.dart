import 'package:drift/drift.dart';
import 'package:on_time_server/tables/timetables.dart';
import 'package:on_time_server/tables/users.dart';

enum TimetableMemberRoles {
  owner,
  admin,
  member,
}

class TimetableMembers extends Table {
  IntColumn get id => integer().autoIncrement()();

  @ReferenceName('membersToUsers')
  IntColumn get userId =>
      integer().references(Users, #id, onDelete: KeyAction.cascade)();

  @ReferenceName('memberTimetables')
  IntColumn get timetableId => integer().references(Timetables, #id)();

  TextColumn get role => textEnum<TimetableMemberRoles>().withDefault(
        Constant(TimetableMemberRoles.member.name),
      )();
}
