// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Morning Azkar`
  String get morning_azkar {
    return Intl.message(
      'Morning Azkar',
      name: 'morning_azkar',
      desc: '',
      args: [],
    );
  }

  /// `Evening Azkar`
  String get evening_azkar {
    return Intl.message(
      'Evening Azkar',
      name: 'evening_azkar',
      desc: '',
      args: [],
    );
  }

  /// `Azkar`
  String get azkar {
    return Intl.message('Azkar', name: 'azkar', desc: '', args: []);
  }

  /// `Notification Time`
  String get notification_time {
    return Intl.message(
      'Notification Time',
      name: 'notification_time',
      desc: '',
      args: [],
    );
  }

  /// `Minutes before`
  String get minutes_before {
    return Intl.message(
      'Minutes before',
      name: 'minutes_before',
      desc: '',
      args: [],
    );
  }

  /// `Shorok`
  String get shorok {
    return Intl.message('Shorok', name: 'shorok', desc: '', args: []);
  }

  /// `Maghrib`
  String get maghrib {
    return Intl.message('Maghrib', name: 'maghrib', desc: '', args: []);
  }

  /// `Isha`
  String get isha {
    return Intl.message('Isha', name: 'isha', desc: '', args: []);
  }

  /// `Asr`
  String get asr {
    return Intl.message('Asr', name: 'asr', desc: '', args: []);
  }

  /// `Dhuhr`
  String get dhuhr {
    return Intl.message('Dhuhr', name: 'dhuhr', desc: '', args: []);
  }

  /// `Fajr`
  String get fajr {
    return Intl.message('Fajr', name: 'fajr', desc: '', args: []);
  }

  /// `Azan Notifications`
  String get azan_notifications {
    return Intl.message(
      'Azan Notifications',
      name: 'azan_notifications',
      desc: '',
      args: [],
    );
  }

  /// `Azkar Notifications`
  String get azkar_notifications {
    return Intl.message(
      'Azkar Notifications',
      name: 'azkar_notifications',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Arabic`
  String get arabic {
    return Intl.message('Arabic', name: 'arabic', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `App Language`
  String get app_language {
    return Intl.message(
      'App Language',
      name: 'app_language',
      desc: '',
      args: [],
    );
  }

  /// `Location Settings`
  String get location_settings {
    return Intl.message(
      'Location Settings',
      name: 'location_settings',
      desc: '',
      args: [],
    );
  }

  /// `Automatic Location Update`
  String get automatic_location_update {
    return Intl.message(
      'Automatic Location Update',
      name: 'automatic_location_update',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `in`
  String get in_word {
    return Intl.message('in', name: 'in_word', desc: '', args: []);
  }

  /// `Quran`
  String get quran {
    return Intl.message('Quran', name: 'quran', desc: '', args: []);
  }

  /// `Calendar`
  String get calendar {
    return Intl.message('Calendar', name: 'calendar', desc: '', args: []);
  }

  /// `Near mosque`
  String get near_mosque {
    return Intl.message('Near mosque', name: 'near_mosque', desc: '', args: []);
  }

  /// `Qibla`
  String get qibla {
    return Intl.message('Qibla', name: 'qibla', desc: '', args: []);
  }

  /// `Tasbih`
  String get tasbih {
    return Intl.message('Tasbih', name: 'tasbih', desc: '', args: []);
  }

  /// `Hadith`
  String get hadith {
    return Intl.message('Hadith', name: 'hadith', desc: '', args: []);
  }

  /// `Last Read`
  String get last_read {
    return Intl.message('Last Read', name: 'last_read', desc: '', args: []);
  }

  /// `Continue`
  String get continue_word {
    return Intl.message('Continue', name: 'continue_word', desc: '', args: []);
  }

  /// `Aya`
  String get aya {
    return Intl.message('Aya', name: 'aya', desc: '', args: []);
  }

  /// `Surah`
  String get surah {
    return Intl.message('Surah', name: 'surah', desc: '', args: []);
  }

  /// `Juz`
  String get juz {
    return Intl.message('Juz', name: 'juz', desc: '', args: []);
  }

  /// `Ayah of the Day`
  String get ayah_of_the_day {
    return Intl.message(
      'Ayah of the Day',
      name: 'ayah_of_the_day',
      desc: '',
      args: [],
    );
  }

  /// `Hadith of the Day`
  String get hadith_of_the_day {
    return Intl.message(
      'Hadith of the Day',
      name: 'hadith_of_the_day',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Location`
  String get location {
    return Intl.message('Location', name: 'location', desc: '', args: []);
  }

  /// `Current Location`
  String get current_location {
    return Intl.message(
      'Current Location',
      name: 'current_location',
      desc: '',
      args: [],
    );
  }

  /// `Relocate`
  String get Relocate {
    return Intl.message('Relocate', name: 'Relocate', desc: '', args: []);
  }

  /// `Ask Again`
  String get ask_again {
    return Intl.message('Ask Again', name: 'ask_again', desc: '', args: []);
  }

  /// `Location service disabled`
  String get location_disabled {
    return Intl.message(
      'Location service disabled',
      name: 'location_disabled',
      desc: '',
      args: [],
    );
  }

  /// `To get your current location you must accept the location permission`
  String get location_permission {
    return Intl.message(
      'To get your current location you must accept the location permission',
      name: 'location_permission',
      desc: '',
      args: [],
    );
  }

  /// `You need to allow location permission from settings`
  String get location_permission_settings {
    return Intl.message(
      'You need to allow location permission from settings',
      name: 'location_permission_settings',
      desc: '',
      args: [],
    );
  }

  /// `Sahih Muslim`
  String get sahih_muslim {
    return Intl.message(
      'Sahih Muslim',
      name: 'sahih_muslim',
      desc: '',
      args: [],
    );
  }

  /// `Authentic Hadith Collection`
  String get authentic_hadith_collection {
    return Intl.message(
      'Authentic Hadith Collection',
      name: 'authentic_hadith_collection',
      desc: '',
      args: [],
    );
  }

  /// `Sahih Bukhari`
  String get sahih_bukhari {
    return Intl.message(
      'Sahih Bukhari',
      name: 'sahih_bukhari',
      desc: '',
      args: [],
    );
  }

  /// `Reset Tasbih`
  String get reset_tasbih {
    return Intl.message(
      'Reset Tasbih',
      name: 'reset_tasbih',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to reset the count? This action cannot be undone.`
  String get reset_confirmation {
    return Intl.message(
      'Are you sure you want to reset the count? This action cannot be undone.',
      name: 'reset_confirmation',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Reset`
  String get reset {
    return Intl.message('Reset', name: 'reset', desc: '', args: []);
  }

  /// `Add`
  String get add {
    return Intl.message('Add', name: 'add', desc: '', args: []);
  }

  /// `Edit`
  String get edit {
    return Intl.message('Edit', name: 'edit', desc: '', args: []);
  }

  /// `Zekr`
  String get zekr {
    return Intl.message('Zekr', name: 'zekr', desc: '', args: []);
  }

  /// `Field is required`
  String get field_is_required {
    return Intl.message(
      'Field is required',
      name: 'field_is_required',
      desc: '',
      args: [],
    );
  }

  /// `Already added`
  String get already_added {
    return Intl.message(
      'Already added',
      name: 'already_added',
      desc: '',
      args: [],
    );
  }

  /// `Count (optional)`
  String get count_optional {
    return Intl.message(
      'Count (optional)',
      name: 'count_optional',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message('Delete', name: 'delete', desc: '', args: []);
  }

  /// `Count`
  String get repetition {
    return Intl.message('Count', name: 'repetition', desc: '', args: []);
  }

  /// `Tasbih`
  String get the_tasbih {
    return Intl.message('Tasbih', name: 'the_tasbih', desc: '', args: []);
  }

  /// `Retry`
  String get retry {
    return Intl.message('Retry', name: 'retry', desc: '', args: []);
  }

  /// `Open Settings`
  String get open_settings {
    return Intl.message(
      'Open Settings',
      name: 'open_settings',
      desc: '',
      args: [],
    );
  }

  /// `Please enable Location service`
  String get enable_location_service {
    return Intl.message(
      'Please enable Location service',
      name: 'enable_location_service',
      desc: '',
      args: [],
    );
  }

  /// `Your device doesn't support compass sensor`
  String get no_compass_sensor {
    return Intl.message(
      'Your device doesn\'t support compass sensor',
      name: 'no_compass_sensor',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message('Error', name: 'error', desc: '', args: []);
  }

  /// `No internet connection`
  String get no_internet_connection {
    return Intl.message(
      'No internet connection',
      name: 'no_internet_connection',
      desc: '',
      args: [],
    );
  }

  /// `Unknown error has occurred`
  String get unknown_error {
    return Intl.message(
      'Unknown error has occurred',
      name: 'unknown_error',
      desc: '',
      args: [],
    );
  }

  /// `No nearby mosques found`
  String get no_nearby_mosques_found {
    return Intl.message(
      'No nearby mosques found',
      name: 'no_nearby_mosques_found',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get details {
    return Intl.message('Details', name: 'details', desc: '', args: []);
  }

  /// `Nearby Mosques`
  String get nearby_mosques {
    return Intl.message(
      'Nearby Mosques',
      name: 'nearby_mosques',
      desc: '',
      args: [],
    );
  }

  /// `Aerial Distance`
  String get aerial_distance {
    return Intl.message(
      'Aerial Distance',
      name: 'aerial_distance',
      desc: '',
      args: [],
    );
  }

  /// `Road Distance`
  String get road_distance {
    return Intl.message(
      'Road Distance',
      name: 'road_distance',
      desc: '',
      args: [],
    );
  }

  /// `KM`
  String get km {
    return Intl.message('KM', name: 'km', desc: '', args: []);
  }

  /// `Start Navigation`
  String get start_navigation {
    return Intl.message(
      'Start Navigation',
      name: 'start_navigation',
      desc: '',
      args: [],
    );
  }

  /// `Calender`
  String get calender {
    return Intl.message('Calender', name: 'calender', desc: '', args: []);
  }

  /// `Search...`
  String get search {
    return Intl.message('Search...', name: 'search', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
