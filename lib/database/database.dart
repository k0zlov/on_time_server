import 'package:drift/drift.dart';
import 'package:drift_postgres/drift_postgres.dart';

part 'database.g.dart';

/// Drift database class which manages the connection to the database
/// and provides access to the tables defined in the application.
///
/// This class extends the generated _$Database class to include
/// custom methods and properties.
@DriftDatabase()
class Database extends _$Database {
  /// Constructs a [Database] instance using the provided database connection.
  Database(super.e);

  /// The schema version of the database.
  ///
  /// This is used by Drift to perform schema migrations when the database is updated.
  /// Increment this version whenever there are changes to the table definitions or
  /// new tables are added.
  @override
  int get schemaVersion => 1;
}
