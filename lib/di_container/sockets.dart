part of 'register_dependencies.dart';

void _sockets() {
  getIt.registerLazySingleton<TimetablesSocket>(
    () => TimetablesSocketImpl(database: getIt()),
  );
}
