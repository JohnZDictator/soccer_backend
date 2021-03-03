import 'package:soccer_backend/rank_club/models/rank_club.dart';
import 'package:soccer_backend/soccer_backend.dart';

class RankClubController extends ResourceController {
  RankClubController(this.context) : assert(context != null);
  final ManagedContext context;

  @Operation.get()
  Future<Response> getAllClubRanks() async {}

  @Operation.get('id')
  Future<Response> getClubRankById(@Bind.path('id') int id) async {}

  @Operation.post()
  Future<Response> postClubRank(
      @Bind.body(ignore: ['id']) RankClub rankClub) async {}

  @Operation.put('id')
  Future<Response> updateClubRank(@Bind.path('id') int id) async {}

  @Operation.delete('id')
  Future<Response> deleteClubRank(@Bind.path('id') int id) async {}
}
