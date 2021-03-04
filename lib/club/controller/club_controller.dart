import 'package:soccer_backend/club/models/club.dart';
import 'package:soccer_backend/soccer_backend.dart';

class ClubController extends ResourceController {
  ClubController(this.context) : assert(context != null);
  final ManagedContext context;

  @Operation.get()
  Future<Response> getAllClubs() async {
    final clubQuery = Query<Club>(context);
    final clubs = await clubQuery.fetch();
    return Response.ok(clubs);
  }

  @Operation.get('id')
  Future<Response> getClubById(@Bind.path('id') int id) async {
    final clubQuery = Query<Club>(context)..where((c) => c.id).equalTo(id);
    final club = await clubQuery.fetchOne();
    if (club == null) {
      return Response.notFound();
    }
    return Response.ok(club);
  }

  @Operation.post()
  Future<Response> postClub(@Bind.body(ignore: ['id']) Club club) async {
    final clubQuery = Query<Club>(context)..values = club;
    final insertClub = await clubQuery.insert();
    return Response.ok(insertClub);
  }

  @Operation.put('id')
  Future<Response> updateClub(
      @Bind.path('id') int id, @Bind.body(ignore: ['id']) Club club) async {
    final clubQuery = Query<Club>(context)
      ..where((c) => c.id).equalTo(id)
      ..values = club;
    final editClub = await clubQuery.update();
    return Response.ok(editClub);
  }

  @Operation.delete('id')
  Future<Response> deleteClub(@Bind.path('id') int id) async {
    final clubQuery = Query<Club>(context)..where((c) => c.id).equalTo(id);
    final removeClub = await clubQuery.delete();
    return Response.ok(removeClub);
  }
}
