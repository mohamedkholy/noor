import 'dart:convert';

import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:injectable/injectable.dart';
import 'package:noor/core/database/cities/cities_database.dart';
import 'package:noor/core/di/dependency_injection.dart';
import 'package:noor/core/helpers/constants.dart';
import 'package:noor/core/helpers/prayer_times_helper.dart';
import 'package:noor/core/routing/my_routes.dart';
import 'package:noor/core/shared_preferences/shared_preferences_keys.dart';
import 'package:noor/core/shared_preferences/shared_preferences_settings_service.dart';
import 'package:noor/features/settings/data/models/azan_notifications_settings.dart';
import 'package:noor/features/settings/data/models/azkar_notifications_settings.dart';
import 'package:noor/features/settings/data/models/azkar_type.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

@singleton
class NotificationsManager {
  final SharedPreferencesSettingsService _sp;

  NotificationsManager(this._sp);

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final _localNotifications = FlutterLocalNotificationsPlugin();
  static const _azanChannelId = 'azan_channel';
  static const _azanChannelName = 'Azan Notifications';
  static const _azanChannelDescription = 'Azan Notifications';
  static const _azkarChannelId = 'azkar_channel';
  static const _azkarChannelName = 'Azkar Notifications';
  static const _azkarChannelDescription = 'Azkar Notifications';

  static const _azanNotificationChannel = AndroidNotificationChannel(
    _azanChannelId,
    _azanChannelName,
    importance: Importance.max,
    sound: RawResourceAndroidNotificationSound('azan'),
  );

  static const _azkarNotificationChannel = AndroidNotificationChannel(
    _azkarChannelId,
    _azkarChannelName,
    importance: Importance.max,
    sound: RawResourceAndroidNotificationSound('azkar'),
  );

  Future<PermissionStatus> requestPermission() async {
    return await Permission.notification.request();
  }

  Future<void> init() async {
    tz.initializeTimeZones();
    final String timeZone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZone));
    await _initializeLocalNotifications();
    await _createNotificationChannel();
  }

  Future<void> _initializeLocalNotifications() async {
    await _localNotifications.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings('ic_notification_icon'),
        iOS: DarwinInitializationSettings(),
      ),
      onDidReceiveNotificationResponse: _handleForegroundNotificationResponse,
    );
  }

  void _handleForegroundNotificationResponse(
    NotificationResponse notificationResponse,
  ) async {
    final payload = notificationResponse.payload;

    if (payload == null) return;

    if (payload == AzkarType.evening.name) {
      navigatorKey.currentState?.pushNamed(
        MyRoutes.azkarCategory,
        arguments: "أذكار المساء",
      );
    } else if (payload == AzkarType.morning.name) {
      navigatorKey.currentState?.pushNamed(
        MyRoutes.azkarCategory,
        arguments: "أذكار الصباح",
      );
    }
  }

  Future<void> _createNotificationChannel() async {
    await _localNotifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(_azanNotificationChannel);
    await _localNotifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(_azkarNotificationChannel);
  }

  void scheduleNotifications() {
    cancelAllNotifications();
    final city = _getSavedCity() ?? Constants.defaultCity;
    final azanNotificationsSettings = _sp.getAzanNotificationSetting();
    final azkarNotificationsSettings = _sp.getAzkarNotificationSetting();
    for (int i = 0; i < 12; i++) {
      final date = DateTime.now().add(Duration(days: i));
      final prayerTimes = PrayerTimesHelper.getPrayerTimes(
        city: city,
        date: date,
      );
      _scheduleAzanNotifications(prayerTimes, azanNotificationsSettings);
      if (azkarNotificationsSettings.morningAzkarState ||
          azkarNotificationsSettings.eveningAzkarState) {
        _scheduleAzkarNotifications(prayerTimes, azkarNotificationsSettings);
      }
    }
  }

  void cancelAllNotifications() {
    _localNotifications.cancelAll();
  }

  Future<void> _scheduleAzanNotifications(
    PrayerTimes prayerTimes,
    AzanNotificationsSettings azanNotificationsSettings,
  ) async {
    final List<(DateTime, String, bool)> prayerTimesList = [
      (prayerTimes.fajr, "الفجر", azanNotificationsSettings.fajrState),
      (prayerTimes.dhuhr, "الظهر", azanNotificationsSettings.dhuhrState),
      (prayerTimes.asr, "العصر", azanNotificationsSettings.asrState),
      (prayerTimes.maghrib, "المغرب", azanNotificationsSettings.maghribState),
      (prayerTimes.isha, "العشاء", azanNotificationsSettings.ishaState),
    ];

    for (var e in prayerTimesList) {
      if (e.$1.isBefore(DateTime.now()) || !e.$3) continue;
      await _localNotifications.zonedSchedule(
        e.hashCode,
        'حى على الفلاح',
        'حان موعد صلاة ${e.$2}',
        tz.TZDateTime.from(e.$1, tz.local),
        const NotificationDetails(
          android: AndroidNotificationDetails(
            _azanChannelId,
            _azanChannelName,
            channelDescription: _azanChannelDescription,
          ),
        ),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      );
    }
  }

  Future<void> _scheduleAzkarNotifications(
    PrayerTimes prayerTimes,
    AzkarNotificationsSettings azkarNotificationsSettings,
  ) async {
    final bool azkarMorningState = azkarNotificationsSettings.morningAzkarState;
    final bool azkarEveningState = azkarNotificationsSettings.eveningAzkarState;
    final int azkarMorningTime = azkarNotificationsSettings.morningAzkarTime;
    final int azkarEveningTime = azkarNotificationsSettings.eveningAzkarTime;
    final azkarTimes = [
      (
        prayerTimes.sunrise.subtract(Duration(minutes: azkarMorningTime)),
        "أذكار الصباح",
        azkarMorningState,
        AzkarType.morning,
      ),
      (
        prayerTimes.maghrib.subtract(Duration(minutes: azkarEveningTime)),
        "أذكار المساء",
        azkarEveningState,
        AzkarType.evening,
      ),
    ];

    for (var e in azkarTimes) {
      if (e.$1.isBefore(DateTime.now()) || !e.$3) continue;
      await _localNotifications.zonedSchedule(
        e.hashCode,
        'حى على الفلاح',
        'حان موعد ${e.$2}',
        tz.TZDateTime.from(e.$1, tz.local),
        const NotificationDetails(
          android: AndroidNotificationDetails(
            _azkarChannelId,
            _azkarChannelName,
            channelDescription: _azkarChannelDescription,
          ),
        ),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        payload: e.$4.name,
      );
    }
  }

  City? _getSavedCity() {
    final result = getIt<SharedPreferences>().getString(
      SharedPreferencesKeys.savedCity,
    );
    if (result == null) return null;
    final map = jsonDecode(result) as Map<String, dynamic>;
    return City.fromJson(map);
  }

  Future<String?> getNotificationPayload() async {
    final notificationAppLaunchDetails = await _localNotifications
        .getNotificationAppLaunchDetails();
    if (notificationAppLaunchDetails?.didNotificationLaunchApp == true) {
      return notificationAppLaunchDetails?.notificationResponse?.payload;
    }
    return null;
  }

  // void testNotification() {
  //   _localNotifications.show(
  //     1,
  //     'موعد الصلاة',
  //     'حان وقت صلاة الفجر',
  //     const NotificationDetails(
  //       android: AndroidNotificationDetails(
  //         _channeid,
  //         _channelName,
  //         channelDescription: _channelDescription,
  //       ),
  //     ),
  //   );
  // }
}
