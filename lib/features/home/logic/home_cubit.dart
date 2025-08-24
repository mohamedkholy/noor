import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:noor/core/constants/shared_preferences_keys.dart';
import 'package:noor/core/database/quran/quran_database.dart';
import 'package:noor/core/di/dependency_injection.dart';
import 'package:noor/features/home/logic/home_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable()
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  Future<void> getLasReading() async {
    final String? lastReadingJsonString = getIt<SharedPreferences>().getString(
      SharedPreferencesKeys.lastReading,
    );
    if (lastReadingJsonString != null) {
      final Map<String, dynamic> lastReadingJson = jsonDecode(
        lastReadingJsonString,
      );
      final verse = Verse.fromJson(lastReadingJson['verse']);
      final suraNameEn = lastReadingJson['suraNameEn'];
      emit(LastReadingLoaded(verse: verse, suraNameEn: suraNameEn));
    }
  }
}
