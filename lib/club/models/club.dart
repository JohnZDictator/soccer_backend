import 'package:aqueduct/aqueduct.dart';

class Club extends ManagedObject<_Club> implements _Club {}

class _Club {
  @primaryKey
  int id;
  @Column(unique: true)
  String clubName;
}
