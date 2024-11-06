import 'package:drift/drift.dart';
import 'package:on_time_server/database/database.dart';
import 'package:on_time_server/database/extensions/event_host_extension.dart';
import 'package:on_time_server/models/event_model.dart';
import 'package:on_time_server/utils/date_time_extension.dart';

extension EventExtension on Database {
  Future<Event?> getEvent(
    Expression<bool> Function($EventsTable) filter,
  ) {
    return (events.select()..where(filter)).getSingleOrNull();
  }

  Future<List<EventModel>> getAllEvents(
    Expression<bool> Function($EventsTable) filter,
  ) async {
    final List<Event> eventList = await (events.select()..where(filter)).get();

    final List<EventModel> models = [];

    for (final Event e in eventList) {
      models.add(
        EventModel(
          event: e,
          hosts: await getAllHostEvents(
            (tbl) => tbl.eventId.equals(e.id),
          ),
        ),
      );
    }

    return models;
  }

  Future<bool> validateEventsForDay({
    required int timetableId,
    required int day,
    required int startTime,
    required int endTime,
  }) async {
    final List<Event> eventList = await (events.select()
          ..where(
            (tbl) => tbl.timetableId.equals(timetableId) & tbl.day.equals(day),
          )
          ..orderBy([(tbl) => OrderingTerm.asc(tbl.startTime)]))
        .get();

    for (final Event event in eventList) {
      final int eventStart = event.startTime.toSecondsSinceMidnight();
      final int eventEnd = event.endTime.toSecondsSinceMidnight();

      if (startTime >= eventStart && startTime <= eventEnd) {
        return false;
      }

      if (endTime >= eventStart && endTime <= eventEnd) {
        return false;
      }
    }

    return true;
  }
}
