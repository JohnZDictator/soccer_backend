import 'package:aqueduct/aqueduct.dart';

enum CARD { yellowCard, redCard }

class GameAnalysis extends ManagedObject<_GameAnalysis>
    implements _GameAnalysis {}

class _GameAnalysis {
  @primaryKey
  int id;
  @Column()
  int score1;
  @Column()
  int score2;
  @Column()
  int penality1;
  @Column()
  int freeKick1;
  @Column()
  double ballPossesion1;
  @Column()
  int penality2;
  @Column()
  int freeKick2;
  @Column()
  double ballPossesion2;
  // @Column(unique: true)
  // String yelloCard;
  // @Column(unique: true)
  // String redCard;
  @Column(unique: true)
  String matchFixId;
}
