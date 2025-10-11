import 'package:drift/drift.dart';
import 'package:flutter/material.dart' hide Page;
import 'package:injectable/injectable.dart';
import 'package:noor/core/database/quran/quran_database.dart';
import 'package:noor/core/database/quran_lines/quran_lines_database.dart';

@Injectable()
class QuranRepo {
  final QuranDatabase _db;
  final QuranLinesDatabase _linesDb;
  QuranRepo(this._db, this._linesDb);

  Future<List<Surah>> getSurahs() async => await (_db.select(_db.surahs)).get();

  Future<List<Verse>> getPageVerses({required int page}) async =>
      await (_db.select(_db.verses)..where((t) => t.page.equals(page))).get();

  Future<Surah> getSurahDetails({required int surahNumber}) async =>
      (await (_db.select(
        _db.surahs,
      )..where((t) => t.number.equals(surahNumber))).get()).single;

  Future<List<List<Verse>>> getVersesByPage() async {
    final futures = List.generate(
      604,
      (i) async => await getPageVerses(page: i + 1),
    );
    return Future.wait(futures);
  }

  Future<List<Verse>> getSurahsVerses(int surahNumber) async =>
      await (_db.select(
        _db.verses,
      )..where((tbl) => tbl.surahNumber.equals(surahNumber))).get();

  Future<List<(Surah, List<Verse>)>> getVersesPerSura(int suraNumber) async {
    final List<(Surah, List<Verse>)> result = [];
    final surahs =
        await (_db.select(_db.surahs)..where(
              (t) => t.number.isBetween(
                Variable(suraNumber - 5),
                Variable(suraNumber + 5),
              ),
            ))
            .get();
    for (final surah in surahs) {
      final verses = await getSurahsVerses(surah.number);
      result.add((surah, verses));
    }
    return result;
  }

  Future<List<Verse>> getChaptersVerses() async => await (_db.select(
    _db.verses,
  )..where((t) => t.newJuz.isNotValue(0))).get();

  Future<List<(Surah, List<Verse>)>> getReadingDataPagination(
    int suraNumber,
    bool isFromStart,
  ) async {
    final List<(Surah, List<Verse>)> result = [];
    final surahs =
        await (_db.select(_db.surahs)
              ..where(
                (t) => isFromStart
                    ? t.number.isSmallerThan(Variable(suraNumber))
                    : t.number.isBiggerThan(Variable(suraNumber)),
              )
              ..orderBy([
                (r) => OrderingTerm(
                  expression: _db.surahs.number,
                  mode: isFromStart ? OrderingMode.desc : OrderingMode.asc,
                ),
              ])
              ..limit(5))
            .get();
    for (final surah in surahs) {
      final verses = await getSurahsVerses(surah.number);
      result.add((surah, verses));
    }
    if (isFromStart) {
      result.sort((a, b) => a.$1.number.compareTo(b.$1.number));
    }
    return result;
  }

  Future<List<List<(Line, List<Word>)>>> getSurasLines(int pageNumber) async {
    final lines =
        await (_linesDb.select(_linesDb.lines)
              ..where(
                (t) => t.pageNumber.isBetween(
                  Variable(pageNumber - 5),
                  Variable(pageNumber + 5),
                ),
              )
              ..orderBy([(t) => OrderingTerm(expression: t.pageNumber)]))
            .get();


    if (lines.isEmpty) return [];

    final words =
        await (_linesDb.select(_linesDb.words)
              ..where(
                (t) => t.id.isBetween(
                  Variable(
                    lines
                        .firstWhere((page) => page.firstWordId != null)
                        .firstWordId,
                  ),
                  Variable(
                    lines
                        .lastWhere((page) => page.lastWordId != null)
                        .lastWordId,
                  ),
                ),
              )
              ..orderBy([(t) => OrderingTerm(expression: t.id)]))
            .get();

    final resultLines = lines.map((page) {
      if (page.firstWordId == null || page.lastWordId == null) {
        return (page, <Word>[]);
      }
      final lineWords = words
          .where(
            (word) =>
                word.id >= page.firstWordId! && word.id <= page.lastWordId!,
          )
          .toList();

      return (page, lineWords);
    }).toList();

    final result = <int, List<(Line, List<Word>)>>{};
    for (int i = 0; i < resultLines.length; i++) {
      result
          .putIfAbsent(resultLines[i].$1.pageNumber, () => [])
          .add(resultLines[i]);
    }
    return result.values.toList();
  }

  Future<List<List<(Line, List<Word>)>>> getReadingDataPaginationLines(
    int pageNumber,
    bool isFromStart,
  ) async {
    final lines =
        await (_linesDb.select(_linesDb.lines)
              ..where(
                (t) => isFromStart
                    ? t.pageNumber.isSmallerThan(Variable(pageNumber))
                    : t.pageNumber.isBiggerThan(Variable(pageNumber)),
              )
              ..orderBy([
                (t) => OrderingTerm(
                  expression: t.pageNumber,
                  mode: isFromStart ? OrderingMode.desc : OrderingMode.asc,
                ),
              ])
              ..limit(5))
            .get();

    if (lines.isEmpty) return [];

    final words =
        await (_linesDb.select(_linesDb.words)
              ..where(
                (t) => t.id.isBetween(
                  Variable(lines.first.firstWordId),
                  Variable(lines.last.lastWordId),
                ),
              )
              ..orderBy([(t) => OrderingTerm(expression: t.id)]))
            .get();

    final resultLines = lines.map((page) {
      if (page.firstWordId == null || page.lastWordId == null) {
        return (page, <Word>[]);
      }
      final lineWords = words
          .where(
            (word) =>
                word.id >= page.firstWordId! && word.id <= page.lastWordId!,
          )
          .toList();

      return (page, lineWords);
    }).toList();

    final result = <int, List<(Line, List<Word>)>>{};
    for (int i = 0; i < resultLines.length; i++) {
      result
          .putIfAbsent(resultLines[i].$1.pageNumber, () => [])
          .add(resultLines[i]);
    }
    return result.values.toList();
  }
}
