import 'package:adhan/adhan.dart';
import 'package:noor/core/database/cities/cities_database.dart';
import 'package:noor/core/di/dependency_injection.dart';
import 'package:noor/core/shared_preferences/shared_preferences_settings_service.dart';

abstract class PrayerTimesHelper {
  static PrayerTimes getPrayerTimes({required City city, DateTime? date}) {
    final myCoordinates = Coordinates(city.lat, city.lng);
    final calculationSettings = getIt<SharedPreferencesSettingsService>()
        .getCalculationSettings();
    final params = calculationSettings.getCalculationMethod().getParameters();
    params.madhab = calculationSettings.getMadhab();

    return date == null
        ? PrayerTimes.today(myCoordinates, params)
        : PrayerTimes(
            myCoordinates,
            DateComponents(date.year, date.month, date.day),
            params,
          );
  }
}
