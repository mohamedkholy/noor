import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:noor/core/constants/shared_preferences_keys.dart';
import 'package:noor/core/database/cities/cities_database.dart';
import 'package:noor/core/di/dependency_injection.dart';
import 'package:noor/core/notifications/notifications_manager.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class NavigationRepo {
  final CitiesDatabase _citiesDb;

  NavigationRepo(this._citiesDb);

  Future<City> findNearest(double userLat, double userLng) async {
    final latDiff = _citiesDb.cities.lat - Constant(userLat);
    final lngDiff = _citiesDb.cities.lng - Constant(userLng);

    final distanceExpr = latDiff * latDiff + lngDiff * lngDiff;

    final query = (_citiesDb.select(_citiesDb.cities)
      ..orderBy([(c) => OrderingTerm(expression: distanceExpr)])
      ..limit(1));

    return query.getSingle();
  }

  bool getNotificationsState() {
    final result = getIt<SharedPreferences>().getBool(
      SharedPreferencesKeys.notificationsState,
    );
    return result ?? true;
  }

  void saveNotificationsState(bool state) async {
    getIt<SharedPreferences>().setBool(
      SharedPreferencesKeys.notificationsState,
      state,
    );
    if (state && await Permission.notification.isGranted) {
      NotificationsManager.instance.scheduleNotifications();
    } else {
      NotificationsManager.instance.cancelAllNotifications();
    }
  }
}
