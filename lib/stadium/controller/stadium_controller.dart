import 'package:soccer_backend/soccer_backend.dart';
import 'package:soccer_backend/stadium/models/stadium.dart';

class StadiumController extends ResourceController {
  StadiumController(this.context) : assert(context != null);
  final ManagedContext context;

  @Operation.get()
  Future<Response> getAllStadiums() async {}

  @Operation.get('id')
  Future<Response> getStadiumById(@Bind.path('id') int id) async {}

  @Operation.post()
  Future<Response> postStadium(
      @Bind.body(ignore: ['id']) Stadium stadium) async {}

  @Operation.put('id')
  Future<Response> updateStadium(@Bind.path('id') int id) async {}

  @Operation.delete('id')
  Future<Response> deleteStadium(@Bind.path('id') int id) async {}
}
