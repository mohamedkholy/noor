import 'package:drift/drift.dart';

class NearMosques extends Table {
  TextColumn get name => text()();
  TextColumn get address => text().nullable()();
  RealColumn get lat => real()();
  RealColumn get lng => real()();
  RealColumn get distance => real()();
  TextColumn get route => text()();
}
