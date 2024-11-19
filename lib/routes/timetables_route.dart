import 'package:on_time_server/controllers/timetables_controller/timetables_controller.dart';
import 'package:on_time_server/middleware/middleware_extension.dart';
import 'package:on_time_server/middleware/validator_middleware.dart';
import 'package:on_time_server/routes/server_route.dart';
import 'package:on_time_server/sockets/timetables_socket.dart';
import 'package:on_time_server/utils/request_validator.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class TimetablesRoute extends ServerRoute {
  TimetablesRoute({
    required this.socket,
    required this.controller,
    super.middlewares,
  });

  final TimetablesSocket socket;

  final TimetablesController controller;

  @override
  String get name => 'timetables';

  @override
  Router configureRouter(Router router) {
    const createParams = <ValidatorParameter<Object>>[
      ValidatorParameter<String>(name: 'title'),
      ValidatorParameter<String>(name: 'description', nullable: true),
      ValidatorParameter<int>(name: 'startTime'),
      ValidatorParameter<int>(name: 'endTime'),
    ];

    final Middleware createMw = validatorMiddleware(bodyParams: createParams);

    const deleteAndLeaveParams = <ValidatorParameter<int>>[
      ValidatorParameter(name: 'id'),
    ];

    final Middleware deleteLeaveMw = validatorMiddleware(
      bodyParams: deleteAndLeaveParams,
    );

    const updateParams = <ValidatorParameter<Object>>[
      ValidatorParameter<int>(name: 'id'),
      ValidatorParameter<String>(name: 'title', nullable: true),
      ValidatorParameter<String>(name: 'description', nullable: true),
      ValidatorParameter<int>(name: 'startTime', nullable: true),
      ValidatorParameter<int>(name: 'endTime', nullable: true),
    ];

    final Middleware updateMw = validatorMiddleware(bodyParams: updateParams);

    const updateMemberParams = <ValidatorParameter<Object>>[
      ValidatorParameter<int>(name: 'timetableId'),
      ValidatorParameter<int>(name: 'memberId'),
      ValidatorParameter<String>(name: 'role'),
    ];

    final Middleware updateMemberMw = validatorMiddleware(
      bodyParams: updateMemberParams,
    );

    return router
      ..get('/socket', socket.connect)
      ..get('/invitation/<code>', controller.invitation)
      ..putMw('/update', controller.update, [updateMw])
      ..postMw('/create', controller.create, [createMw])
      ..postMw('/updateMember', controller.updateMember, [updateMemberMw])
      ..postMw('/leave', controller.leave, [deleteLeaveMw])
      ..deleteMw('/delete', controller.delete, [deleteLeaveMw]);
  }
}
