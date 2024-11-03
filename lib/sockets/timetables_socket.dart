import 'dart:convert';

import 'package:on_time_server/database/database.dart';
import 'package:on_time_server/database/extensions/timetable_extension.dart';
import 'package:on_time_server/models/timetable_model.dart';
import 'package:on_time_server/sockets/server_socket.dart';
import 'package:shelf/shelf.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

enum TimetableSocketEventType { update, delete }

abstract class TimetablesSocket extends ServerSocket {
  Future<void> sendUpdate({
    required int timetableId,
    TimetableSocketEventType eventType = TimetableSocketEventType.update,
    int? userToDelete,
  });
}

class TimetablesSocketImpl extends TimetablesSocket {
  TimetablesSocketImpl({required this.database});

  final Database database;

  final Map<int, WebSocketChannel> sockets = {};

  @override
  Future<void> onConnection(
    WebSocketChannel webSocket,
    Request request,
  ) async {
    final User? user = request.context['user'] as User?;

    if (user == null) {
      await webSocket.sink.close(4001, 'Unauthorized.');
      return;
    }

    final List<TimetableModel> timetables = await database.getAllTimetables(
      userId: user.id,
    );

    webSocket.sink.add(
      jsonEncode([...timetables.map((e) => e.toResponse())]),
    );

    webSocket.stream.listen(
      (_) {},
      onDone: () {
        sockets.remove(user.id);
      },
    );

    sockets[user.id] = webSocket;
  }

  @override
  Future<void> sendUpdate({
    required int timetableId,
    TimetableSocketEventType eventType = TimetableSocketEventType.update,
    int? userToDelete,
  }) async {
    final TimetableModel? model = await database.getTimetable(
      (tbl) => tbl.id.equals(timetableId),
    );

    if (model == null) return;

    for (final TimetableMember m in model.members) {
      final WebSocketChannel? conn = sockets[m.userId];
      if (conn == null) continue;

      conn.sink.add(
        jsonEncode({
          'event': eventType.name,
          'data': model.toResponse(),
        }),
      );
    }
    if (userToDelete == null) return;

    final WebSocketChannel? conn = sockets[userToDelete];

    if (conn == null) return;

    conn.sink.add(
      jsonEncode({
        'event': TimetableSocketEventType.delete.name,
        'data': model.toResponse(),
      }),
    );
  }
}
