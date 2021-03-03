import 'package:aqueduct/aqueduct.dart';

class RankClub extends ManagedObject<_RankClub> implements _RankClub {}

class _RankClub {
  @primaryKey
  int id;
  @Column()
  int goalScored;
  @Column()
  int goalLostScored;
  @Column()
  int winNumber;
  @Column()
  int lostNumber;
  @Column()
  int totalGamePlayed;
  @Column()
  int totalGameNumber;
  @Column(indexed: true)
  int points;
  @Column()
  String clubId;
}
