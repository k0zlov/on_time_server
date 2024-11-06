import 'package:on_time_server/models/timetable_model.dart';

enum TimetableSocketEventType { update, delete }

class TimetableSocketModel {
  TimetableSocketModel({
    required this.eventType,
    required this.data,
  });

  final TimetableSocketEventType eventType;

  final List<TimetableModel> data;

  Map<String, dynamic> toMap() {
    return {
      'eventType': eventType.name,
      'data': data.map((e) => e.toResponse()).toList(),
    };
  }
}
