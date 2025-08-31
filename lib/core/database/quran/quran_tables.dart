import 'package:drift/drift.dart';

class Surahs extends Table {
  IntColumn get number => integer()();
  TextColumn get nameAr => text()();
  TextColumn get nameEn => text()();
  TextColumn get nameTransliteration => text()();
  TextColumn get revelationPlaceAr => text()();
  TextColumn get revelationPlaceEn => text()();
  IntColumn get versesCount => integer()();
  IntColumn get pageNumber => integer()();


  @override
  Set<Column> get primaryKey => {number};
}

class Verses extends Table {
  IntColumn get surahNumber => integer()();
  TextColumn get surahName => text()(); 
  IntColumn get number => integer()();
  TextColumn get textAr => text()();
  TextColumn get textEn => text()();
  IntColumn get juz => integer()();
  IntColumn get page => integer()();
  IntColumn get newJuz => integer()();

  @override
  Set<Column> get primaryKey => {surahNumber, number};
}


class DailyVerses extends Table {
  IntColumn get day => integer()();
  IntColumn get surahNumber => integer()();
  IntColumn get number => integer()();

  @override
  Set<Column> get primaryKey => {day, surahNumber, number};
}