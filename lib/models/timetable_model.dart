import 'package:on_time_server/database/database.dart';
import 'package:on_time_server/models/event_model.dart';
import 'package:on_time_server/models/member_model.dart';

class TimetableModel {
  TimetableModel({
    required this.events,
    required this.timetable,
    required this.members,
  });

  final Timetable timetable;

  final List<MemberModel> members;

  final List<EventModel> events;

  Map<String, dynamic> toResponse() {
    return {
      ...timetable.toJson(),
      'members': [...members.map((e) => e.toResponse())],
      'events': [...events.map((e) => e.toResponse())],
    };
  }
}
