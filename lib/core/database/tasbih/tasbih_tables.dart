import 'package:drift/drift.dart';

class Tasbihs extends Table {
  TextColumn get zekr => text()();
  IntColumn get count => integer()();
  DateTimeColumn get date => dateTime().nullable()();
  IntColumn get dailyTarget => integer().nullable()();
  IntColumn get dailyCount => integer().nullable()();

  @override
  Set<Column<Object>>? get primaryKey => {zekr};
}
