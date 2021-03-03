import 'package:soccer_backend/club/models/club.dart';
import 'package:soccer_backend/soccer_backend.dart';

class ClubController extends ResourceController {
  ClubController(this.context) : assert(context != null);
  final ManagedContext context;

  @Operation.get()
  Future<Response> getAllClubs() async {}

  @Operation.get('id')
  Future<Response> getClubById(@Bind.path('id') int id) async {}

  @Operation.post()
  Future<Response> postClub(@Bind.body(ignore: ['id']) Club club) async {}

  @Operation.put('id')
  Future<Response> updateClub(@Bind.path('id') int id) async {}

  @Operation.delete('id')
  Future<Response> deleteClub(@Bind.path('id') int id) async {}
}
