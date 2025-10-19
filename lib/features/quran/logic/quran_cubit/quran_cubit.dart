import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:just_audio/just_audio.dart';
import 'package:noor/core/database/quran/quran_database.dart';
import 'package:noor/core/di/dependency_injection.dart';
import 'package:noor/core/shared_preferences/shared_preferences_keys.dart';
import 'package:noor/features/quran/data/models/reading_position.dart';
import 'package:noor/features/quran/data/repos/quran_repo.dart';
import 'package:noor/features/quran/logic/quran_cubit/quran_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable()
class QuranCubit extends Cubit<QuranState> {
  final QuranRepo _quranRepo;
  ValueNotifier<ReadingPosition?> currentReadingPositionNotifier =
      ValueNotifier(null);
  ValueNotifier<Surah?> currentSurahNotifier = ValueNotifier(null);
  ValueNotifier<int> currentTabNotifier = ValueNotifier(0);
  QuranCubit(this._quranRepo) : super(QuranInitial());

  Future<void> getSuras() async {
    final result = await Future.wait([
      _quranRepo.getSurahs(),
      _quranRepo.getChaptersVerses(),
    ]);
    final surahs = result[0] as List<Surah>;
    final verses = result[1] as List<Verse>;
    if (!isClosed) {
      emit(SurahsLoaded(surahs: surahs, verses: verses));
    }
  }

  Future<void> saveLastReading(
    int surahNumber,
    int verseNumber,
    int juzNumber,
  ) async {
    final surah = await _quranRepo.getSurahDetails(surahNumber: surahNumber);

    final surahInfo = surah;

    getIt.get<SharedPreferences>().setString(
      SharedPreferencesKeys.lastReading,
      jsonEncode(<String, dynamic>{
        "readingPosition": ReadingPosition(
          juz: juzNumber,
          surahNumber: surahInfo.number,
          surahName: surahInfo.nameAr,
          verseNumber: verseNumber,
          pageNumber: surahInfo.pageNumber,
        ),
        "suraNameEn": surahInfo.nameTransliteration,
      }),
    );
  }

  Future<void> updateReadingPosition(
    int surahNumber,
    int verseNumber,
    int juzNumber,
    int pageNumber,
  ) async {
    final surahInfo = await _quranRepo.getSurahDetails(
      surahNumber: surahNumber,
    );

    currentSurahNotifier.value = surahInfo;
    currentReadingPositionNotifier.value = ReadingPosition(
      juz: juzNumber,
      surahNumber: surahInfo.number,
      surahName: surahInfo.nameAr,
      verseNumber: verseNumber,
      pageNumber: pageNumber,
    );
  }

  Future<void> dispose() async {
    if (currentReadingPositionNotifier.value != null) {
      final ReadingPosition readingPosition =
          currentReadingPositionNotifier.value!;

      await saveLastReading(
        readingPosition.surahNumber,
        readingPosition.verseNumber,
        readingPosition.juz,
      );
    }
    currentReadingPositionNotifier.dispose();
  }
}
