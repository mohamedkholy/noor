import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:noor/core/di/dependency_injection.dart';
import 'package:noor/core/models/bookmark.dart';
import 'package:noor/core/shared_preferences/shared_preferences_keys.dart';
import 'package:noor/features/hajj_umrah/data/models/sunan_data.dart';
import 'package:noor/features/properties/data/models/sunan_data.dart';
import 'package:noor/features/settings/data/models/azan_notifications_settings.dart';
import 'package:noor/features/settings/data/models/azkar_notifications_settings.dart';
import 'package:noor/features/settings/data/models/calculation_settings.dart';
import 'package:noor/features/settings/data/models/iqama_notifications_settings.dart';
import 'package:noor/features/settings/data/models/perodic_azkar_settings.dart';
import 'package:noor/features/settings/data/models/silent_mode_settings.dart';
import 'package:noor/features/settings/data/models/sunan_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable()
class SharedPreferencesSettingsService {
  final SharedPreferences sp = getIt<SharedPreferences>();

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
        sleepingAzkarState: true,
        sleepingAzkarTime: 2,
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

  void savePerodicAzkarSetting(PerodicAzkarSettings value) {
    sp.setString(
      SharedPreferencesKeys.perodicAzkarSettings,
      jsonEncode(value.toJson()),
    );
  }

  PerodicAzkarSettings getPerodicAzkarSetting() {
    final result = sp.getString(SharedPreferencesKeys.perodicAzkarSettings);
    if (result == null) {
      return PerodicAzkarSettings(
        isActive: true,
        perodicAzkarTime: 1,
        sound: "prophet_salah",
        text: "صلي علي نبينا محمد",
      );
    }
    return PerodicAzkarSettings.fromJson(jsonDecode(result));
  }

  bool getOnboardingCompleted() {
    final result = sp.getBool(SharedPreferencesKeys.onboardingCompleted);
    return result ?? false;
  }

  Future<void> setOnboardingCompleted() async {
    await sp.setBool(SharedPreferencesKeys.onboardingCompleted, true);
  }

  IqamaNotificationsSettings getIqamaNotificationSetting() {
    final result = sp.getString(
      SharedPreferencesKeys.iqamaNotificationSettings,
    );
    if (result == null) {
      return IqamaNotificationsSettings(
        isEnabled: true,
        fajrTime: 10,
        dhuhrTime: 20,
        asrTime: 20,
        maghribTime: 10,
        ishaTime: 15,
      );
    }
    return IqamaNotificationsSettings.fromJson(jsonDecode(result));
  }

  void saveIqamaNotificationSetting(IqamaNotificationsSettings state) {
    sp.setString(
      SharedPreferencesKeys.iqamaNotificationSettings,
      jsonEncode(state.toJson()),
    );
  }

  void saveSunanData(SunanData sunanSetting) {
    sp.setString(
      SharedPreferencesKeys.sunanData,
      jsonEncode(sunanSetting.toJson()),
    );
  }

  SunanData getSunanData() {
    final result = sp.getString(SharedPreferencesKeys.sunanData);
    if (result == null) {
      return SunanData(
        date: DateTime.now(),
        fajrSunnah: false,
        beforeDhuhrSunnah: false,
        afterDhuhrSunnah: false,
        maghribSunnah: false,
        ishaSunnah: false,
      );
    }
    final sunanSetting = SunanData.fromJson(jsonDecode(result));
    if (DateUtils.dateOnly(sunanSetting.date) !=
        DateUtils.dateOnly(DateTime.now())) {
      return SunanData(
        date: DateTime.now(),
        fajrSunnah: false,
        beforeDhuhrSunnah: false,
        afterDhuhrSunnah: false,
        maghribSunnah: false,
        ishaSunnah: false,
      );
    }
    return sunanSetting;
  }

  void savePropertiesCount(int value) {
    sp.setInt(SharedPreferencesKeys.propertiesCount, value);
  }

  int getPropertiesCount() {
    final result = sp.getInt(SharedPreferencesKeys.propertiesCount);
    return result ?? 0;
  }

  void saveLandsCount(int value) {
    sp.setInt(SharedPreferencesKeys.landsCount, value);
  }

  int getLandsCount() {
    final result = sp.getInt(SharedPreferencesKeys.landsCount);
    return result ?? 0;
  }

  int getTreesCount() {
    final result = sp.getInt(SharedPreferencesKeys.treesCount);
    return result ?? 0;
  }

