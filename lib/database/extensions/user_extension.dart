import 'package:drift/drift.dart';
import 'package:on_time_server/database/database.dart';

extension UserExtension on Database {
  Future<User?> getUserOrNull(
    Expression<bool> Function($UsersTable) filter,
  ) async {
    return (users.select()..where(filter)).getSingleOrNull();
  }
}
