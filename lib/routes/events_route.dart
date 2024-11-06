import 'package:on_time_server/controllers/events_controller/events_controller.dart';
import 'package:on_time_server/controllers/hosts_controller/hosts_controller.dart';
import 'package:on_time_server/middleware/middleware_extension.dart';
import 'package:on_time_server/middleware/validator_middleware.dart';
import 'package:on_time_server/routes/server_route.dart';
import 'package:on_time_server/utils/request_validator.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class EventsRoute extends ServerRoute {
  EventsRoute({
    required this.controller,
    required this.hostsController,
    super.middlewares,
  });

  final EventsController controller;

  final HostsController hostsController;

  @override
  String get name => 'events';

  @override
  Router configureRouter(Router router) {
    const createParams = <ValidatorParameter<Object>>[
      ValidatorParameter<String>(name: 'title'),
      ValidatorParameter<String>(name: 'description', nullable: true),
      ValidatorParameter<int>(name: 'timetableId'),
      ValidatorParameter<int>(name: 'day'),
      ValidatorParameter<int>(name: 'startTime'),
      ValidatorParameter<int>(name: 'endTime'),
      ValidatorParameter<List<dynamic>>(name: 'hosts', nullable: true),
    ];

    final Middleware createMw = validatorMiddleware(bodyParams: createParams);

    const updateParams = <ValidatorParameter<Object>>[
      ValidatorParameter<int>(name: 'id'),
      ValidatorParameter<String>(name: 'title', nullable: true),
      ValidatorParameter<String>(name: 'description', nullable: true),
      ValidatorParameter<int>(name: 'day', nullable: true),
      ValidatorParameter<int>(name: 'startTime', nullable: true),
      ValidatorParameter<int>(name: 'endTime', nullable: true),
    ];

    final Middleware updateMw = validatorMiddleware(bodyParams: updateParams);

    const deleteParams = <ValidatorParameter<int>>[
      ValidatorParameter(name: 'id'),
    ];

    final Middleware deleteMw = validatorMiddleware(bodyParams: deleteParams);

    const addParams = <ValidatorParameter<int>>[
      ValidatorParameter(name: 'eventId'),
      ValidatorParameter(name: 'memberId'),
    ];

    final Middleware addMw = validatorMiddleware(bodyParams: addParams);

    const removeParams = <ValidatorParameter<int>>[
      ValidatorParameter(name: 'id'),
    ];

    final Middleware removeMw = validatorMiddleware(bodyParams: removeParams);

    return router
      ..postMw('/create', controller.create, [createMw])
      ..postMw('/hosts/add', hostsController.add, [addMw])
      ..putMw('/update', controller.update, [updateMw])
      ..deleteMw('/delete', controller.delete, [deleteMw])
      ..deleteMw('/hosts/remove', hostsController.remove, [removeMw]);
  }
}
