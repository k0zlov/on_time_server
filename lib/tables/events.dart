import 'package:drift/drift.dart';
import 'package:on_time_server/tables/timetables.dart';

class Events extends Table {
  IntColumn get id => integer().autoIncrement()();

  @ReferenceName('eventTimetables')
  IntColumn get timetableId => integer().references(
        Timetables,
        #id,
        onDelete: KeyAction.cascade,
      )();

  TextColumn get title => text()();

  TextColumn get description => text().nullable()();

  IntColumn get day => integer()();

  IntColumn get startTime => integer()();

  IntColumn get endTime => integer()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}
