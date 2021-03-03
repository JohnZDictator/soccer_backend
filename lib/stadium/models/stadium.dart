import 'package:aqueduct/aqueduct.dart';

class Stadium extends ManagedObject<_Stadium> implements _Stadium {}

class _Stadium {
  @primaryKey
  int id;
  @Column(unique: true)
  String stadiumName;
}
