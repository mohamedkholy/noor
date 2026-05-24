import 'package:dart_either/dart_either.dart';
import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:noor/core/database/quran/quran_database.dart';
import 'package:noor/core/models/failure.dart';
import 'package:noor/core/networking/api_constants.dart';
import 'package:noor/core/networking/quran_sound_service/quran_sound_service.dart';
import 'package:noor/core/networking/tafsir_api_service/tafsir_api_service.dart';
import 'package:noor/features/quran/data/models/ayah_sound_response/ayah_sound_response.dart';
import 'package:noor/features/quran/data/models/line_data.dart';
import 'package:noor/features/quran/data/models/quran_page_sound_response/quran_page_sound_response.dart';

@Injectable()
class QuranRepo {
  final QuranDatabase _db;
  final QuranSoundService _quranSoundService;
  final TafsirApiService _tafsirApiService;
  QuranRepo(this._db, this._quranSoundService, this._tafsirApiService);

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

  Future<List<List<LineData>>> getSurasLines(
    int pageNumber, [
    bool? isFromStart,
  ]) async {
    List<Line> lines = [];
    if (isFromStart == null) {
      lines =
          await (_db.select(_db.lines)
                ..where(
                  (t) => t.pageNumber.isBetween(
                    Variable(pageNumber - 5),
                    Variable(pageNumber + 5),
                  ),
                )
                ..orderBy([(t) => OrderingTerm(expression: t.pageNumber)]))
              .get();
    } else {
      lines =
          await (_db.select(_db.lines)
                ..where(
                  (t) => isFromStart
                      ? t.pageNumber.isSmallerThan(Variable(pageNumber)) &
                            t.pageNumber.isBiggerThan(Variable(pageNumber - 5))
                      : t.pageNumber.isBiggerThan(Variable(pageNumber)) &
                            t.pageNumber.isSmallerThan(
                              Variable(pageNumber + 5),
                            ),
                )
                ..orderBy([(t) => OrderingTerm(expression: t.pageNumber)]))
              .get();
    }

    if (lines.isEmpty) return [];

    final words =
        await (_db.select(_db.words)
              ..where(
                (t) => t.id.isBetween(
                  Variable(
                    lines
                        .firstWhere((line) => line.firstWordId != null)
                        .firstWordId,
                  ),
                  Variable(
                    lines
                        .lastWhere((line) => line.lastWordId != null)
                        .lastWordId,
                  ),
                ),
              )
              ..orderBy([(t) => OrderingTerm(expression: t.id)]))
            .get();

    final resultLines = lines.map((line) {
      if (line.firstWordId == null || line.lastWordId == null) {
        return LineData(line, <Word>[]);
      }
      final lineWords = words
          .where(
            (word) =>
                word.id >= line.firstWordId! && word.id <= line.lastWordId!,
          )
          .toList();

      return LineData(line, lineWords);
    }).toList();

    final result = <int, List<LineData>>{};
    for (int i = 0; i < resultLines.length; i++) {
      result
          .putIfAbsent(resultLines[i].info.pageNumber, () => [])
          .add(resultLines[i]);
    }
    final finalResult = result.values.toList();
    if (isFromStart == true) {
      finalResult.sort(
        (a, b) => a.first.info.pageNumber.compareTo(b.first.info.pageNumber),
      );
    }

    return finalResult;
  }

  Future<Either<Failure, AyahSoundResponse>> getAyaSound(
    String ayaPosition,
    String qari,
  ) async {
    try {
      final response = await _quranSoundService.getAyaSound(ayaPosition, qari);
      return Right(response);
    } catch (e) {
      debugPrint(e.toString());
      if (e is DioException) {
        return Left(Failure(ApiConstants.mapDioError(e)));
      }
      return Left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, QuranPageSoundResponse>> getPageSound(
    int pageNumber,
    String qari,
  ) async {
    try {
      final response = await _quranSoundService.getPageSound(pageNumber, qari);
      return Right(response);
    } catch (e) {
      debugPrint(e.toString());
      if (e is DioException) {
        return Left(Failure(ApiConstants.mapDioError(e)));
      }
      return Left(Failure(e.toString()));
    }
  }

  Future<String> getAyaText(int suraNumber, int ayaNumber) async {
    final verse =
        await (_db.select(_db.verses)..where(
              (t) =>
                  t.surahNumber.equals(suraNumber) & t.number.equals(ayaNumber),
            ))
            .getSingleOrNull();
    return verse?.textAr ?? "";
  }

  String _buildStripSql(String columnSql) {
    const marks = [
      '\u064B',
      '\u064C',
      '\u064D',
      '\u064E',
      '\u064F',
      '\u0650',
      '\u0651',
      '\u0652',
      '\u0653',
      '\u0654',
      '\u0655',
      '\u0656',
      '\u0657',
      '\u0658',
      '\u0659',
      '\u065A',
      '\u065B',
      '\u065C',
      '\u065D',
      '\u065E',
      '\u065F',
    ];

    var sql = columnSql;
    for (final mark in marks) {
      sql = "REPLACE($sql, '$mark', '')";
    }
    return sql;
  }

  String _stripMarksDart(String text) {
    return text.replaceAll(RegExp(r'[\u064B-\u065F\u0610-\u061A]'), '');
  }

  Future<List<Verse>> searchVerses(String query) async {
    if (query.isEmpty) return [];
    final cleanQuery = _stripMarksDart(query);

    return await (_db.select(_db.verses)
          ..where((t) {
            final arabStripped = CustomExpression<String>(
              _buildStripSql('"text_ar"'),
            );
            final engStripped = CustomExpression<String>(
              _buildStripSql('"text_en"'),
            );
            return arabStripped.contains(cleanQuery) |
                engStripped.contains(cleanQuery);
          })
          ..limit(50))
        .get();
  }
}
