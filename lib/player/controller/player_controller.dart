import 'package:soccer_backend/player/models/player.dart';
import 'package:soccer_backend/soccer_backend.dart';

class PlayerController extends ResourceController {
  PlayerController(this.context) : assert(context != null);
  final ManagedContext context;

  @Operation.get()
  Future<Response> getAllPlayers() async {}

  @Operation.get('id')
  Future<Response> getPlayerById(@Bind.path('id') int id) async {}

  @Operation.post()
  Future<Response> postPlayer(@Bind.body(ignore: ['id']) Player player) async {}

  @Operation.put('id')
  Future<Response> updatePlayer(@Bind.path('id') int id) async {}

  @Operation.delete('id')
  Future<Response> deletePlayer(@Bind.path('id') int id) async {}
}
