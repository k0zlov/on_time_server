part of 'register_dependencies.dart';

void _controllers() {
  getIt
    ..registerLazySingleton<AuthController>(
      () => AuthControllerImpl(
        database: getIt(),
        tokenService: getIt(),
        mailService: getIt(),
        activatinRedirectUrl: 'https://github.com/',
      ),
    )
    ..registerLazySingleton<TimetablesController>(
      () => TimetablesControllerImpl(
        database: getIt(),
        socket: getIt(),
        websiteBaseUrl: 'https://github.com/',
      ),
    )
    ..registerLazySingleton<EventsController>(
      () => EventsControllerImpl(
        database: getIt(),
        socket: getIt(),
      ),
    )
    ..registerLazySingleton<HostsController>(
      () => HostsControllerImpl(
        database: getIt(),
        socket: getIt(),
      ),
    );
}
