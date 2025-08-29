import 'package:adhan/adhan.dart';
import 'package:noor/core/database/cities/cities_database.dart';

abstract class PrayerTimesHelper {
  static PrayerTimes getPrayerTimes({required City city, DateTime? date}) {
    final myCoordinates = Coordinates(city.lat, city.lng);
    final params = CalculationMethod.egyptian.getParameters();
    params.madhab = Madhab.shafi;
    return date == null
        ? PrayerTimes.today(myCoordinates, params)
        : PrayerTimes(
            myCoordinates,
            DateComponents(date.year, date.month, date.day),
            params,
          );
  }
}
