part of 'register_dependencies.dart';

void _routes() {
  getIt
    ..registerLazySingleton<ServerRoute>(
      instanceName: 'auth-route',
      () => AuthRoute(
        controller: getIt(),
        authMiddleware: getIt(instanceName: 'auth-middleware'),
      ),
    )
    ..registerLazySingleton<ServerRoute>(
      instanceName: 'timetables-route',
      () => TimetablesRoute(
        socket: getIt(),
        controller: getIt(),
        middlewares: [getIt(instanceName: 'auth-middleware')],
      ),
    )
    ..registerLazySingleton<ServerRoute>(
      instanceName: 'events-route',
      () => EventsRoute(
        controller: getIt(),
        hostsController: getIt(),
        middlewares: [getIt(instanceName: 'auth-middleware')],
      ),
    );
}
