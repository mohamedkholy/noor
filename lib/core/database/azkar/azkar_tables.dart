import 'package:drift/drift.dart';

class Category extends Table {
  TextColumn get category => text()();
  TextColumn get search => text().nullable()();
  BoolColumn get isFavorite => boolean()();

  @override
  Set<Column> get primaryKey => {category};
}

class Azkar extends Table {
  TextColumn get category =>
      text().references(Category, #category, onUpdate: KeyAction.cascade)();

  TextColumn get zekr => text()();
  TextColumn get description => text().nullable()();
  IntColumn get count => integer().nullable()();
  TextColumn get reference => text().nullable()();
  TextColumn get search => text().nullable()();
}
