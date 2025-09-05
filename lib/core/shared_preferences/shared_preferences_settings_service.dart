import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:noor/core/shared_preferences/shared_preferences_keys.dart';
import 'package:noor/features/settings/data/models/azan_notifications_settings.dart';
import 'package:noor/features/settings/data/models/azkar_notifications_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable()
class SharedPreferencesSettingsService {
  final SharedPreferences sp;

  SharedPreferencesSettingsService(this.sp);

  bool getLocationUpdateSetting() {
    final result = sp.getBool(SharedPreferencesKeys.locationUpdateSettings);
    return result ?? true;
  }

  void saveLocationUpdateSetting(bool state) {
    sp.setBool(SharedPreferencesKeys.locationUpdateSettings, state);
  }

  AzkarNotificationsSettings getAzkarNotificationSetting() {
    final result = sp.getString(
      SharedPreferencesKeys.azkarNotificationSettings,
    );
    if (result == null) {
      return AzkarNotificationsSettings(
        morningAzkarState: true,
        eveningAzkarState: true,
        morningAzkarTime: 45,
        eveningAzkarTime: 45,
      );
    }
    return AzkarNotificationsSettings.fromJson(jsonDecode(result));
  }

  void saveAzkarNotificationSetting(AzkarNotificationsSettings state) {
    sp.setString(
      SharedPreferencesKeys.azkarNotificationSettings,
      jsonEncode(state.toJson()),
    );
  }

  AzanNotificationsSettings getAzanNotificationSetting() {
    final result = sp.getString(SharedPreferencesKeys.azanNotificationSettings);
    if (result == null) {
      return AzanNotificationsSettings(
        fajrState: true,
        dhuhrState: true,
        asrState: true,
        maghribState: true,
        ishaState: true,
      );
    }
    return AzanNotificationsSettings.fromJson(jsonDecode(result));
  }

  void saveAzanNotificationSetting(AzanNotificationsSettings state) {
    sp.setString(
      SharedPreferencesKeys.azanNotificationSettings,
      jsonEncode(state.toJson()),
    );
  }

  bool getNotificationsState() {
    final result = sp.getBool(SharedPreferencesKeys.notificationsState);
    return result ?? true;
  }

  void saveNotificationsState(bool state) async {
    sp.setBool(SharedPreferencesKeys.notificationsState, state);
  }
}
