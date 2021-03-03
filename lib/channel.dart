import 'package:soccer_backend/club/controller/controller.dart';
import 'package:soccer_backend/game_analysis/game_analysis.dart';
import 'package:soccer_backend/player/controller/player_controller.dart';
import 'package:soccer_backend/rank_club/controller/rank_club_controller.dart';
import 'package:soccer_backend/stadium/controller/stadium_controller.dart';

import 'manager/controller/manager_controller.dart';
import 'match_fix/controller/match_fix_controller.dart';
import 'soccer_backend.dart';

/// This type initializes an application.
///
/// Override methods in this class to set up routes and initialize services like
/// database connections. See http://aqueduct.io/docs/http/channel/.
class SoccerBackendChannel extends ApplicationChannel {
  ManagedContext context;

  /// Initialize services in this method.
  ///
  /// Implement this method to initialize services, read values from [options]
  /// and any other initialization required before constructing [entryPoint].
  ///
  /// This method is invoked prior to [entryPoint] being accessed.
  @override
  Future prepare() async {
    logger.onRecord.listen(
        (rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));

    final config = SoccerBackendConfig(options.configurationFilePath);
    final dataModel = ManagedDataModel.fromCurrentMirrorSystem();
    final persistentStore = PostgreSQLPersistentStore.fromConnectionInfo(
      config.database.username,
      config.database.password,
      config.database.host,
      config.database.port,
      config.database.databaseName,
    );
    context = ManagedContext(dataModel, persistentStore);
  }

  /// Construct the request channel.
  ///
  /// Return an instance of some [Controller] that will be the initial receiver
  /// of all [Request]s.
  ///
  /// This method is invoked after [prepare].
  @override
  Controller get entryPoint {
    final router = Router();

    // Prefer to use `link` instead of `linkFunction`.
    // See: https://aqueduct.io/docs/http/request_controller/
    // router.route("/example").linkFunction((request) async {
    //   return Response.ok({"key": "value"});
    // });

    router.route('/clubs/[:id]').link(() => ClubController(context));
    router
        .route('/game_analysis/[:id]')
        .link(() => GameAnalysisController(context));
    router.route('/manager/[:id]').link(() => ManagerController(context));
    router.route('/match_fix/[:id]').link(() => MatchFixController(context));
    router.route('/player/[:id]').link(() => PlayerController(context));
    router.route('/rank_club/[:id]').link(() => RankClubController(context));
    router.route('/stadium/[:id]').link(() => StadiumController(context));

    return router;
  }
}

class SoccerBackendConfig extends Configuration {
  SoccerBackendConfig(String path) : super.fromFile(File(path));

  DatabaseConfiguration database;
}
