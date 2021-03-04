import 'package:soccer_backend/soccer_backend.dart';
import 'package:soccer_backend/stadium/models/stadium.dart';

class StadiumController extends ResourceController {
  StadiumController(this.context) : assert(context != null);
  final ManagedContext context;

  @Operation.get()
  Future<Response> getAllStadiums() async {
    final stadiumQuery = Query<Stadium>(context);
    final stadiums = stadiumQuery.fetch();
    return Response.ok(stadiums);
  }

  @Operation.get('id')
  Future<Response> getStadiumById(@Bind.path('id') int id) async {
    final stadiumQuery = Query<Stadium>(context)
      ..where((s) => s.id).equalTo(id);
    final stadium = stadiumQuery.fetchOne();
    if (stadium == null) {
      return Response.notFound();
    }
    return Response.ok(stadium);
  }

  @Operation.post()
  Future<Response> postStadium(
      @Bind.body(ignore: ['id']) Stadium stadium) async {
    final stadiumQuery = Query<Stadium>(context)..values = stadium;
    final insertStadium = stadiumQuery.insert();
    return Response.ok(insertStadium);
  }

  @Operation.put('id')
  Future<Response> updateStadium(@Bind.path('id') int id,
      @Bind.body(ignore: ['id']) Stadium stadium) async {
    final stadiumQuery = Query<Stadium>(context)
      ..where((s) => s.id).equalTo(id)
      ..values = stadium;
    final editStadium = stadiumQuery.update();
    return Response.ok(editStadium);
  }

  @Operation.delete('id')
  Future<Response> deleteStadium(@Bind.path('id') int id) async {
    final stadiumQuery = Query<Stadium>(context)
      ..where((s) => s.id).equalTo(id);
    final removeStadium = stadiumQuery.delete();
    return Response.ok(removeStadium);
  }
}
