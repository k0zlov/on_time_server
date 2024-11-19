import 'package:drift/drift.dart';

class Timetables extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text().withLength(min: 3)();

  TextColumn get description => text().nullable()();

  TextColumn get invitationCode => text().unique()();

  IntColumn get startTime => integer()();

  IntColumn get endTime => integer()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}
