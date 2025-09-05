import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:noor/core/database/cities/cities_database.dart';
import 'package:noor/core/di/dependency_injection.dart';
import 'package:noor/core/shared_preferences/shared_preferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable()
class LocationRepo {
  final CitiesDatabase _db;

  LocationRepo(this._db);

  Future<List<City>> getCities({required int page, String? query}) async {
    return await (_db.select(_db.cities)
          ..where(
            (city) =>
                city.name.contains(query ?? "") |
                city.searchNames.contains(query ?? "") |
                city.country.contains(query ?? ""),
          )
          ..orderBy([
            (city) => OrderingTerm(
              expression: city.name.like("${query ?? ""}%"),
              mode: OrderingMode.desc,
            ),
            (city) => OrderingTerm(expression: city.name),
          ])
          ..limit((page + 1) * 100, offset: 100 * page))
        .get();
  }

  Future<void> saveCityToPrefs(City city) async {
    await getIt<SharedPreferences>().setString(
      SharedPreferencesKeys.savedCity,
      city.toJsonString(),
    );
  }

  City? getSavedCity() {
    final result = getIt<SharedPreferences>().getString(
      SharedPreferencesKeys.savedCity,
    );
    if (result == null) return null;
    final map = jsonDecode(result) as Map<String, dynamic>;
    return City.fromJson(map);
  }

  Future<City> findNearest(double userLat, double userLng) async {
    final latDiff = _db.cities.lat - Constant(userLat);
    final lngDiff = _db.cities.lng - Constant(userLng);

    final distanceExpr = latDiff * latDiff + lngDiff * lngDiff;

    final query = (_db.select(_db.cities)
      ..orderBy([(c) => OrderingTerm(expression: distanceExpr)])
      ..limit(1));

    return query.getSingle();
  }
}
