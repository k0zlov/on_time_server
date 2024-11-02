import 'package:shelf/shelf.dart';

class AuthController {
  Future<Response> first(Request request) async {
    return Response.ok('Nice !');
  }
}
