import 'package:on_time_server/di_container/register_dependencies.dart';
import 'package:on_time_server/server/server.dart';

Future<void> main() async {
  final ChatServer server = await registerDependencies();

  await server.run();
}
