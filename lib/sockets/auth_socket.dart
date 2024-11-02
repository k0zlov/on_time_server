import 'package:shelf/shelf.dart';
import 'package:shelf_web_socket/shelf_web_socket.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class AuthSocket {
  Handler test() {
    return webSocketHandler((WebSocketChannel webSocket) {
      webSocket.stream.listen((message) {
        webSocket.sink.add('Echo $message');
      });
    });
  }
}
