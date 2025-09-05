import 'package:drift/drift.dart';

class Hadiths extends Table {
  IntColumn get number => integer()(); // required
  TextColumn get kitab => text()(); // required
  TextColumn get arab => text()(); // required
  TextColumn get terjemah => text()(); // required

  @override
  Set<Column> get primaryKey => {number, kitab};
}

class DailyHadiths extends Table {
  IntColumn get day => integer()();
  TextColumn get kitabName => text()();
  IntColumn get number => integer()();

  @override
  Set<Column> get primaryKey => {day, number};
}
