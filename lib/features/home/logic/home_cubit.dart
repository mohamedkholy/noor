import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:noor/core/database/quran/quran_database.dart';
import 'package:noor/core/di/dependency_injection.dart';
import 'package:noor/core/shared_preferences/shared_preferences_keys.dart';
import 'package:noor/features/home/data/models/last_reading.dart';
import 'package:noor/features/home/data/repos/home_repo.dart';
import 'package:noor/features/home/logic/home_state.dart';
import 'package:noor/features/quran/data/models/reading_position.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable()
class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(HomeInitial());

  LastReadingData? getLastReading() {
    final String? lastReadingJsonString = getIt<SharedPreferences>().getString(
      SharedPreferencesKeys.lastReading,
    );

    if (lastReadingJsonString != null) {
      final Map<String, dynamic> lastReadingJson = jsonDecode(
        lastReadingJsonString,
      );

      final readingPosition = ReadingPosition.fromJson(
        lastReadingJson['readingPosition'],
      );
      final suraNameEn = lastReadingJson['suraNameEn'];

      emit(
        LastReadingLoaded(
          lastReading: LastReadingData(
            readingPosition: readingPosition,
            suraNameEn: suraNameEn,
          ),
        ),
      );

      return LastReadingData(
        readingPosition: readingPosition,
        suraNameEn: suraNameEn,
      );
    }

    return null;
  }

  Future<void> getTodayContent() async {
    final (hadith, verse) = await _homeRepo.getTodayContent();
    if (!isClosed) {
      emit(TodayHadithLoaded(hadith: hadith));
      emit(TodayVerseLoaded(verse: verse));
    }
  }
}
