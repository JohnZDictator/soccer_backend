import 'package:soccer_backend/rank_club/models/rank_club.dart';
import 'package:soccer_backend/soccer_backend.dart';

class RankClubController extends ResourceController {
  RankClubController(this.context) : assert(context != null);
  final ManagedContext context;

  @Operation.get()
  Future<Response> getAllClubRanks() async {
    final rankQuery = Query<RankClub>(context);
    final ranks = rankQuery.fetch();
    return Response.ok(ranks);
  }

  @Operation.get('id')
  Future<Response> getClubRankById(@Bind.path('id') int id) async {
    final rankQuery = Query<RankClub>(context)
      ..where((cr) => cr.id).equalTo(id);
    final rank = rankQuery.fetchOne();
    return Response.ok(rank);
  }

  @Operation.post()
  Future<Response> postClubRank(
      @Bind.body(ignore: ['id']) RankClub rankClub) async {
    final rankQuery = Query<RankClub>(context)..values = rankClub;
    final insertRank = rankQuery.insert();
    return Response.ok(insertRank);
  }

  @Operation.put('id')
  Future<Response> updateClubRank(@Bind.path('id') int id,
      @Bind.body(ignore: ['id']) RankClub rankClub) async {
    final rankQuery = Query<RankClub>(context)
      ..where((cr) => cr.id).equalTo(id)
      ..values = rankClub;
    final editRank = rankQuery.update();
    return Response.ok(editRank);
  }

  @Operation.delete('id')
  Future<Response> deleteClubRank(@Bind.path('id') int id) async {
    final rankQuery = Query<RankClub>(context)
      ..where((cr) => cr.id).equalTo(id);
    final removeRank = rankQuery.delete();
    return Response.ok(removeRank);
  }
}
