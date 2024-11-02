import 'package:on_time_server/routes/server_route.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf_web_socket/shelf_web_socket.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class AuthRoute extends ServerRoute {
  AuthRoute({
    super.middlewares,
  });

  @override
  String get name => 'auth';

  @override
  Router configureRouter(Router router) {
    return router
      ..get(
        '/',
        webSocketHandler((WebSocketChannel webSocket) {
          webSocket.stream.listen((message) {
            webSocket.sink.add('Echo $message');
          });
        }),
      );
  }
}
