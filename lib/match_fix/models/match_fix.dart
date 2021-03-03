import 'package:aqueduct/aqueduct.dart';

class MatchFix extends ManagedObject<_MatchFix> implements _MatchFix {}

class _MatchFix {
  @primaryKey
  int id;
  @Column(unique: true)
  String club1Id;
  @Column(unique: true)
  String club2Id;
  @Column()
  DateTime date;
  @Column()
  DateTime time;

  // we need stadium here
  @Column()
  String stadiumId;
}
