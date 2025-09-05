import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:noor/core/database/quran/quran_database.dart';
import 'package:noor/core/di/dependency_injection.dart';
import 'package:noor/core/shared_preferences/shared_preferences_keys.dart';
import 'package:noor/features/quran/data/repos/quran_repo.dart';
import 'package:noor/features/quran/logic/quran_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable()
class QuranCubit extends Cubit<QuranState> {
  final QuranRepo quranRepo;
  List<(Surah, List<Verse>)> versesPerSura = [];
  QuranCubit(this.quranRepo) : super(QuranInitial());

  Future<void> getReadingData(int suraNumber) async {
    versesPerSura = await quranRepo.getVersesPerSura(suraNumber);
    if (!isClosed) {
      emit(QuranLoaded(versesPerSura));
    }
  }

  Future<void> getReadingDataPagination({
    required int suraNumber,
    required bool isFromStart,
  }) async {
    versesPerSura = await quranRepo.getReadingDataPagination(
      suraNumber,
      isFromStart,
    );
    if (!isClosed) {
      emit(
        isFromStart
            ? QuranLodedFromStart(versesPerSura)
            : QuranLodedFromEnd(versesPerSura),
      );
    }
  }

  Future<void> getSuras() async {
    final result = await Future.wait([
      quranRepo.getSurahs(),
      quranRepo.getChaptersVerses(),
    ]);
    final surahs = result[0] as List<Surah>;
    final verses = result[1] as List<Verse>;
    if (!isClosed) {
      emit(SurahsLoaded(surahs: surahs, verses: verses));
    }
  }

  void saveLastReading(Verse? verse, String suraNameEn) {
    getIt.get<SharedPreferences>().setString(
      SharedPreferencesKeys.lastReading,
      jsonEncode(<String, dynamic>{
        "verse": verse?.toJson(),
        "suraNameEn": suraNameEn,
      }),
    );
  }
}
