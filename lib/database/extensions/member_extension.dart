import 'package:drift/drift.dart';
import 'package:on_time_server/database/database.dart';
import 'package:on_time_server/models/member_model.dart';

extension MemberExtension on Database {
  Future<TimetableMember?> getTimetableMember(
    Expression<bool> Function($TimetableMembersTable) filter,
  ) {
    return (timetableMembers.select()..where(filter)).getSingleOrNull();
  }

  Future<List<TimetableMember>> getAllTimetableMembers(
    Expression<bool> Function($TimetableMembersTable) filter,
  ) {
    return (timetableMembers.select()..where(filter)).get();
  }

  Future<List<MemberModel>> getAllMemberModels(
    Expression<bool> Function($TimetableMembersTable) filter,
  ) async {
    final List<TimetableMember> members = await getAllTimetableMembers(filter);

    final List<int> ids = members.map((e) => e.userId).toList();

    final List<User> userList =
        await (users.select()..where((tbl) => tbl.id.isIn(ids))).get();

    final List<MemberModel> result = [];

    for (final TimetableMember member in members) {
      final User user = userList.firstWhere((e) => member.userId == e.id);

      result.add(
        MemberModel(
          name: user.name,
          lastName: user.lastName,
          member: member,
        ),
      );
    }

    return result;
  }
}
