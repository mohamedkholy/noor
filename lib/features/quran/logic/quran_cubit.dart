import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:noor/core/constants/shared_preferences_keys.dart';
import 'package:noor/core/database/quran/quran_database.dart';
import 'package:noor/core/di/dependency_injection.dart';
import 'package:noor/features/quran/data/repos/quran_repo.dart';
import 'package:noor/features/quran/logic/quran_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable()
class QuranCubit extends Cubit<QuranState> {
  final QuranRepo quranRepo;
  QuranCubit(this.quranRepo) : super(QuranInitial());


  Future<void> getVerses() async {
    final verses = await quranRepo.getVersesPerSura();
    emit(QuranLoaded(verses));
  }

  Future<void> getSuras() async {
    final surahs = await quranRepo.getSurahs();
    emit(SurahsLoaded(surahs: surahs));
    final verses = await quranRepo.getChaptersVerses();
    emit(SurahsLoaded(surahs: surahs, verses: verses));
  }

  void saveLastReading(Verse? verse,String suraNameEn) {
 
       

     getIt.get<SharedPreferences>().setString(
      SharedPreferencesKeys.lastReading,
        jsonEncode(<String,dynamic>{
          "verse" : verse?.toJson(),
          "suraNameEn" : suraNameEn,
        })
    );
  }
}
