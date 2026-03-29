import 'package:adhan/adhan.dart';
import 'package:noor/core/database/cities/cities_database.dart';
import 'package:noor/features/settings/data/models/calculation_settings.dart';

abstract class PrayerTimesHelper {
  static PrayerTimes getPrayerTimes({
    required City city,
    DateTime? date,
    CalculationSettings? settings,
  }) {
    final myCoordinates = Coordinates(city.lat, city.lng);
    final calculationSettings = settings ?? CalculationSettings.defaultSettings;
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
