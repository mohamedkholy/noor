import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:noor/core/database/cities/cities_database.dart';
import 'package:noor/core/di/dependency_injection.dart';
import 'package:noor/core/notifications/notifications_manager.dart';
import 'package:noor/core/shared_preferences/shared_preferences_settings_service.dart';
import 'package:permission_handler/permission_handler.dart';

@singleton
class NavigationRepo {
  final CitiesDatabase _citiesDb;
  final SharedPreferencesSettingsService _sp;

  NavigationRepo(this._citiesDb, this._sp);

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
    final result = _sp.getNotificationsState();
    return result;
  }

  void saveNotificationsState(bool state) async {
    _sp.saveNotificationsState(state);
    if (state && await Permission.notification.isGranted) {
      getIt<NotificationsManager>().scheduleNotifications();
    } else {
      getIt<NotificationsManager>().cancelAllNotifications();
    }
  }
}
