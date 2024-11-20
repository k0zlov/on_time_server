part of 'register_dependencies.dart';

void _controllers() {
  getIt
    ..registerLazySingleton<AuthController>(
      () => AuthControllerImpl(
        database: getIt(),
        tokenService: getIt(),
        mailService: getIt(),
        activatinRedirectUrl: _env.getOrElse('SITE_URL', _orElse),
      ),
    )
    ..registerLazySingleton<TimetablesController>(
      () => TimetablesControllerImpl(
        database: getIt(),
        socket: getIt(),
        websiteBaseUrl: _env.getOrElse('SITE_URL', _orElse),
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
