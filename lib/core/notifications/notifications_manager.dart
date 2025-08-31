import 'dart:convert';

import 'package:adhan/adhan.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:noor/core/constants/shared_preferences_keys.dart';
import 'package:noor/core/database/cities/cities_database.dart';
import 'package:noor/core/di/dependency_injection.dart';
import 'package:noor/core/helpers/prayer_times_helper.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationsManager {
  NotificationsManager._();
  static final NotificationsManager instance = NotificationsManager._();

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
    );
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
    final city =
        _getSavedCity() ??
        const City(name: "Makkah", lat: 21.42664, lng: 39.82563, country: "SA");
    for (int i = 0; i < 12; i++) {
      final date = DateTime.now().add(Duration(days: i));
      final prayerTimes = PrayerTimesHelper.getPrayerTimes(
        city: city,
        date: date,
      );
      _scheduleAzanNotifications(prayerTimes);
      _scheduleAzkarNotifications(prayerTimes);
    }
  }

  void cancelAllNotifications() {
    _localNotifications.cancelAll();
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

  Future<void> _scheduleAzanNotifications(PrayerTimes prayerTimes) async {
    final List<(DateTime, String)> prayerTimesList = [
      (prayerTimes.fajr, "الفجر"),
      (prayerTimes.dhuhr, "الظهر"),
      (prayerTimes.asr, "العصر"),
      (prayerTimes.maghrib, "المغرب"),
      (prayerTimes.isha, "العشاء"),
    ];

    for (var e in prayerTimesList) {
      if (e.$1.isBefore(DateTime.now())) continue;
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

  Future<void> _scheduleAzkarNotifications(PrayerTimes prayerTimes) async {
    final azkarTimes = [
      (
        prayerTimes.sunrise.subtract(const Duration(minutes: 30)),
        "أذكار الصباح",
      ),
      (
        prayerTimes.maghrib.subtract(const Duration(hours: 1, minutes: 23)),
        "أذكار المساء",
      ),
    ];

    for (var e in azkarTimes) {
      if (e.$1.isBefore(DateTime.now())) continue;
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
}
