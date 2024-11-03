import 'package:on_time_server/database/database.dart';

class EventModel {
  EventModel({
    required this.event,
    required this.hosts,
  });

  final Event event;

  final List<EventHost> hosts;

  Map<String, dynamic> toResponse() {
    return {
      ...event.toJson(),
      'hosts': [...hosts.map((e) => e.toJson())],
    };
  }
}
