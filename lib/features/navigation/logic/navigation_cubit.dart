import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:noor/core/database/cities/cities_database.dart';
import 'package:noor/core/di/dependency_injection.dart';
import 'package:noor/core/notifications/notifications_manager.dart';
import 'package:noor/core/routing/my_routes.dart';
import 'package:noor/core/shared_preferences/shared_preferences_keys.dart';
import 'package:noor/core/shared_preferences/shared_preferences_settings_service.dart';
import 'package:noor/features/navigation/data/repos/navigation_repo.dart';
import 'package:noor/features/navigation/logic/navigation_state.dart';
import 'package:noor/features/settings/data/models/azkar_type.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class NavigationCubit extends Cubit<NavigationState> {
  final NavigationRepo _navigationRepo;

  NavigationCubit(this._navigationRepo) : super(NavigationInitial());

  Future<void> askForPermissions() async {
    await getIt<NotificationsManager>().requestPermission();
    await Geolocator.requestPermission().then((status) async {
      if ((status == LocationPermission.always ||
              status == LocationPermission.whileInUse) &&
          await Geolocator.isLocationServiceEnabled() &&
          getIt<SharedPreferencesSettingsService>()
              .getLocationUpdateSetting()) {
        Geolocator.getCurrentPosition().then((position) {
          _navigationRepo
              .findNearest(position.latitude, position.longitude)
              .then((city) async {
                await saveCityToPrefs(city);
                setCity(city);
              });
        });
      } else {
        scheduleNotifications();
      }
    });
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

  Future<void> setCity(City city) async {
    emit(CityLoaded(city: city));
    scheduleNotifications();
  }

  void scheduleNotifications() async {
    if (await Permission.notification.isGranted && getNotificationsState()) {
      getIt<NotificationsManager>().scheduleNotifications();
    }
  }

  bool getNotificationsState() {
    final result = _navigationRepo.getNotificationsState();
    emit(NotificationsState(notificationsState: result));
    return result;
  }

  void saveNotificationsState(bool state) {
    _navigationRepo.saveNotificationsState(state);
    emit(NotificationsState(notificationsState: state));
  }

  Future<String?> getNotificationPayload() {
    return getIt<NotificationsManager>().getNotificationPayload();
  }

  void initAsync() async {
    final payload = await getNotificationPayload();
    if (payload != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (payload == AzkarType.evening.name) {
          emit(
            NotificationNavigation(
              route: MyRoutes.azkarCategory,
              arguments: "أذكار المساء",
            ),
          );
        } else if (payload == AzkarType.morning.name) {
          emit(
            NotificationNavigation(
              route: MyRoutes.azkarCategory,
              arguments: "أذكار الصباح",
            ),
          );
        }
      });
    } else {
      askForPermissions();
    }
  }
}
