import 'package:shelf/shelf.dart';

abstract interface class EventsController {
  Future<Response> create(Request request);

  Future<Response> update(Request request);

  Future<Response> delete(Request request);
}
