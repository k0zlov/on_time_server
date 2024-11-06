import 'package:shelf/shelf.dart';

abstract interface class HostsController {
  Future<Response> add(Request request);

  Future<Response> remove(Request request);
}
