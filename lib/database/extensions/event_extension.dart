import 'package:drift/drift.dart';
import 'package:on_time_server/database/database.dart';
import 'package:on_time_server/database/extensions/event_host_extension.dart';
import 'package:on_time_server/models/event_model.dart';

extension EventExtension on Database {
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
}
