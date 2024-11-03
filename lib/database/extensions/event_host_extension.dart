import 'package:drift/drift.dart';
import 'package:on_time_server/database/database.dart';

extension EventHostExtension on Database {
  Future<List<EventHost>> getAllHostEvents(
    Expression<bool> Function($EventHostsTable) filter,
  ) {
    return (eventHosts.select()..where(filter)).get();
  }
}
