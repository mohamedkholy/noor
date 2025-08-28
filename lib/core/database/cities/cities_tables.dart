import 'package:drift/drift.dart';

class Cities extends Table{
  TextColumn get name => text()();
  RealColumn get lat => real()();
  RealColumn get lng => real()();
  TextColumn get country => text()();
}