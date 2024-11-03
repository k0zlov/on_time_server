part of 'register_dependencies.dart';

void _controllers() {
  getIt.registerLazySingleton<AuthController>(
    () => AuthControllerImpl(
      database: getIt(),
      tokenService: getIt(),
      activatinRedirectUrl: 'https://github.com/',
    ),
  );
}
