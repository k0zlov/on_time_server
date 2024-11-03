import 'package:on_time_server/database/database.dart';
import 'package:on_time_server/models/event_model.dart';

class TimetableModel {
  TimetableModel({
    required this.events,
    required this.timetable,
    required this.members,
  });

  final Timetable timetable;

  final List<TimetableMember> members;

  final List<EventModel> events;

  Map<String, dynamic> toResponse() {
    return {
      ...timetable.toJson(),
      'members': [...members.map((e) => e.toJson())],
      'events': [...events.map((e) => e.toResponse())],
    };
  }
}
