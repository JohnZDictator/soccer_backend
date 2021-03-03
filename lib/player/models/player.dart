import 'package:aqueduct/aqueduct.dart';

enum PLAYERPOSITION {
  goalKeeper,
  defense,
  midfielder,
  rightWinger,
  leftWinger,
  attacker,
}

class Player extends ManagedObject<_Player> implements _Player {}

class _Player {
  @primaryKey
  int id;
  @Column(unique: true)
  String playerName;
  @Column()
  String playerNumber;
  @Column()
  PLAYERPOSITION playerPosition;
  @Column()
  String clubId;
}
