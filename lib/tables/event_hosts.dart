import 'package:drift/drift.dart';
import 'package:on_time_server/tables/timetable_members.dart';

class EventHosts extends Table {
  IntColumn get id => integer().autoIncrement()();

  @ReferenceName('eventHostMembers')
  IntColumn get memberId => integer().references(TimetableMembers, #id)();

  IntColumn get eventId => integer()();
}