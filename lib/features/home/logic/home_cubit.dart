import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:noor/core/constants/shared_preferences_keys.dart';
import 'package:noor/core/database/cities/cities_database.dart';
import 'package:noor/core/database/quran/quran_database.dart';
import 'package:noor/core/di/dependency_injection.dart';
import 'package:noor/features/home/data/models/last_reading.dart';
import 'package:noor/features/home/data/repos/home_repo.dart';
import 'package:noor/features/home/logic/home_state.dart';
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
      emit(LastReadingLoaded(lastReading: LastReadingData(verse: verse, suraNameEn: suraNameEn)));
      return LastReadingData(verse: verse, suraNameEn: suraNameEn);
    }
    return null;
  }

  Future<void> saveCityToPrefs(City city) async {
    await getIt<SharedPreferences>().setString(
      SharedPreferencesKeys.savedCity,
      city.toJsonString(),
    );
  }

  void setCity(City city) {
    emit(CityLoaded(city: city));
  }

  City? getSavedCity() {
    final result = getIt<SharedPreferences>().getString(
      SharedPreferencesKeys.savedCity,
    );
    if (result == null) return null;
    final map = jsonDecode(result) as Map<String, dynamic>;
    return City.fromJson(map);
  }

  void askForPermission() {
    Geolocator.requestPermission().then((status) {
      if (status == LocationPermission.always ||
          status == LocationPermission.whileInUse) {
        Geolocator.getCurrentPosition().then((position) {
          _homeRepo.findNearest(position.latitude, position.longitude).then((
            city,
          ) async {
            await saveCityToPrefs(city);
            setCity(city);
          });
        });
      }
    });
  }
}
