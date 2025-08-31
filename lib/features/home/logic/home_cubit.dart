import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:noor/core/constants/shared_preferences_keys.dart';
import 'package:noor/core/database/cities/cities_database.dart';
import 'package:noor/core/database/quran/quran_database.dart';
import 'package:noor/core/di/dependency_injection.dart';
import 'package:noor/core/notifications/notifications_manager.dart';
import 'package:noor/features/home/data/models/last_reading.dart';
import 'package:noor/features/home/data/repos/home_repo.dart';
import 'package:noor/features/home/logic/home_state.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable()
class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(HomeInitial());

  LastReadingData? getLasReading() {
    final String? lastReadingJsonString = getIt<SharedPreferences>().getString(
      SharedPreferencesKeys.lastReading,
    );
    if (lastReadingJsonString != null) {
      final Map<String, dynamic> lastReadingJson = jsonDecode(
        lastReadingJsonString,
      );
      final verse = Verse.fromJson(lastReadingJson['verse']);
      final suraNameEn = lastReadingJson['suraNameEn'];
      emit(
        LastReadingLoaded(
          lastReading: LastReadingData(verse: verse, suraNameEn: suraNameEn),
        ),
      );
      return LastReadingData(verse: verse, suraNameEn: suraNameEn);
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
