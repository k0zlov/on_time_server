import 'package:on_time_server/database/database.dart';

class MemberModel {
  const MemberModel({
    required this.name,
    required this.lastName,
    required this.member,
  });

  final String name;
  final String lastName;
  final TimetableMember member;

  Map<String, dynamic> toResponse() {
    return {
      ...member.toJson(),
      'name': name,
      'lastName': lastName,
    };
  }
}
