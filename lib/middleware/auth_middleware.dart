import 'package:on_time_server/database/database.dart';
import 'package:on_time_server/database/extensions/user_extension.dart';
import 'package:on_time_server/exceptions/api_exception.dart';
import 'package:on_time_server/services/token_service.dart';
import 'package:shelf/shelf.dart';

/// Middleware for handling authentication by verifying access tokens.
Middleware authMiddleware({
  required TokenService tokenService,
  required Database database,
}) {
  return (Handler innerHandler) {
    return (Request request) async {
      final bool isSocketConnection = request.headers['Upgrade'] == 'websocket';

      final String? accessToken;

      if (isSocketConnection) {
        accessToken = request.url.queryParameters['token'];
      } else {
        accessToken = request.headers['Authorization']?.split(' ')[1];
      }

      User? user;

      try {
        // Retrieve the user ID from the access token.
        final int userId = tokenService.getUserIdFromAccessToken(accessToken!)!;

        // Retrieve the user from database by userId
        user = await database.getUserOrNull((tbl) => tbl.id.equals(userId));
        if (user == null) throw Exception();
      } catch (e) {
        if (!isSocketConnection) {
          // Throw an unauthorized exception if any error occurs.
          throw const ApiException.unauthorized();
        }
      }

      // Create a new request with the user added to the context.
      final newRequest = request.change(
        context: {
          'user': user,
          ...request.context,
        },
      );

      // Call the inner handler with the new request.
      return await innerHandler(newRequest);
    };
  };
}
