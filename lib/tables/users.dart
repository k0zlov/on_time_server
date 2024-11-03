import 'package:drift/drift.dart';
import 'package:drift_postgres/drift_postgres.dart';
import 'package:on_time_server/database/database.dart';

class Users extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(min: 3)();

  TextColumn get lastName => text()();

  TextColumn get email => text().unique()();

  TextColumn get activationCode => text().unique()();

  TextColumn get password => text().withLength(min: 6)();

  TextColumn get refreshToken => text().unique()();

  BoolColumn get isActivated => boolean().withDefault(const Constant(false))();

  TimestampColumn get createdAt =>
      customType(PgTypes.timestampWithTimezone).withDefault(
        const FunctionCallExpression('now', []),
      )();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}

/// Extension on [User] to convert it to a JSON response format.
extension UserDataExtension on User {
  /// Converts the [User] instance to a map for JSON response.
  Map<String, dynamic> toResponse() {
    return {
      ...toJson(),
      'createdAt': createdAt.dateTime.toIso8601String(),
    }
      ..remove('refreshToken')
      ..remove('activationCode')
      ..remove('password');
  }
}
