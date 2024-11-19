import 'dart:async';
import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:on_time_server/controllers/auth_controller/auth_controller.dart';
import 'package:on_time_server/database/database.dart';
import 'package:on_time_server/database/extensions/user_extension.dart';
import 'package:on_time_server/exceptions/api_exception.dart';
import 'package:on_time_server/services/mail_service.dart';
import 'package:on_time_server/services/token_service.dart';
import 'package:on_time_server/tables/users.dart';
import 'package:on_time_server/utils/cookie.dart';
import 'package:on_time_server/utils/request_validator.dart';
import 'package:shelf/shelf.dart';
import 'package:uuid/v4.dart';

class AuthControllerImpl implements AuthController {
  AuthControllerImpl({
    required this.database,
    required this.tokenService,
    required this.mailService,
    required this.activatinRedirectUrl,
  });

  final Database database;

  final TokenService tokenService;

  final MailService mailService;

  final String activatinRedirectUrl;

  @override
  Future<Response> getUser(Request request) async {
    final User user = request.context['user']! as User;
    return Response.ok(jsonEncode(user.toResponse()));
  }

  @override
  Future<Response> register(Request request) async {
    final Map<String, dynamic> body =
        RequestValidator.getBodyFromContext(request);

    final String name = body['name'] as String;
    final String lastName = body['lastName'] as String;
    final String email = body['email'] as String;
    final String password = body['password'] as String;

    final User? foundUser = await database.getUserOrNull(
      (tbl) => tbl.email.equals(email),
    );

    if (foundUser != null) {
      throw const ApiException.badRequest(
        'User with such email already exists',
      );
    }

    final String activationCode = const UuidV4().generate();

    String? accessToken;
    String? refreshToken;

    try {
      await database.transaction<void>(() async {
        final User user = await database.users.insertReturning(
          UsersCompanion.insert(
            name: name,
            lastName: lastName,
            password: password,
            email: email,
            refreshToken: const UuidV4().generate(),
            activationCode: activationCode,
          ),
        );

        accessToken = tokenService.generateAccessToken(user.id);

        refreshToken = tokenService.generateRefreshToken(user.id);

        final User newUser = user.copyWith(
          refreshToken: refreshToken,
        );

        await database.users.update().replace(newUser);
      });
    } catch (e) {
      print(e);

      throw const ApiException.internalServerError(
        'Could not register user',
      );
    }

    if (accessToken == null || refreshToken == null) {
      throw const ApiException.internalServerError(
        'Could not generate tokens',
      );
    }

    final Map<String, dynamic> response = {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };

    unawaited(
      mailService.sendActivationLetter(
        email: email,
        activationCode: activationCode,
      ),
    );

    return Response.ok(jsonEncode(response));
  }

  @override
  Future<Response> login(Request request) async {
    final Map<String, dynamic> body = RequestValidator.getBodyFromContext(
      request,
    );

    final String email = body['email'] as String;
    final String password = body['password'] as String;

    final User? user = await database.getUserOrNull(
      (tbl) => tbl.email.equals(email),
    );

    if (user == null) {
      const errorMessage = 'There is no user with such email';
      throw const ApiException.badRequest(errorMessage);
    }

    if (user.password != password) {
      const errorMessage = 'Wrong password';
      throw const ApiException.badRequest(errorMessage);
    }

    final String refreshToken = tokenService.generateRefreshToken(user.id);
    final String accessToken = tokenService.generateAccessToken(user.id);

    final User newUser = user.copyWith(refreshToken: refreshToken);

    final bool result = await database.users.update().replace(newUser);

    if (!result) {
      const errorMessage = 'Could not refresh tokens';
      throw const ApiException.internalServerError(errorMessage);
    }

    final Map<String, String> response = {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };

    return Response.ok(jsonEncode(response));
  }

  @override
  Future<Response> logout(Request request) async {
    final User user = request.context['user']! as User;

    if (user.refreshToken.isEmpty) {
      return Response.ok(jsonEncode('User has already been logged out'));
    }

    final User newUser = user.copyWith(refreshToken: const UuidV4().generate());

    final bool result = await database.users.update().replace(newUser);

    if (!result) {
      throw const ApiException.internalServerError('Could not log out user');
    }

    return Response.ok(jsonEncode('Successfully logged out'));
  }

  @override
  Future<Response> refresh(Request request) async {
    final String? token = extractCookie(request, 'refreshToken');

    if (token == null) {
      const errorMessage = 'RefreshToken missing';
      throw const ApiException.unauthorized(errorMessage);
    }

    if (!tokenService.validateRefreshToken(token)) {
      const errorMessage = 'Refresh token is not valid';
      throw const ApiException.unauthorized(errorMessage);
    }

    final User? user = await database.getUserOrNull(
      (tbl) => tbl.refreshToken.equals(token),
    );

    if (user == null) {
      const errorMessage = 'Owner of refresh token was not found';
      throw const ApiException.unauthorized(errorMessage);
    }

    final String refreshToken = tokenService.generateRefreshToken(user.id);
    final String accessToken = tokenService.generateAccessToken(user.id);

    final User newUser = user.copyWith(refreshToken: refreshToken);

    await database.users.update().replace(newUser);

    final Map<String, dynamic> responseBody = {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };

    return Response.ok(jsonEncode(responseBody));
  }

  @override
  Future<Response> activation(Request request, String code) async {
    final User? user = await database.getUserOrNull(
      (tbl) => tbl.activationCode.equals(code),
    );

    if (user == null) {
      throw const ApiException.badRequest(
        'There is no user with such activation code.',
      );
    }

    if (user.isActivated) {
      throw const ApiException.badRequest(
        'This user is already activated.',
      );
    }

    final User newUser = user.copyWith(isActivated: true);

    try {
      await database.users.update().replace(newUser);
    } catch (e) {
      throw const ApiException.internalServerError(
        'Could not activate user.',
      );
    }

    return Response.found(activatinRedirectUrl);
  }
}
