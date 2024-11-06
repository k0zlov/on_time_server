import 'dart:convert';

import 'package:on_time_server/database/database.dart';
import 'package:on_time_server/database/extensions/timetable_extension.dart';
import 'package:on_time_server/models/timetable_model.dart';
import 'package:on_time_server/models/timetable_socket_model.dart';
import 'package:on_time_server/sockets/server_socket.dart';
import 'package:shelf/shelf.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

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

    final TimetableSocketModel response = TimetableSocketModel(
      eventType: TimetableSocketEventType.update,
      data: timetables,
    );

    webSocket.sink.add(jsonEncode(response.toMap()));

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

      final TimetableSocketModel response = TimetableSocketModel(
        eventType: eventType,
        data: [model],
      );

      conn.sink.add(
        jsonEncode(response.toMap()),
      );
    }
    if (userToDelete == null) return;

    final WebSocketChannel? conn = sockets[userToDelete];

    if (conn == null) return;

    final TimetableSocketModel response = TimetableSocketModel(
      eventType: TimetableSocketEventType.delete,
      data: [model],
    );

    conn.sink.add(
      jsonEncode(response.toMap()),
    );
  }
}
