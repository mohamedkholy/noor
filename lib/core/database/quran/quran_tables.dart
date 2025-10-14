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

class Lines extends Table {
  IntColumn get pageNumber => integer().named('page_number')();
  IntColumn get lineNumber => integer().named('line_number')();
  TextColumn get lineType => text().named('line_type')();
  IntColumn get isCentered => integer().named('is_centered')();
  IntColumn get firstWordId => integer().named('first_word_id').nullable()();
  IntColumn get lastWordId => integer().named('last_word_id').nullable()();
  IntColumn get surahNumber => integer().named('surah_number').nullable()();

  @override
  Set<Column> get primaryKey => {pageNumber, lineNumber};
}

class Words extends Table {
  IntColumn get id => integer().named('id')();
  TextColumn get location => text().named('location')();
  IntColumn get surah => integer().named('surah')();
  IntColumn get ayah => integer().named('ayah')();
  IntColumn get word => integer().named('word')();
  TextColumn get wordText => text().named('text')();
  IntColumn get juz => integer().named('juz')();

  @override
  Set<Column> get primaryKey => {id};
}
