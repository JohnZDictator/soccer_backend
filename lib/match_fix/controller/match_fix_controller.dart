import 'package:soccer_backend/match_fix/models/match_fix.dart';
import 'package:soccer_backend/soccer_backend.dart';

class MatchFixController extends ResourceController {
  MatchFixController(this.context) : assert(context != null);
  final ManagedContext context;

  @Operation.get()
  Future<Response> getAllMatchFixs() async {
    final matchFixQuery = Query<MatchFix>(context);
    final matchFixs = await matchFixQuery.fetch();
    return Response.ok(matchFixs);
  }

  @Operation.get('id')
  Future<Response> getMatchFixById(@Bind.path('id') int id) async {
    final matchFixQuery = Query<MatchFix>(context)
      ..where((m) => m.id).equalTo(id);
    final matchFix = await matchFixQuery.fetchOne();
    if (matchFix == null) {
      return Response.notFound();
    }
    return Response.ok(matchFix);
  }

  @Operation.post()
  Future<Response> postMatchFix(
      @Bind.body(ignore: ['id']) MatchFix matchFix) async {
    final matchFixQuery = Query<MatchFix>(context)..values = matchFix;
    final insertMatchFix = await matchFixQuery.insert();
    return Response.ok(insertMatchFix);
  }

  @Operation.put('id')
  Future<Response> updateMatchFix(@Bind.path('id') int id,
      @Bind.body(ignore: ['id']) MatchFix matchFix) async {
    final matchFixQuery = Query<MatchFix>(context)
      ..where((m) => m.id).equalTo(id)
      ..values = matchFix;
    final editMatchFix = matchFixQuery.update();
    return Response.ok(editMatchFix);
  }

  @Operation.delete('id')
  Future<Response> deleteMatchFix(@Bind.path('id') int id) async {
    final matchFixQuery = Query<MatchFix>(context)
      ..where((m) => m.id).equalTo(id);
    final removeMatchFix = matchFixQuery.delete();
    return Response.ok(removeMatchFix);
  }
}
