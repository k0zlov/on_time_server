import 'dart:async';

import 'package:shelf/shelf.dart';
import 'package:shelf_web_socket/shelf_web_socket.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

abstract class ServerSocket {
  void onConnection(WebSocketChannel webSocket, Request request);

  FutureOr<Response> connect(Request request) {
    return webSocketHandler(
      (WebSocketChannel ws) => onConnection(ws, request),
    )(request);
  }
}
