import 'package:shelf/shelf.dart';

abstract interface class TimetablesController {
  Future<Response> create(Request request);

  Future<Response> delete(Request request);

  Future<Response> update(Request request);

  Future<Response> leave(Request request);

  Future<Response> invitation(Request request, String code);

  Future<Response> updateMember(Request request);
}
