import 'package:shelf/shelf.dart';

abstract interface class AuthController {
  Future<Response> getUser(Request request);

  Future<Response> register(Request request);

  Future<Response> login(Request request);

  Future<Response> logout(Request request);

  Future<Response> refresh(Request request);

  Future<Response> activation(Request request, String code);
}