  void saveTreesCount(int i) {
    sp.setInt(SharedPreferencesKeys.treesCount, i);
  }

  int getTreasuresCount() {
    final result = sp.getInt(SharedPreferencesKeys.treasuresCount);
    return result ?? 0;
  }

  void saveTreasuresCount(int i) {
    sp.setInt(SharedPreferencesKeys.treasuresCount, i);
  }

  SunanSettings getSunanSetting() {
    final result = sp.getString(SharedPreferencesKeys.sunanSettings);
    if (result == null) {
      return const SunanSettings(
        isEnabled: true,
        fajrSunnah: true,
        dhuhrSunan: true,
        maghribSunnah: true,
        ishaSunnah: true,
      );
    }
    return SunanSettings.fromJson(jsonDecode(result));
  }

  void saveSunanSettigs(SunanSettings sunanSettings) {
    sp.setString(
      SharedPreferencesKeys.sunanSettings,
      jsonEncode(sunanSettings.toJson()),
    );
  }

  int getHajjUmrahCount() {
    final result = sp.getInt(SharedPreferencesKeys.hajjUmrahCount);
    return result ?? 0;
  }

  void saveHajjUmrahCount(int i) {
    sp.setInt(SharedPreferencesKeys.hajjUmrahCount, i);
  }

  void saveHajjUmrahData(HajjUmrahData hajjUmrahData) {
    sp.setString(
      SharedPreferencesKeys.hajjUmrahData,
      jsonEncode(hajjUmrahData.toJson()),
    );
  }

  HajjUmrahData getHajjUmrahData() {
    final result = sp.getString(SharedPreferencesKeys.hajjUmrahData);
    if (result == null) {
      return HajjUmrahData(date: DateTime.now(), isCompleted: false);
    }
    final hajjUmrahData = HajjUmrahData.fromJson(jsonDecode(result));
    if (DateUtils.dateOnly(hajjUmrahData.date) !=
        DateUtils.dateOnly(DateTime.now())) {
      return HajjUmrahData(date: DateTime.now(), isCompleted: false);
    }
    return hajjUmrahData;
  }

  Bookmark? getBookMark() {
    final result = sp.getString(SharedPreferencesKeys.bookMark);
    if (result == null) {
      return null;
    }
    return Bookmark.fromJson(jsonDecode(result));
  }

  void saveBookMark(Bookmark bookmark) {
    sp.setString(SharedPreferencesKeys.bookMark, jsonEncode(bookmark.toJson()));
  }

  Color getReadingBackgroundColor() {
    final result = sp.getInt(SharedPreferencesKeys.readingBackgroundColor);
    if (result == null) {
      return const Color(0xFFFFF8EE);
    }
    return Color(result);
  }

  void saveReadingBackgroundColor(Color color) {
    sp.setInt(SharedPreferencesKeys.readingBackgroundColor, color.toARGB32());
  }

  CalculationSettings getCalculationSettings() {
    final result = sp.getString(SharedPreferencesKeys.calculationSettings);
    if (result == null) {
      return CalculationSettings.defaultSettings;
    }
    return CalculationSettings.fromJson(jsonDecode(result));
  }

  void saveCalculationSettings(CalculationSettings settings) {
    sp.setString(
      SharedPreferencesKeys.calculationSettings,
      jsonEncode(settings.toJson()),
    );
  }

  bool getSilentDuringPrayer() {
    final result = sp.getBool(SharedPreferencesKeys.silentDuringPrayer);
    return result ?? false;
  }

  void saveSilentDuringPrayer(bool state) {
    sp.setBool(SharedPreferencesKeys.silentDuringPrayer, state);
  }

  SilentModeSettings getSilentModeSettings() {
    final result = sp.getString(SharedPreferencesKeys.silentModeSettings);
    if (result == null) {
      return SilentModeSettings.defaultSettings;
    }
    return SilentModeSettings.fromJson(jsonDecode(result));
  }

  void saveSilentModeSettings(SilentModeSettings settings) {
    sp.setString(
      SharedPreferencesKeys.silentModeSettings,
      jsonEncode(settings.toJson()),
    );
  }

  bool getBatteryOptimizationPrompted() {
    return sp.getBool(SharedPreferencesKeys.batteryOptimizationPrompted) ?? false;
  }

  Future<void> setBatteryOptimizationPrompted() async {
    await sp.setBool(SharedPreferencesKeys.batteryOptimizationPrompted, true);
  }
}
