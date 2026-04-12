import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:noor/core/database/quran/quran_database.dart';
import 'package:noor/core/di/dependency_injection.dart';
import 'package:noor/core/models/bookmark.dart';
import 'package:noor/core/shared_preferences/shared_preferences_keys.dart';
import 'package:noor/core/shared_preferences/shared_preferences_settings_service.dart';
import 'package:noor/features/quran/data/models/quran_reader.dart';
import 'package:noor/features/quran/data/models/reading_position.dart';
import 'package:noor/features/quran/data/repos/quran_repo.dart';
import 'package:noor/features/quran/logic/quran_cubit/quran_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable()
class QuranCubit extends Cubit<QuranState> {
  final QuranRepo _quranRepo;
  final SharedPreferencesSettingsService _settingsService =
      SharedPreferencesSettingsService();
  ValueNotifier<ReadingPosition?> currentReadingPositionNotifier =
      ValueNotifier(null);
  ValueNotifier<Surah?> currentSurahNotifier = ValueNotifier(null);
  ValueNotifier<int> currentTabNotifier = ValueNotifier(0);
  QuranReader currentQuranReaderNotifier = QuranCubit.quranReader.first;
  ValueNotifier<Bookmark?> bookMarkNotifier = ValueNotifier(
    SharedPreferencesSettingsService().getBookMark(),
  );
  ValueNotifier<Color> readingBackgroundColorNotifier = ValueNotifier(
    SharedPreferencesSettingsService().getReadingBackgroundColor(),
  );
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

  Future<void> saveLastReading({
    required int surahNumber,
    required int verseNumber,
    required int juzNumber,
    required int pageNumber,
  }) async {
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
          pageNumber: pageNumber,
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
        surahNumber: readingPosition.surahNumber,
        verseNumber: readingPosition.verseNumber,
        juzNumber: readingPosition.juz,
        pageNumber: readingPosition.pageNumber,
      );
    }
    currentSurahNotifier.dispose();
    currentTabNotifier.dispose();
    currentReadingPositionNotifier.dispose();
    readingBackgroundColorNotifier.dispose();
  }

  void updateReadingBackgroundColor(Color color) {
    readingBackgroundColorNotifier.value = color;
    _settingsService.saveReadingBackgroundColor(color);
  }

  Color getVerseTextColor(Color background) {
    return background.computeLuminance() > 0.5 ? Colors.black : Colors.white;
  }

  Color getTranslationTextColor(Color background) {
    return background.computeLuminance() > 0.5
        ? Colors.black87
        : Colors.white70;
  }

  static List<QuranReader> quranReader = [
    QuranReader(
      nameAr: 'مشاري راشد العفاسي',
      nameEn: 'Mishary Rashid Alafasy',
      url: 'ar.alafasy',
      number: 128,
    ),
    QuranReader(
      nameAr: 'محمود خليل الحصري',
      nameEn: 'Mahmoud Khalil Al-Husary',
      url: 'ar.husary',
      number: 128,
    ),
    QuranReader(
      nameAr: 'محمد صديق المنشاوي',
      nameEn: 'Mohammad Siddiq Al-Minshawi',
      url: 'ar.minshawi',
      number: 128,
    ),
    QuranReader(
      nameAr: 'أبو بكر الشاطري',
      nameEn: 'Abu Bakr Al-Shatri',
      url: 'ar.shaatree',
      number: 128,
    ),
    QuranReader(
      nameAr: 'عبد الله بصفر',
      nameEn: 'Abdullah Basfar',
      url: 'ar.abdullahbasfar',
      number: 192,
    ),
    QuranReader(
      nameAr: 'عبد الرحمن السديس',
      nameEn: 'Abdur-Rahman As-Sudais',
      url: 'ar.abdurrahmaansudais',
      number: 192,
    ),
    QuranReader(
      nameAr: 'عبد الباسط عبد الصمد (مرتل)',
      nameEn: 'Abdul Basit Abdus Samad (Murattal)',
      url: 'ar.abdulbasitmurattal',
      number: 192,
    ),
    QuranReader(
      nameAr: 'علي الحذيفي',
      nameEn: 'Ali Al-Hudhaify',
      url: 'ar.hudhaify',
      number: 128,
    ),
    QuranReader(
      nameAr: 'ماهر المعيقلي',
      nameEn: 'Maher Al-Muaiqly',
      url: 'ar.mahermuaiqly',
      number: 128,
    ),
    QuranReader(
      nameAr: 'محمد جبريل',
      nameEn: 'Mohammad Jibreel',
      url: 'ar.muhammadjibreel',
      number: 128,
    ),
  ];
}
