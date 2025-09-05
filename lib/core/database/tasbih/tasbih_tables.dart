import 'package:drift/drift.dart';

class Tasbihs extends Table {
  TextColumn get zekr => text()();
  IntColumn get count => integer()();

  @override
  Set<Column<Object>>? get primaryKey => {zekr};
}
