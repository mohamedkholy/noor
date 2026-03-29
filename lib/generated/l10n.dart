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
    final name = (locale.countryCode?.isEmpty ?? false)
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

  /// `Hour before`
  String get hour_before {
    return Intl.message('Hour before', name: 'hour_before', desc: '', args: []);
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

  /// `Juz`
  String get juz_2 {
    return Intl.message('Juz', name: 'juz_2', desc: '', args: []);
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

  /// `Azan Sounds`
  String get azansounds {
    return Intl.message('Azan Sounds', name: 'azansounds', desc: '', args: []);
  }

  /// `Midnight`
  String get beforeMidNight {
    return Intl.message('Midnight', name: 'beforeMidNight', desc: '', args: []);
  }

  /// `Sleeping Azkar`
  String get sleepingAzkar {
    return Intl.message(
      'Sleeping Azkar',
      name: 'sleepingAzkar',
      desc: '',
      args: [],
    );
  }

  /// `Mushaf`
  String get mushafStyle {
    return Intl.message('Mushaf', name: 'mushafStyle', desc: '', args: []);
  }

  /// `Ayat`
  String get ayatStyle {
    return Intl.message('Ayat', name: 'ayatStyle', desc: '', args: []);
  }

  /// `Connection timed out`
  String get connectionTimedOut {
    return Intl.message(
      'Connection timed out',
      name: 'connectionTimedOut',
      desc: '',
      args: [],
    );
  }

  /// `Send request timeout`
  String get sendTimeout {
    return Intl.message(
      'Send request timeout',
      name: 'sendTimeout',
      desc: '',
      args: [],
    );
  }

  /// `Receive timeout`
  String get receiveTimeout {
    return Intl.message(
      'Receive timeout',
      name: 'receiveTimeout',
      desc: '',
      args: [],
    );
  }

  /// `Server error:`
  String get serverError {
    return Intl.message(
      'Server error:',
      name: 'serverError',
      desc: '',
      args: [],
    );
  }

  /// `Request was cancelled`
  String get requestCancelled {
    return Intl.message(
      'Request was cancelled',
      name: 'requestCancelled',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection`
  String get noInternetConnection {
    return Intl.message(
      'No internet connection',
      name: 'noInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Unexpected error occurred`
  String get unexpectedError {
    return Intl.message(
      'Unexpected error occurred',
      name: 'unexpectedError',
      desc: '',
      args: [],
    );
  }

  /// `Radio`
  String get radio {
    return Intl.message('Radio', name: 'radio', desc: '', args: []);
  }

  /// `Perodic Azkar Settings`
  String get perodicAzkarSettings {
    return Intl.message(
      'Perodic Azkar Settings',
      name: 'perodicAzkarSettings',
      desc: '',
      args: [],
    );
  }

  /// `Activate Perodic Azkar`
  String get activatePerodicAzkar {
    return Intl.message(
      'Activate Perodic Azkar',
      name: 'activatePerodicAzkar',
      desc: '',
      args: [],
    );
  }

  /// `Minutes`
  String get minutes {
    return Intl.message('Minutes', name: 'minutes', desc: '', args: []);
  }

  /// `Every`
  String get every {
    return Intl.message('Every', name: 'every', desc: '', args: []);
  }

  /// `Hourly`
  String get hourly {
    return Intl.message('Hourly', name: 'hourly', desc: '', args: []);
  }

  /// `Every Minute`
  String get everyMinute {
    return Intl.message(
      'Every Minute',
      name: 'everyMinute',
      desc: '',
      args: [],
    );
  }

  /// `Daily Target`
  String get daily_target {
    return Intl.message(
      'Daily Target',
      name: 'daily_target',
      desc: '',
      args: [],
    );
  }

  /// `Daily Target (optional)`
  String get daily_target_optional {
    return Intl.message(
      'Daily Target (optional)',
      name: 'daily_target_optional',
      desc: '',
      args: [],
    );
  }

  /// `Settings saved`
  String get settingsSaved {
    return Intl.message(
      'Settings saved',
      name: 'settingsSaved',
      desc: '',
      args: [],
    );
  }

  /// `Previous`
  String get previous {
    return Intl.message('Previous', name: 'previous', desc: '', args: []);
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message('Get Started', name: 'getStarted', desc: '', args: []);
  }

  /// `Skip`
  String get skip {
    return Intl.message('Skip', name: 'skip', desc: '', args: []);
  }

  /// `Loading...`
  String get loading {
    return Intl.message('Loading...', name: 'loading', desc: '', args: []);
  }

  /// `Welcome to Noor`
  String get onboarding_welcome_title {
    return Intl.message(
      'Welcome to Noor',
      name: 'onboarding_welcome_title',
      desc: '',
      args: [],
    );
  }

  /// `Your companion for prayer times and daily remembrances`
  String get onboarding_welcome_description {
    return Intl.message(
      'Your companion for prayer times and daily remembrances',
      name: 'onboarding_welcome_description',
      desc: '',
      args: [],
    );
  }

  /// `Never miss prayer times with accurate notifications`
  String get onboarding_welcome_point1 {
    return Intl.message(
      'Never miss prayer times with accurate notifications',
      name: 'onboarding_welcome_point1',
      desc: '',
      args: [],
    );
  }

  /// `Customize your azan sounds from renowned reciters`
  String get onboarding_welcome_point2 {
    return Intl.message(
      'Customize your azan sounds from renowned reciters',
      name: 'onboarding_welcome_point2',
      desc: '',
      args: [],
    );
  }

  /// `Stay connected with daily azkar reminders`
  String get onboarding_welcome_point3 {
    return Intl.message(
      'Stay connected with daily azkar reminders',
      name: 'onboarding_welcome_point3',
      desc: '',
      args: [],
    );
  }

  /// `Prayer Notifications`
  String get onboarding_prayer_notifications_title {
    return Intl.message(
      'Prayer Notifications',
      name: 'onboarding_prayer_notifications_title',
      desc: '',
      args: [],
    );
  }

  /// `Enable notifications for all five daily prayers`
  String get onboarding_prayer_notifications_description {
    return Intl.message(
      'Enable notifications for all five daily prayers',
      name: 'onboarding_prayer_notifications_description',
      desc: '',
      args: [],
    );
  }

  /// `Fajr (Dawn) - Start your day with prayer`
  String get onboarding_prayer_fajr_desc {
    return Intl.message(
      'Fajr (Dawn) - Start your day with prayer',
      name: 'onboarding_prayer_fajr_desc',
      desc: '',
      args: [],
    );
  }

  /// `Dhuhr (Noon) - Midday prayer reminder`
  String get onboarding_prayer_dhuhr_desc {
    return Intl.message(
      'Dhuhr (Noon) - Midday prayer reminder',
      name: 'onboarding_prayer_dhuhr_desc',
      desc: '',
      args: [],
    );
  }

  /// `Asr (Afternoon) - Late afternoon prayer`
  String get onboarding_prayer_asr_desc {
    return Intl.message(
      'Asr (Afternoon) - Late afternoon prayer',
      name: 'onboarding_prayer_asr_desc',
      desc: '',
      args: [],
    );
  }

  /// `Maghrib (Sunset) - Evening prayer time`
  String get onboarding_prayer_maghrib_desc {
    return Intl.message(
      'Maghrib (Sunset) - Evening prayer time',
      name: 'onboarding_prayer_maghrib_desc',
      desc: '',
      args: [],
    );
  }

  /// `Isha (Night) - Complete your daily prayers`
  String get onboarding_prayer_isha_desc {
    return Intl.message(
      'Isha (Night) - Complete your daily prayers',
      name: 'onboarding_prayer_isha_desc',
      desc: '',
      args: [],
    );
  }

  /// `Azan Sounds`
  String get onboarding_azan_sounds_title {
    return Intl.message(
      'Azan Sounds',
      name: 'onboarding_azan_sounds_title',
      desc: '',
      args: [],
    );
  }

  /// `Choose your favorite azan recitation`
  String get onboarding_azan_sounds_description {
    return Intl.message(
      'Choose your favorite azan recitation',
      name: 'onboarding_azan_sounds_description',
      desc: '',
      args: [],
    );
  }

  /// `Makkah & Madinah masjid recitations`
  String get onboarding_azan_sound_desc1 {
    return Intl.message(
      'Makkah & Madinah masjid recitations',
      name: 'onboarding_azan_sound_desc1',
      desc: '',
      args: [],
    );
  }

  /// `Famous reciters like Mishary Alafasy`
  String get onboarding_azan_sound_desc2 {
    return Intl.message(
      'Famous reciters like Mishary Alafasy',
      name: 'onboarding_azan_sound_desc2',
      desc: '',
      args: [],
    );
  }

  /// `Different regional styles available`
  String get onboarding_azan_sound_desc3 {
    return Intl.message(
      'Different regional styles available',
      name: 'onboarding_azan_sound_desc3',
      desc: '',
      args: [],
    );
  }

  /// `Preview sounds before selecting`
  String get onboarding_azan_sound_desc4 {
    return Intl.message(
      'Preview sounds before selecting',
      name: 'onboarding_azan_sound_desc4',
      desc: '',
      args: [],
    );
  }

  /// `Daily Azkar`
  String get onboarding_daily_azkar_title {
    return Intl.message(
      'Daily Azkar',
      name: 'onboarding_daily_azkar_title',
      desc: '',
      args: [],
    );
  }

  /// `Schedule morning, evening, and sleeping remembrances`
  String get onboarding_daily_azkar_description {
    return Intl.message(
      'Schedule morning, evening, and sleeping remembrances',
      name: 'onboarding_daily_azkar_description',
      desc: '',
      args: [],
    );
  }

  /// `Morning Azkar - Start your day with gratitude`
  String get onboarding_morning_azkar_desc {
    return Intl.message(
      'Morning Azkar - Start your day with gratitude',
      name: 'onboarding_morning_azkar_desc',
      desc: '',
      args: [],
    );
  }

  /// `Evening Azkar - End your day with remembrance`
  String get onboarding_evening_azkar_desc {
    return Intl.message(
      'Evening Azkar - End your day with remembrance',
      name: 'onboarding_evening_azkar_desc',
      desc: '',
      args: [],
    );
  }

  /// `Sleeping Azkar - Protection before sleep`
  String get onboarding_sleeping_azkar_desc {
    return Intl.message(
      'Sleeping Azkar - Protection before sleep',
      name: 'onboarding_sleeping_azkar_desc',
      desc: '',
      args: [],
    );
  }

  /// `Customizable timing for your routine`
  String get onboarding_customizable_timing_desc {
    return Intl.message(
      'Customizable timing for your routine',
      name: 'onboarding_customizable_timing_desc',
      desc: '',
      args: [],
    );
  }

  /// `Periodic Reminders`
  String get onboarding_periodic_reminders_title {
    return Intl.message(
      'Periodic Reminders',
      name: 'onboarding_periodic_reminders_title',
      desc: '',
      args: [],
    );
  }

  /// `Stay connected throughout the day with periodic dhikr`
  String get onboarding_periodic_reminders_description {
    return Intl.message(
      'Stay connected throughout the day with periodic dhikr',
      name: 'onboarding_periodic_reminders_description',
      desc: '',
      args: [],
    );
  }

  /// `Periodic reminders`
  String get onboarding_hourly_reminders_desc {
    return Intl.message(
      'Periodic reminders',
      name: 'onboarding_hourly_reminders_desc',
      desc: '',
      args: [],
    );
  }

  /// `Every-minute dhikr options`
  String get onboarding_every_minute_dhikr_desc {
    return Intl.message(
      'Every-minute dhikr options',
      name: 'onboarding_every_minute_dhikr_desc',
      desc: '',
      args: [],
    );
  }

  /// `Choose from different remembrance types`
  String get onboarding_different_remembrance_types_desc {
    return Intl.message(
      'Choose from different remembrance types',
      name: 'onboarding_different_remembrance_types_desc',
      desc: '',
      args: [],
    );
  }

  /// `Automatic location for accurate prayer times`
  String get onboarding_automatic_location_desc {
    return Intl.message(
      'Automatic location for accurate prayer times',
      name: 'onboarding_automatic_location_desc',
      desc: '',
      args: [],
    );
  }

  /// `Language & Settings`
  String get onboarding_language_setup_title {
    return Intl.message(
      'Language & Settings',
      name: 'onboarding_language_setup_title',
      desc: '',
      args: [],
    );
  }

  /// `Customize your app experience`
  String get onboarding_language_setup_description {
    return Intl.message(
      'Customize your app experience',
      name: 'onboarding_language_setup_description',
      desc: '',
      args: [],
    );
  }

  /// `Switch between English and Arabic`
  String get onboarding_switch_languages_desc {
    return Intl.message(
      'Switch between English and Arabic',
      name: 'onboarding_switch_languages_desc',
      desc: '',
      args: [],
    );
  }

  /// `All settings are customizable anytime`
  String get onboarding_customizable_settings_desc {
    return Intl.message(
      'All settings are customizable anytime',
      name: 'onboarding_customizable_settings_desc',
      desc: '',
      args: [],
    );
  }

  /// `Access settings from the main menu`
  String get onboarding_access_settings_desc {
    return Intl.message(
      'Access settings from the main menu',
      name: 'onboarding_access_settings_desc',
      desc: '',
      args: [],
    );
  }

  /// `Your preferences are saved automatically`
  String get onboarding_preferences_saved_desc {
    return Intl.message(
      'Your preferences are saved automatically',
      name: 'onboarding_preferences_saved_desc',
      desc: '',
      args: [],
    );
  }

  /// `Azan Sound`
  String get onboarding_azan_sound_label {
    return Intl.message(
      'Azan Sound',
      name: 'onboarding_azan_sound_label',
      desc: '',
      args: [],
    );
  }

  /// `Periodic Azkar`
  String get onboarding_periodic_azkar_label {
    return Intl.message(
      'Periodic Azkar',
      name: 'onboarding_periodic_azkar_label',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get onboarding_language_label {
    return Intl.message(
      'Language',
      name: 'onboarding_language_label',
      desc: '',
      args: [],
    );
  }

  /// `Iqama Notifications`
  String get iqama_notifications {
    return Intl.message(
      'Iqama Notifications',
      name: 'iqama_notifications',
      desc: '',
      args: [],
    );
  }

  /// `Choose Time After Azan`
  String get chooseTimeAfterAzan {
    return Intl.message(
      'Choose Time After Azan',
      name: 'chooseTimeAfterAzan',
      desc: '',
      args: [],
    );
  }

  /// `Iqama`
  String get iqama_prayer {
    return Intl.message('Iqama', name: 'iqama_prayer', desc: '', args: []);
  }

  /// `Remember Allah`
  String get remember_allah {
    return Intl.message(
      'Remember Allah',
      name: 'remember_allah',
      desc: '',
      args: [],
    );
  }

  /// `Hayyaalal Falah`
  String get hayya_alal_falah {
    return Intl.message(
      'Hayyaalal Falah',
      name: 'hayya_alal_falah',
      desc: '',
      args: [],
    );
  }

  /// `Time of`
  String get time_of {
    return Intl.message('Time of', name: 'time_of', desc: '', args: []);
  }

  /// `The Hereafter Store`
  String get the_hereafter_store {
    return Intl.message(
      'The Hereafter Store',
      name: 'the_hereafter_store',
      desc: '',
      args: [],
    );
  }

  /// `Sunnah Prayers`
  String get sunnah_prayers {
    return Intl.message(
      'Sunnah Prayers',
      name: 'sunnah_prayers',
      desc: '',
      args: [],
    );
  }

  /// `Sunnah`
  String get sunnah {
    return Intl.message('Sunnah', name: 'sunnah', desc: '', args: []);
  }

  /// `Fajr Sunnah`
  String get fajr_sunnah {
    return Intl.message('Fajr Sunnah', name: 'fajr_sunnah', desc: '', args: []);
  }

  /// `Before Dhuhr Sunnah`
  String get before_dhuhr_sunnah {
    return Intl.message(
      'Before Dhuhr Sunnah',
      name: 'before_dhuhr_sunnah',
      desc: '',
      args: [],
    );
  }

  /// `After Dhuhr Sunnah`
  String get after_dhuhr_sunnah {
    return Intl.message(
      'After Dhuhr Sunnah',
      name: 'after_dhuhr_sunnah',
      desc: '',
      args: [],
    );
  }

  /// `Maghrib Sunnah`
  String get maghrib_sunnah {
    return Intl.message(
      'Maghrib Sunnah',
      name: 'maghrib_sunnah',
      desc: '',
      args: [],
    );
  }

  /// `Isha Sunnah`
  String get isha_sunnah {
    return Intl.message('Isha Sunnah', name: 'isha_sunnah', desc: '', args: []);
  }

  /// `Properties Count`
  String get properties_count_title {
    return Intl.message(
      'Properties Count',
      name: 'properties_count_title',
      desc: '',
      args: [],
    );
  }

  /// `The Rewards`
  String get properties_reward_title {
    return Intl.message(
      'The Rewards',
      name: 'properties_reward_title',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations! You have completed the Sunan Rawatib for today, and a house has been built for you in Paradise.`
  String get complete_sunan_message {
    return Intl.message(
      'Congratulations! You have completed the Sunan Rawatib for today, and a house has been built for you in Paradise.',
      name: 'complete_sunan_message',
      desc: '',
      args: [],
    );
  }

  /// `Umm Habibah (May Allah be pleased with her) the Mother of the Believers reported: I heard the Messenger of Allah (ﷺ) saying, "A house will be built in Jannah for every Muslim who offers twelve Rak'ah of optional Salat other than the obligatory Salat in a day and a night (to seek the Pleasure of Allah)." (Muslim).`
  String get properties_reward_hadith {
    return Intl.message(
      'Umm Habibah (May Allah be pleased with her) the Mother of the Believers reported: I heard the Messenger of Allah (ﷺ) saying, "A house will be built in Jannah for every Muslim who offers twelve Rak\'ah of optional Salat other than the obligatory Salat in a day and a night (to seek the Pleasure of Allah)." (Muslim).',
      name: 'properties_reward_hadith',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations! You have completed the funeral until burial, and you have earned two qirats.`
  String get complete_jinaazah_until_burial_message {
    return Intl.message(
      'Congratulations! You have completed the funeral until burial, and you have earned two qirats.',
      name: 'complete_jinaazah_until_burial_message',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations! You have completed the funeral until prayer, and you have earned one qirat.`
  String get complete_jinaazah_until_prayer_message {
    return Intl.message(
      'Congratulations! You have completed the funeral until prayer, and you have earned one qirat.',
      name: 'complete_jinaazah_until_prayer_message',
      desc: '',
      args: [],
    );
  }

  /// `It was narrated from Abu Hurairah (may Allah be pleased with him) that the Messenger of Allah (peace and blessings of Allah be upon him) said: Whoever attends the funeral until the prayer is offered, he will have one qirat, and whoever attends until the deceased is buried, he will have two qirats. They said: What are the two qirats? He said: Like two great mountains. (Narrated by Muslim).`
  String get complete_jinaazah_hadith {
    return Intl.message(
      'It was narrated from Abu Hurairah (may Allah be pleased with him) that the Messenger of Allah (peace and blessings of Allah be upon him) said: Whoever attends the funeral until the prayer is offered, he will have one qirat, and whoever attends until the deceased is buried, he will have two qirats. They said: What are the two qirats? He said: Like two great mountains. (Narrated by Muslim).',
      name: 'complete_jinaazah_hadith',
      desc: '',
      args: [],
    );
  }

  /// `qirat`
  String get qirat {
    return Intl.message('qirat', name: 'qirat', desc: '', args: []);
  }

  /// `qirats count`
  String get lands_count {
    return Intl.message(
      'qirats count',
      name: 'lands_count',
      desc: '',
      args: [],
    );
  }

  /// `Until burial`
  String get until_burial {
    return Intl.message(
      'Until burial',
      name: 'until_burial',
      desc: '',
      args: [],
    );
  }

  /// `Until prayer`
  String get until_prayer {
    return Intl.message(
      'Until prayer',
      name: 'until_prayer',
      desc: '',
      args: [],
    );
  }

  /// `Follow Jinaazah`
  String get follow_jinaazah {
    return Intl.message(
      'Follow Jinaazah',
      name: 'follow_jinaazah',
      desc: '',
      args: [],
    );
  }

  /// `Real Estate Section`
  String get sRealEstateSection {
    return Intl.message(
      'Real Estate Section',
      name: 'sRealEstateSection',
      desc: '',
      args: [],
    );
  }

  /// `Lands Section`
  String get sLandsSection {
    return Intl.message(
      'Lands Section',
      name: 'sLandsSection',
      desc: '',
      args: [],
    );
  }

  /// `Agriculture Section`
  String get sAgricultureSection {
    return Intl.message(
      'Agriculture Section',
      name: 'sAgricultureSection',
      desc: '',
      args: [],
    );
  }

  /// `Treasures Section`
  String get sTreasuresSection {
    return Intl.message(
      'Treasures Section',
      name: 'sTreasuresSection',
      desc: '',
      args: [],
    );
  }

  /// `Hajj and Umrah Section`
  String get sHajjAndUmrahSection {
    return Intl.message(
      'Hajj and Umrah Section',
      name: 'sHajjAndUmrahSection',
      desc: '',
      args: [],
    );
  }

  /// `Al-Tirmidhi narrated from Jabir (may Allah be pleased with him) that the Messenger of Allah (peace and blessings be upon him) said: “Whoever says Subhan Allahi Al-‘Azim wa bihamdih (Glory be to Allah the Most Great and praise be to Him), a palm tree will be planted for him in Paradise,” and Ibn Majah narrated from Abu Hurairah (may Allah be pleased with him) that the Messenger of Allah (peace and blessings be upon him) passed by him while he was planting and said, “O Abu Hurairah, what are you planting?” He said, “Something for myself.” He said, “Shall I guide you to something better than this? Say: Subhan Allah, Alhamdulillah, La ilaha illa Allah, and Allahu Akbar, for with each one, a tree will be planted for you in Paradise.”`
  String get agriculture_hadith {
    return Intl.message(
      'Al-Tirmidhi narrated from Jabir (may Allah be pleased with him) that the Messenger of Allah (peace and blessings be upon him) said: “Whoever says Subhan Allahi Al-‘Azim wa bihamdih (Glory be to Allah the Most Great and praise be to Him), a palm tree will be planted for him in Paradise,” and Ibn Majah narrated from Abu Hurairah (may Allah be pleased with him) that the Messenger of Allah (peace and blessings be upon him) passed by him while he was planting and said, “O Abu Hurairah, what are you planting?” He said, “Something for myself.” He said, “Shall I guide you to something better than this? Say: Subhan Allah, Alhamdulillah, La ilaha illa Allah, and Allahu Akbar, for with each one, a tree will be planted for you in Paradise.”',
      name: 'agriculture_hadith',
      desc: '',
      args: [],
    );
  }

  /// `Number of trees`
  String get tree_count {
    return Intl.message(
      'Number of trees',
      name: 'tree_count',
      desc: '',
      args: [],
    );
  }

  /// `Plant Tree`
  String get plant_tree {
    return Intl.message('Plant Tree', name: 'plant_tree', desc: '', args: []);
  }

  /// `TreasuresCount`
  String get treasures_count {
    return Intl.message(
      'TreasuresCount',
      name: 'treasures_count',
      desc: '',
      args: [],
    );
  }

  /// `It was narrated that Abu Musa said:"The Prophet (saas) heard me saying: 'La hawla wa la quwwata illa billah (there is no power and no strength except with Allah).' He said: 'O 'Abdullah bin Qais! Shall I not tell you of a word which is one of the treasures of Paradise?' I said: 'Yes, O Messenger of Allah.' He said: 'Say: La hawla wa la quwwata illa billah (There is no power and no strength except with Allah).'"`
  String get treasures_reward_hadith {
    return Intl.message(
      'It was narrated that Abu Musa said:"The Prophet (saas) heard me saying: \'La hawla wa la quwwata illa billah (there is no power and no strength except with Allah).\' He said: \'O \'Abdullah bin Qais! Shall I not tell you of a word which is one of the treasures of Paradise?\' I said: \'Yes, O Messenger of Allah.\' He said: \'Say: La hawla wa la quwwata illa billah (There is no power and no strength except with Allah).\'"',
      name: 'treasures_reward_hadith',
      desc: '',
      args: [],
    );
  }

  /// `win a treasure`
  String get win_treasure {
    return Intl.message(
      'win a treasure',
      name: 'win_treasure',
      desc: '',
      args: [],
    );
  }

  /// `Tafsir`
  String get tafsir {
    return Intl.message('Tafsir', name: 'tafsir', desc: '', args: []);
  }

  /// `Options`
  String get options {
    return Intl.message('Options', name: 'options', desc: '', args: []);
  }

  /// `Play Aya`
  String get playAya {
    return Intl.message('Play Aya', name: 'playAya', desc: '', args: []);
  }

  /// `Listen to recitation`
  String get playAyaSublabel {
    return Intl.message(
      'Listen to recitation',
      name: 'playAyaSublabel',
      desc: '',
      args: [],
    );
  }

  /// `Read interpretation`
  String get tafsirSublabel {
    return Intl.message(
      'Read interpretation',
      name: 'tafsirSublabel',
      desc: '',
      args: [],
    );
  }

  /// `Press on aya and hold to show options`
  String get pressToShowOptions {
    return Intl.message(
      'Press on aya and hold to show options',
      name: 'pressToShowOptions',
      desc: '',
      args: [],
    );
  }

  /// `Sunan Notifications`
  String get sunan_notifications {
    return Intl.message(
      'Sunan Notifications',
      name: 'sunan_notifications',
      desc: '',
      args: [],
    );
  }

  /// `Did you pray`
  String get did_you_pray {
    return Intl.message(
      'Did you pray',
      name: 'did_you_pray',
      desc: '',
      args: [],
    );
  }

  /// `check your houses in paradise`
  String get sunan_message {
    return Intl.message(
      'check your houses in paradise',
      name: 'sunan_message',
      desc: '',
      args: [],
    );
  }

  /// `Dhuhr Sunan`
  String get dhuhrSunan {
    return Intl.message('Dhuhr Sunan', name: 'dhuhrSunan', desc: '', args: []);
  }

  /// `Hajj and Umrah Count`
  String get hajj_umrah_count {
    return Intl.message(
      'Hajj and Umrah Count',
      name: 'hajj_umrah_count',
      desc: '',
      args: [],
    );
  }

  /// `Whoever prays Fajr in congregation, then sits remembering Allah until the sun rises, then prays two rak‘ahs, will have a reward like that of a complete Hajj and a complete Umrah — complete, complete, complete. Narrated by Anas ibn Malik.`
  String get hajj_umrah_hadith {
    return Intl.message(
      'Whoever prays Fajr in congregation, then sits remembering Allah until the sun rises, then prays two rak‘ahs, will have a reward like that of a complete Hajj and a complete Umrah — complete, complete, complete. Narrated by Anas ibn Malik.',
      name: 'hajj_umrah_hadith',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations! You have received the reward of the Hajj and Umrah`
  String get complete_hajj_umrah_message {
    return Intl.message(
      'Congratulations! You have received the reward of the Hajj and Umrah',
      name: 'complete_hajj_umrah_message',
      desc: '',
      args: [],
    );
  }

  /// `Completed Hajj and Umrah reward`
  String get completed_hajj_umrah {
    return Intl.message(
      'Completed Hajj and Umrah reward',
      name: 'completed_hajj_umrah',
      desc: '',
      args: [],
    );
  }

  /// `Bookmark`
  String get bookmark {
    return Intl.message('Bookmark', name: 'bookmark', desc: '', args: []);
  }

  /// `Add bookmark`
  String get bookmarkSublabel {
    return Intl.message(
      'Add bookmark',
      name: 'bookmarkSublabel',
      desc: '',
      args: [],
    );
  }

  /// `Calculation Settings`
  String get calculation_settings {
    return Intl.message(
      'Calculation Settings',
      name: 'calculation_settings',
      desc: '',
      args: [],
    );
  }

  /// `Calculation Method`
  String get calculation_method {
    return Intl.message(
      'Calculation Method',
      name: 'calculation_method',
      desc: '',
      args: [],
    );
  }

  /// `Madhab`
  String get madhab {
    return Intl.message('Madhab', name: 'madhab', desc: '', args: []);
  }

  /// `Egyptian`
  String get method_egyptian {
    return Intl.message(
      'Egyptian',
      name: 'method_egyptian',
      desc: '',
      args: [],
    );
  }

  /// `Umm Al Qura`
  String get method_umm_al_qura {
    return Intl.message(
      'Umm Al Qura',
      name: 'method_umm_al_qura',
      desc: '',
      args: [],
    );
  }

  /// `Karachi (University of Karachi)`
  String get method_karachi {
    return Intl.message(
      'Karachi (University of Karachi)',
      name: 'method_karachi',
      desc: '',
      args: [],
    );
  }

  /// `North America (ISNA)`
  String get method_north_america {
    return Intl.message(
      'North America (ISNA)',
      name: 'method_north_america',
      desc: '',
      args: [],
    );
  }

  /// `Muslim World League`
  String get method_muslim_world_league {
    return Intl.message(
      'Muslim World League',
      name: 'method_muslim_world_league',
      desc: '',
      args: [],
    );
  }

  /// `Dubai`
  String get method_dubai {
    return Intl.message('Dubai', name: 'method_dubai', desc: '', args: []);
  }

  /// `Qatar`
  String get method_qatar {
    return Intl.message('Qatar', name: 'method_qatar', desc: '', args: []);
  }

  /// `Kuwait`
  String get method_kuwait {
    return Intl.message('Kuwait', name: 'method_kuwait', desc: '', args: []);
  }

  /// `Singapore`
  String get method_singapore {
    return Intl.message(
      'Singapore',
      name: 'method_singapore',
      desc: '',
      args: [],
    );
  }

  /// `Shafi`
  String get madhab_shafi {
    return Intl.message('Shafi', name: 'madhab_shafi', desc: '', args: []);
  }

  /// `Hanafi`
  String get madhab_hanafi {
    return Intl.message('Hanafi', name: 'madhab_hanafi', desc: '', args: []);
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
