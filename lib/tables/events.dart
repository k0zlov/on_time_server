import 'package:drift/drift.dart';
import 'package:drift_postgres/drift_postgres.dart';
import 'package:on_time_server/tables/timetables.dart';

class Events extends Table {
  IntColumn get id => integer().autoIncrement()();

  @ReferenceName('eventTimetables')
  IntColumn get timetableId => integer().references(Timetables, #id)();

  TextColumn get title => text()();

  TimestampColumn get endTime => customType(PgTypes.timestampWithTimezone)();

  TimestampColumn get startTime => customType(PgTypes.timestampWithTimezone)();
}
