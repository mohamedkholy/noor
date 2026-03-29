import 'dart:convert';
import 'dart:math';

import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:noor/core/database/cities/cities_database.dart';
import 'package:noor/core/di/dependency_injection.dart';
import 'package:noor/core/helpers/constants.dart';
import 'package:noor/core/helpers/prayer_times_helper.dart';
import 'package:noor/core/routing/my_routes.dart';
import 'package:noor/core/shared_preferences/shared_preferences_keys.dart';
import 'package:noor/core/shared_preferences/shared_preferences_settings_service.dart';
import 'package:noor/core/shared_preferences/shared_prefs_azan.dart';
import 'package:noor/features/properties/logic/properties_cubit.dart';
import 'package:noor/features/properties/ui/widgets/properties_count_widget.dart';
import 'package:noor/features/properties/ui/widgets/sunan_widget.dart';
import 'package:noor/features/settings/data/models/azan_notifications_settings.dart';
import 'package:noor/features/settings/data/models/azkar_notifications_settings.dart';
import 'package:noor/features/settings/data/models/azkar_type.dart';
import 'package:noor/features/settings/data/models/calculation_settings.dart';
import 'package:noor/features/settings/data/models/iqama_notifications_settings.dart';
import 'package:noor/features/settings/data/models/sunan_settings.dart';
import 'package:noor/generated/l10n.dart';
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
  static const _iqamaChannelId = 'iqama_channel';
  static const _iqamaChannelName = 'Iqama Notifications';
  static const _iqamaChannelDescription = 'Iqama Notifications';
  static const _sunanChannelId = 'sunan_channel';
  static const _sunanChannelName = 'Sunan Notifications';
  static const _sunanChannelDescription = 'Sunan Notifications';

  late AndroidNotificationChannel _azanNotificationChannel;
  late AndroidNotificationChannel _iqamaNotificationChannel;

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

  static const _sunanNotificationChannel = AndroidNotificationChannel(
    _sunanChannelId,
    _sunanChannelName,
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
    } else if (payload == S.current.sunnah) {
      showDialog(
        barrierColor: Colors.black87,
        context: navigatorKey.currentContext!,
        builder: (context) => BlocProvider(
          create: (context) => getIt<PropertiesCubit>(),
          child: Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 24,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const PropertiesCountWidget(),
                const SizedBox(height: 16),
                SunanWidget(
                  onSunanCompleted: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
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

  Future<void> _createIqamaNotificationChannel() async {
    _iqamaNotificationChannel = const AndroidNotificationChannel(
      _iqamaChannelId,
      _iqamaChannelName,
      importance: Importance.max,
      sound: RawResourceAndroidNotificationSound("iqama"),
    );
    await _localNotifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(_iqamaNotificationChannel);
  }

  Future<void> _createSunanNotificationChannel() async {
    await _localNotifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(_sunanNotificationChannel);
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
    await _createIqamaNotificationChannel();
    await _createSunanNotificationChannel();
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
    await _localNotifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(_iqamaNotificationChannel);
  }

  Future<void> scheduleNotifications() async {
    await _createAzanNotificationChannel();
    await _createPerodicAzkarNotificationChannel();
    cancelAllNotifications();
    final city = _getSavedCity() ?? Constants.defaultCity;
    final azanNotificationsSettings = _sp.getAzanNotificationSetting();
    final azkarNotificationsSettings = _sp.getAzkarNotificationSetting();
    final iqamaNotificationsSettings = _sp.getIqamaNotificationSetting();
    final sunanNotificationsSettings = _sp.getSunanSetting();
    final calculationSettings = _sp.getCalculationSettings();

    final perodicAzkarSettings = _sp.getPerodicAzkarSetting();
    for (int i = 0; i < 7; i++) {
      final date = DateUtils.dateOnly(DateTime.now()).add(Duration(days: i));
      final prayerTimes = PrayerTimesHelper.getPrayerTimes(
        city: city,
        date: date,
        settings: calculationSettings,
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
      if (iqamaNotificationsSettings.isEnabled) {
        _scheduleIqamaNotifications(prayerTimes, iqamaNotificationsSettings);
      }
      if (sunanNotificationsSettings.isEnabled) {
        _scheduleSunanNotifications(prayerTimes, sunanNotificationsSettings);
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
      S.current.hayya_alal_falah,
      '${S.current.time_of} ${S.current.sleepingAzkar}',
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
      (prayerTimes.fajr, S.current.fajr, azanNotificationsSettings.fajrState),
      (
        prayerTimes.dhuhr,
        S.current.dhuhr,
        azanNotificationsSettings.dhuhrState,
      ),
      (prayerTimes.asr, S.current.asr, azanNotificationsSettings.asrState),
      (
        prayerTimes.maghrib,
        S.current.maghrib,
        azanNotificationsSettings.maghribState,
      ),
      (prayerTimes.isha, S.current.isha, azanNotificationsSettings.ishaState),
    ];

    for (var e in prayerTimesList) {
      if (e.$1.isBefore(DateTime.now()) || !e.$3) continue;
      await _localNotifications.zonedSchedule(
        e.hashCode,
        S.current.hayya_alal_falah,
        '${S.current.time_of} ${e.$2}',
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
        S.current.morning_azkar,
        azkarMorningState,
        AzkarType.morning,
      ),
      (
        prayerTimes.maghrib.subtract(Duration(minutes: azkarEveningTime)),
        S.current.evening_azkar,
        azkarEveningState,
        AzkarType.evening,
      ),
    ];

    for (var e in azkarTimes) {
      if (e.$1.isBefore(DateTime.now()) || !e.$3) continue;
      await _localNotifications.zonedSchedule(
        e.hashCode,
        S.current.hayya_alal_falah,
        '${S.current.time_of} ${e.$2}',
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
      S.current.remember_allah,
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

  void _scheduleIqamaNotifications(
    PrayerTimes prayerTimes,
    IqamaNotificationsSettings iqamaNotificationsSettings,
  ) {
    final List<(DateTime, String, int)> prayerTimesList = [
      (prayerTimes.fajr, S.current.fajr, iqamaNotificationsSettings.fajrTime),
      (
        prayerTimes.dhuhr,
        S.current.dhuhr,
        iqamaNotificationsSettings.dhuhrTime,
      ),
      (prayerTimes.asr, S.current.asr, iqamaNotificationsSettings.asrTime),
      (
        prayerTimes.maghrib,
        S.current.maghrib,
        iqamaNotificationsSettings.maghribTime,
      ),
      (prayerTimes.isha, S.current.isha, iqamaNotificationsSettings.ishaTime),
    ];
    for (var e in prayerTimesList) {
      if (e.$1.add(Duration(minutes: e.$3)).isBefore(DateTime.now())) {
        continue;
      }
      _localNotifications.zonedSchedule(
        Random().nextInt(1000000),
        S.current.iqama_prayer,
        '${S.current.iqama_prayer} ${e.$2}',
        tz.TZDateTime.from(e.$1.add(Duration(minutes: e.$3)), tz.local),
        const NotificationDetails(
          android: AndroidNotificationDetails(
            _iqamaChannelId,
            _iqamaChannelName,
            channelDescription: _iqamaChannelDescription,
            sound: RawResourceAndroidNotificationSound("iqama"),
          ),
        ),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      );
    }
  }

  void _scheduleSunanNotifications(
    PrayerTimes prayerTimes,
    SunanSettings sunanNotificationsSettings,
  ) async {
    final List<(DateTime, String, bool)> prayerTimesList = [
      (
        prayerTimes.fajr,
        S.current.fajr_sunnah,
        sunanNotificationsSettings.fajrSunnah,
      ),
      (
        prayerTimes.dhuhr,
        S.current.dhuhrSunan,
        sunanNotificationsSettings.dhuhrSunan,
      ),
      (
        prayerTimes.maghrib,
        S.current.maghrib_sunnah,
        sunanNotificationsSettings.maghribSunnah,
      ),
      (
        prayerTimes.isha,
        S.current.isha_sunnah,
        sunanNotificationsSettings.ishaSunnah,
      ),
    ];

    for (var e in prayerTimesList) {
      if (e.$1.add(const Duration(minutes: 35)).isBefore(DateTime.now()) ||
          !e.$3) {
        continue;
      }

      await _localNotifications.zonedSchedule(
        Random().nextInt(1000000),
        S.current.hayya_alal_falah,
        '${S.current.did_you_pray} ${e.$2}${Intl.getCurrentLocale() == "ar" ? "؟" : "?"} ${S.current.sunan_message}',
        tz.TZDateTime.from(e.$1.add(const Duration(minutes: 35)), tz.local),
        const NotificationDetails(
          android: AndroidNotificationDetails(
            _sunanChannelId,
            _sunanChannelName,
            channelDescription: _sunanChannelDescription,
            sound: RawResourceAndroidNotificationSound("azkar"),
          ),
        ),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        payload: S.current.sunnah,
      );
    }
  }
}
