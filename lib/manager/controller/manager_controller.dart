import 'package:soccer_backend/manager/models/manager.dart';
import 'package:soccer_backend/soccer_backend.dart';

class ManagerController extends ResourceController {
  ManagerController(this.context) : assert(context != null);
  final ManagedContext context;

  @Operation.get()
  Future<Response> getAllManagers() async {
    final managerQuery = Query<Manager>(context);
    final managers = await managerQuery.fetch();
    return Response.ok(managers);
  }

  @Operation.get('id')
  Future<Response> getManagerById(@Bind.path('id') int id) async {
    final managerQuery = Query<Manager>(context)
      ..where((m) => m.id).equalTo(id);
    final manager = await managerQuery.fetchOne();
    if (manager == null) {
      return Response.notFound();
    }
    return Response.ok(manager);
  }

  @Operation.post()
  Future<Response> postManager(
      @Bind.body(ignore: ['id']) Manager manager) async {
    final managerQuery = Query<Manager>(context)..values = manager;
    final insertManager = await managerQuery.insert();
    return Response.ok(insertManager);
  }

  @Operation.put('id')
  Future<Response> updateManager(@Bind.path('id') int id,
      @Bind.body(ignore: ['id']) Manager manager) async {
    final managerQuery = Query<Manager>(context)
      ..where((m) => m.id).equalTo(id)
      ..values = manager;
    final editManager = await managerQuery.update();
    return Response.ok(editManager);
  }

  @Operation.delete('id')
  Future<Response> deleteManager(@Bind.path('id') int id) async {
    final managerQuery = Query<Manager>(context)..where((m) => m.id);
    final removeManager = await managerQuery.delete();
    return Response.ok(removeManager);
  }
}
