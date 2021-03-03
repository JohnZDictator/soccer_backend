import 'package:aqueduct/aqueduct.dart';

class Manager extends ManagedObject<_Manager> implements _Manager {}

class _Manager {
  @primaryKey
  int id;
  @Column()
  String managerName;
  @Column(unique: true)
  String clubId;
}
