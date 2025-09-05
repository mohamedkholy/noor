import 'package:drift/drift.dart';

class Cities extends Table {
  TextColumn get name => text()();
  TextColumn get searchNames => text().nullable()();
  RealColumn get lat => real()();
  RealColumn get lng => real()();
  TextColumn get country => text()();
}
