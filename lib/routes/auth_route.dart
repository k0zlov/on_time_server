import 'package:on_time_server/controllers/auth_controller/auth_controller.dart';
import 'package:on_time_server/middleware/middleware_extension.dart';
import 'package:on_time_server/middleware/validator_middleware.dart';
import 'package:on_time_server/routes/server_route.dart';
import 'package:on_time_server/utils/request_validator.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class AuthRoute extends ServerRoute {
  AuthRoute({
    required this.controller,
    required this.authMiddleware,
    super.middlewares,
  });

  final AuthController controller;

  final Middleware authMiddleware;

  @override
  String get name => 'auth';

  @override
  Router configureRouter(Router router) {
    const regParams = <ValidatorParameter<String>>[
      ValidatorParameter(name: 'name'),
      ValidatorParameter(name: 'lastName'),
      ValidatorParameter(name: 'email'),
      ValidatorParameter(name: 'password'),
    ];

    final Middleware regValidator = validatorMiddleware(bodyParams: regParams);

    const loginParams = <ValidatorParameter<String>>[
      ValidatorParameter(name: 'email'),
      ValidatorParameter(name: 'password'),
    ];

    // Middleware to validate login request body.
    final Middleware loginValidator = validatorMiddleware(
      bodyParams: loginParams,
    );

    return router
      ..getMw('/', controller.getUser, [authMiddleware])
      ..get('/activation/<activation>', controller.activation)
      ..get('/refresh', controller.refresh)
      ..postMw('/register', controller.register, [regValidator])
      ..postMw('/login', controller.login, [loginValidator])
      ..postMw('/logout', controller.logout, [authMiddleware]);
  }
}
