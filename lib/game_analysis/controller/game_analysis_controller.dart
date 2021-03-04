import 'package:soccer_backend/game_analysis/models/game_analysis.dart';
import 'package:soccer_backend/soccer_backend.dart';

class GameAnalysisController extends ResourceController {
  GameAnalysisController(this.context) : assert(context != null);
  final ManagedContext context;

  @Operation.get()
  Future<Response> getAllGameAnalysis() async {
    final analysisQuery = Query<GameAnalysis>(context);
    final analysis = await analysisQuery.fetch();
    return Response.ok(analysis);
  }

  @Operation.get('id')
  Future<Response> getGameAnalysisById(@Bind.path('id') int id) async {
    final analysisQuery = Query<GameAnalysis>(context)
      ..where((g) => g.id).equalTo(id);
    final analysis = await analysisQuery.fetchOne();
    if (analysis == null) {
      return Response.notFound();
    }
    return Response.ok(analysis);
  }

  @Operation.post()
  Future<Response> postGameAnalysis(
      @Bind.body(ignore: ['id']) GameAnalysis gameAnalysis) async {
    final analysisQuery = Query<GameAnalysis>(context)..values = gameAnalysis;
    final insertAnalysis = await analysisQuery.insert();
    return Response.ok(insertAnalysis);
  }

  @Operation.put('id')
  Future<Response> updateGameAnalysis(@Bind.path('id') int id,
      @Bind.body(ignore: ['id']) GameAnalysis gameAnalysis) async {
    final analysisQuery = Query<GameAnalysis>(context)
      ..where((g) => g.id).equalTo(id)
      ..values = gameAnalysis;
    final editAnalysis = await analysisQuery.update();
    return Response.ok(editAnalysis);
  }

  @Operation.delete('id')
  Future<Response> deleteGameAnalysis(@Bind.path('id') int id) async {
    final analysisQuery = Query<GameAnalysis>(context)
      ..where((g) => g.id).equalTo(id);
    final removeAnalysis = await analysisQuery.delete();
    return Response.ok(removeAnalysis);
  }
}
