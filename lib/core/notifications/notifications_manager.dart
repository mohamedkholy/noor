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
import 'package:noor/core/shared_preferences/shared_prefs_azan.dart';
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
  final SharedPreferencesAzanService _azanSp;
  NotificationsManager(this._sp, this._azanSp);

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final _localNotifications = FlutterLocalNotificationsPlugin();
  static const _azanChannelDescription = 'Azan Notifications';
  static const _azkarChannelId = 'azkar_channel';
  static const _azkarChannelName = 'Azkar Notifications';
  static const _azkarChannelDescription = 'Azkar Notifications';
  static const _sleepingAzkarChannelId = 'sleeping_azkar_channel';
  static const _sleepingAzkarChannelName = 'Azkar Notifications';
  static const _sleepingAzkarChannelDescription = 'Azkar Notifications';
  late String _perodicAzkarChannelId;
  late String _perodicAzkarChannelName;
  static const _perodicAzkarChannelDescription = 'Perodic Azkar Notifications';

  late AndroidNotificationChannel _azanNotificationChannel;

  static const _azkarNotificationChannel = AndroidNotificationChannel(
    _azkarChannelId,
    _azkarChannelName,
    importance: Importance.max,
    sound: RawResourceAndroidNotificationSound('azkar'),
  );

  static const _sleepingAzkarNotificationChannel = AndroidNotificationChannel(
    _sleepingAzkarChannelId,
    _sleepingAzkarChannelName,
    importance: Importance.max,
    sound: RawResourceAndroidNotificationSound('azkar'),
  );

  late AndroidNotificationChannel _perodicAzkarNotificationChannel;

  late String azanSound;

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
    } else if (payload == AzkarType.sleeping.name) {
      navigatorKey.currentState?.pushNamed(
        MyRoutes.azkarCategory,
        arguments: "أذكار النوم",
      );
    }
  }

  Future<void> _createAzanNotificationChannel() async {
    azanSound = _azanSp.getAzanSound();
    _azanNotificationChannel = AndroidNotificationChannel(
      azanSound,
      azanSound.replaceAll("_", " "),
      importance: Importance.max,
      sound: RawResourceAndroidNotificationSound(azanSound),
    );
    await _localNotifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(_azanNotificationChannel);
  }

  Future<void> _createPerodicAzkarNotificationChannel() async {
    final sound = _sp.getPerodicAzkarSetting().sound;
    _perodicAzkarChannelId = sound;
    _perodicAzkarChannelName =
        "${sound.replaceAll("_", " ")} Perodic Notification";
    _perodicAzkarNotificationChannel = AndroidNotificationChannel(
      _perodicAzkarChannelId,
      _perodicAzkarChannelName,
      importance: Importance.max,
      sound: RawResourceAndroidNotificationSound(sound),
    );
    await _localNotifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(_perodicAzkarNotificationChannel);
  }

  Future<void> _createNotificationChannel() async {
    await _createAzanNotificationChannel();
    await _createPerodicAzkarNotificationChannel();
    await _localNotifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(_sleepingAzkarNotificationChannel);
    await _localNotifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(_azkarNotificationChannel);
  }

  Future<void> scheduleNotifications() async {
    await _createAzanNotificationChannel();
    await _createPerodicAzkarNotificationChannel();
    cancelAllNotifications();
    final city = _getSavedCity() ?? Constants.defaultCity;
    final azanNotificationsSettings = _sp.getAzanNotificationSetting();
    final azkarNotificationsSettings = _sp.getAzkarNotificationSetting();
    final perodicAzkarSettings = _sp.getPerodicAzkarSetting();
    for (int i = 0; i < 7; i++) {
      final date = DateUtils.dateOnly(DateTime.now()).add(Duration(days: i));
      final prayerTimes = PrayerTimesHelper.getPrayerTimes(
        city: city,
        date: date,
      );
      _scheduleAzanNotifications(prayerTimes, azanNotificationsSettings);
      if (azkarNotificationsSettings.sleepingAzkarState) {
        _scheduleSleepingAzkarNotifications(
          date,
          azkarNotificationsSettings.sleepingAzkarTime,
        );
      }
      if (azkarNotificationsSettings.morningAzkarState ||
          azkarNotificationsSettings.eveningAzkarState) {
        _scheduleAzkarNotifications(prayerTimes, azkarNotificationsSettings);
      }
    }
    if (perodicAzkarSettings.isActive) {
      _schedulePerodicAzkarNotifications(
        perodicAzkarSettings.perodicAzkarTime,
        perodicAzkarSettings.text,
      );
    }
  }

  void cancelAllNotifications() {
    _localNotifications.cancelAll();
  }

  void _scheduleSleepingAzkarNotifications(
    DateTime date,
    int sleepingAzkarTime,
  ) async {
    await _localNotifications.zonedSchedule(
      sleepingAzkarTime.hashCode,
      'حى على الفلاح',
      'حان موعد أذكار النوم',
      tz.TZDateTime.from(
        date
            .add(const Duration(days: 1))
            .subtract(Duration(hours: sleepingAzkarTime)),
        tz.local,
      ),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          _sleepingAzkarChannelId,
          _sleepingAzkarChannelName,
          channelDescription: _sleepingAzkarChannelDescription,
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
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
        NotificationDetails(
          android: AndroidNotificationDetails(
            azanSound,
            azanSound.replaceAll("_", " "),
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

  void _schedulePerodicAzkarNotifications(int perodicAzkarTime, String text) {
    _localNotifications.periodicallyShow(
      perodicAzkarTime.hashCode,
      'أذكر الله',
      text,
      perodicAzkarTime == 1
          ? RepeatInterval.everyMinute
          : RepeatInterval.hourly,
      NotificationDetails(
        android: AndroidNotificationDetails(
          _perodicAzkarChannelId,
          _perodicAzkarChannelName,
          channelDescription: _perodicAzkarChannelDescription,
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
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
