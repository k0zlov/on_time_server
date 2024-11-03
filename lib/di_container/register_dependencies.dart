import 'dart:io';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:dotenv/dotenv.dart';
import 'package:drift_postgres/drift_postgres.dart';
import 'package:get_it/get_it.dart';
import 'package:on_time_server/controllers/auth_controller/auth_controller.dart';
import 'package:on_time_server/controllers/auth_controller/auth_controller_impl.dart';
import 'package:on_time_server/controllers/timetables_controller/timetables_controller.dart';
import 'package:on_time_server/controllers/timetables_controller/timetables_controller_impl.dart';
import 'package:on_time_server/database/database.dart';
import 'package:on_time_server/middleware/auth_middleware.dart';
import 'package:on_time_server/middleware/error_middleware.dart';
import 'package:on_time_server/middleware/headers_middleware.dart';
import 'package:on_time_server/routes/auth_route.dart';
import 'package:on_time_server/routes/server_route.dart';
import 'package:on_time_server/routes/timetables_route.dart';
import 'package:on_time_server/server/server.dart';
import 'package:on_time_server/server/server_config.dart';
import 'package:on_time_server/services/mail_service.dart';
import 'package:on_time_server/services/token_service.dart';
import 'package:on_time_server/utils/jwt_client.dart';
import 'package:postgres/postgres.dart';
import 'package:shelf/shelf.dart';

part 'controllers.dart';
part 'database.dart';
part 'middleware.dart';
part 'routes.dart';
part 'services.dart';

/// GetIt instance
final GetIt getIt = GetIt.instance;

/// Loading environment variables
final DotEnv _env = DotEnv(includePlatformEnvironment: true)
  ..load(['.env']);

String _orElse() => '';

Future<ChatServer> registerDependencies() async {
  await _database();

  _services();
  _controllers();
  _middleware();
  _routes();

  return _server();
}

ChatServer _server() {
  final ip = InternetAddress.anyIPv4;
  final port = int.parse(Platform.environment['PORT'] ?? '8080');

  final ChatServer server = ChatServer(
    routes: <ServerRoute>[
      getIt(instanceName: 'auth-route'),
      getIt(instanceName: 'timetables-route'),
    ],
    middlewares: <Middleware>[
      logRequests(),
      errorMiddleware(),
      getIt(instanceName: 'headers-middleware'),
    ],
    config: ServerConfig(
      ip: ip,
      port: port,
    ),
  );

  return server;
}
