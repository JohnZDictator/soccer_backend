import 'package:soccer_backend/game_analysis/models/game_analysis.dart';
import 'package:soccer_backend/soccer_backend.dart';

class GameAnalysisController extends ResourceController {
  GameAnalysisController(this.context) : assert(context != null);
  final ManagedContext context;

  @Operation.get()
  Future<Response> getAllGameAnalysis() async {}

  @Operation.get('id')
  Future<Response> getGameAnalysisById(@Bind.path('id') int id) async {}

  @Operation.post()
  Future<Response> postGameAnalysis(
      @Bind.body(ignore: ['id']) GameAnalysis gameAnalysis) async {}

  @Operation.put('id')
  Future<Response> updateGameAnalysis(@Bind.path('id') int id) async {}

  @Operation.delete('id')
  Future<Response> deleteGameAnalysis(@Bind.path('id') int id) async {}
}
