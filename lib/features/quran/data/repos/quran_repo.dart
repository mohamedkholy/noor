import 'package:injectable/injectable.dart';
import 'package:noor/core/database/quran/quran_database.dart';

@Injectable()
class QuranRepo {
  final QuranDatabase _db;
  QuranRepo(this._db);

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

  Future<List<(Surah, List<Verse>)>> getVersesPerSura() async {
    final List<(Surah, List<Verse>)> result = [];
    final surahs = await getSurahs();
    for (final surah in surahs) {
      final verses = await getSurahsVerses(surah.number);
      result.add((surah, verses));
    }
    return result;
  }

  Future<List<Verse>> getChaptersVerses() async => await (_db.select(
    _db.verses,
  )..where((t) => t.newJuz.isNotValue(0))).get();
}
