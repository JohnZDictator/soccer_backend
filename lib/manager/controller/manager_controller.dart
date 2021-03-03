import 'package:soccer_backend/manager/models/manager.dart';
import 'package:soccer_backend/soccer_backend.dart';

class ManagerController extends ResourceController {
  ManagerController(this.context) : assert(context != null);
  final ManagedContext context;

  @Operation.get()
  Future<Response> getAllManagers() async {}

  @Operation.get('id')
  Future<Response> getManagerById(@Bind.path('id') int id) async {}

  @Operation.post()
  Future<Response> postManager(
      @Bind.body(ignore: ['id']) Manager manager) async {}

  @Operation.put('id')
  Future<Response> updateManager(@Bind.path('id') int id) async {}

  @Operation.delete('id')
  Future<Response> deleteManager(@Bind.path('id') int id) async {}
}
