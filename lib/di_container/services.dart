part of 'register_dependencies.dart';

void _services() {
  final String accessSecret = _env.getOrElse(
    'JWT_ACCESS_SECRET',
    _orElse,
  );
  final String refreshSecret = _env.getOrElse(
    'JWT_REFRESH_SECRET',
    _orElse,
  );

  final JwtClient accessClient = JwtClient(
    secretKey: SecretKey(accessSecret),
    expiresIn: const Duration(hours: 10),
  );

  final JwtClient refreshClient = JwtClient(
    secretKey: SecretKey(refreshSecret),
    expiresIn: const Duration(days: 7),
  );

  final String port = _env.getOrElse('SMTP_PORT', _orElse);
  final String host = _env.getOrElse('SMTP_HOST', _orElse);
  final String login = _env.getOrElse('SMTP_LOGIN', _orElse);
  final String password = _env.getOrElse('SMTP_PASSWORD', _orElse);
  final String senderName = _env.getOrElse('SENDER_NAME', _orElse);
  final String senderEmail = _env.getOrElse('SENDER_ADDRESS', _orElse);
  final String baseUrl = _env.getOrElse('BASE_URL', _orElse);

  getIt
    ..registerLazySingleton<TokenService>(
      () => TokenServiceImpl(
        refreshClient: refreshClient,
        accessClient: accessClient,
      ),
    )
    ..registerLazySingleton<MailService>(
      () => MailServiceImpl(
        port: int.tryParse(port) ?? 587,
        host: host,
        login: login,
        password: password,
        senderName: senderName,
        senderEmail: senderEmail,
        baseUrl: baseUrl,
      ),
    );
}
