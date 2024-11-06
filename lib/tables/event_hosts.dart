import 'package:drift/drift.dart';
import 'package:on_time_server/tables/events.dart';
import 'package:on_time_server/tables/timetable_members.dart';

class EventHosts extends Table {
  IntColumn get id => integer().autoIncrement()();

  @ReferenceName('eventHostMembers')
  IntColumn get memberId => integer().references(
        TimetableMembers,
        #id,
        onDelete: KeyAction.cascade,
      )();

  @ReferenceName('eventHostEvent')
  IntColumn get eventId => integer().references(
        Events,
        #id,
        onDelete: KeyAction.cascade,
      )();

  @override
  List<Set<Column<Object>>>? get uniqueKeys => [
        {memberId, eventId},
      ];

  @override
  Set<Column<Object>>? get primaryKey => {id};
}
