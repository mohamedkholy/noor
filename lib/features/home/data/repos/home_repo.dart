import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:noor/core/database/hadith/hadith_database.dart';
import 'package:noor/core/database/quran/quran_database.dart';

@Injectable()
class HomeRepo {
  final HadithDatabase _hadithDb;
  final QuranDatabase _quranDb;

  HomeRepo(this._hadithDb, this._quranDb);

  Future<(Hadith, Verse)> getTodayContent() async {
    final dayOfYear = getdayOfYear();
    final hadithFuture = _hadithDb.select(_hadithDb.hadiths).join([
      innerJoin(
        _hadithDb.dailyHadiths,
        _hadithDb.dailyHadiths.kitabName.equalsExp(_hadithDb.hadiths.kitab) &
            _hadithDb.dailyHadiths.number.equalsExp(_hadithDb.hadiths.number),
      ),
    ])..where(_hadithDb.dailyHadiths.day.equals(dayOfYear));

    final verseFuture = _quranDb.select(_quranDb.verses).join([
      innerJoin(
        _quranDb.dailyVerses,
        _quranDb.dailyVerses.surahNumber.equalsExp(
              _quranDb.verses.surahNumber,
            ) &
            _quranDb.dailyVerses.number.equalsExp(_quranDb.verses.number),
      ),
    ])..where(_quranDb.dailyVerses.day.equals(dayOfYear));

    final results = await Future.wait([
      hadithFuture.getSingle(),
      verseFuture.getSingle(),
    ]);

    return (
      results[0].readTable(_hadithDb.hadiths),
      results[1].readTable(_quranDb.verses),
    );
  }

  int getdayOfYear() => int.parse(DateFormat("D", "en").format(DateTime.now()));
}
