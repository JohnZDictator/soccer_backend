import 'package:soccer_backend/player/models/player.dart';
import 'package:soccer_backend/soccer_backend.dart';

class PlayerController extends ResourceController {
  PlayerController(this.context) : assert(context != null);
  final ManagedContext context;

  @Operation.get()
  Future<Response> getAllPlayers() async {
    final playerQuery = Query<Player>(context);
    final players = playerQuery.fetch();
    return Response.ok(players);
  }

  @Operation.get('id')
  Future<Response> getPlayerById(@Bind.path('id') int id) async {
    final playerQuery = Query<Player>(context)..where((p) => p.id).equalTo(id);
    final player = playerQuery.fetchOne();
    if (player == null) {
      return Response.notFound();
    }
    return Response.ok(player);
  }

  @Operation.post()
  Future<Response> postPlayer(@Bind.body(ignore: ['id']) Player player) async {
    final playerQuery = Query<Player>(context)..values = player;
    final insertPlayer = playerQuery.insert();
    return Response.ok(insertPlayer);
  }

  @Operation.put('id')
  Future<Response> updatePlayer(
      @Bind.path('id') int id, @Bind.body(ignore: ['id']) Player player) async {
    final playerQuery = Query<Player>(context)
      ..where((p) => p.id).equalTo(id)
      ..values = player;
    final editPlayer = playerQuery.update();
    return Response.ok(editPlayer);
  }

  @Operation.delete('id')
  Future<Response> deletePlayer(@Bind.path('id') int id) async {
    final playerQuery = Query<Player>(context)..where((p) => p.id).equalTo(id);
    final removePlayer = playerQuery.delete();
    return Response.ok(removePlayer);
  }
}
