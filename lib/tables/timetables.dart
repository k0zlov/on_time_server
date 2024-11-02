import 'package:drift/drift.dart';

class Timetables extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text().withLength(min: 3)();

  TextColumn get description => text().nullable()();
}
