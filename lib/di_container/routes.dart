part of 'register_dependencies.dart';

void _routes() {
  getIt.registerLazySingleton<ServerRoute>(
    instanceName: 'auth-route',
    () => AuthRoute(
      controller: getIt(),
      authMiddleware: getIt(instanceName: 'auth-middleware'),
    ),
  );
}
