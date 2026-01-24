import 'package:noor/generated/l10n.dart';

enum OnboardingScreenType {
  welcome,
  prayerNotifications,
  azanSounds,
  azkarReminders,
  periodicDhikr,
  languageSetup,
}

class OnboardingScreen {
  final OnboardingScreenType type;
  final String title;
  final String description;
  final String imagePath;
  final List<String> bulletPoints;

  OnboardingScreen({
    required this.type,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.bulletPoints,
  });
}

class OnboardingConfig {
  static List<OnboardingScreen> get screens => [
    OnboardingScreen(
      type: OnboardingScreenType.welcome,
      title: S.current.onboarding_welcome_title,
      description: S.current.onboarding_welcome_description,
      imagePath: 'assets/images/onboarding_welcome.png',
      bulletPoints: [
        S.current.onboarding_welcome_point1,
        S.current.onboarding_welcome_point2,
        S.current.onboarding_welcome_point3,
      ],
    ),
    OnboardingScreen(
      type: OnboardingScreenType.prayerNotifications,
      title: S.current.onboarding_prayer_notifications_title,
      description: S.current.onboarding_prayer_notifications_description,
      imagePath: 'assets/images/onboarding_prayers.png',
      bulletPoints: [
        S.current.onboarding_prayer_fajr_desc,
        S.current.onboarding_prayer_dhuhr_desc,
        S.current.onboarding_prayer_asr_desc,
        S.current.onboarding_prayer_maghrib_desc,
        S.current.onboarding_prayer_isha_desc,
      ],
    ),
    OnboardingScreen(
      type: OnboardingScreenType.azanSounds,
      title: S.current.onboarding_azan_sounds_title,
      description: S.current.onboarding_azan_sounds_description,
      imagePath: 'assets/images/onboarding_azan.png',
      bulletPoints: [
        S.current.onboarding_azan_sound_desc2,
        S.current.onboarding_azan_sound_desc3,
        S.current.onboarding_azan_sound_desc4,
      ],
    ),
    OnboardingScreen(
      type: OnboardingScreenType.azkarReminders,
      title: S.current.onboarding_daily_azkar_title,
      description: S.current.onboarding_daily_azkar_description,
      imagePath: 'assets/images/onboarding_azkar.png',
      bulletPoints: [
        S.current.onboarding_morning_azkar_desc,
        S.current.onboarding_evening_azkar_desc,
        S.current.onboarding_sleeping_azkar_desc,
        S.current.onboarding_customizable_timing_desc,
      ],
    ),
    OnboardingScreen(
      type: OnboardingScreenType.periodicDhikr,
      title: S.current.onboarding_periodic_reminders_title,
      description: S.current.onboarding_periodic_reminders_description,
      imagePath: 'assets/images/onboarding_periodic.png',
      bulletPoints: [
        S.current.onboarding_hourly_reminders_desc,
        S.current.onboarding_every_minute_dhikr_desc,
        S.current.onboarding_different_remembrance_types_desc,
        S.current.onboarding_automatic_location_desc,
      ],
    ),
    OnboardingScreen(
      type: OnboardingScreenType.languageSetup,
      title: S.current.onboarding_language_setup_title,
      description: S.current.onboarding_language_setup_description,
      imagePath: 'assets/images/onboarding_language.png',
      bulletPoints: [
        S.current.onboarding_switch_languages_desc,
        S.current.onboarding_customizable_settings_desc,
        S.current.onboarding_access_settings_desc,
        S.current.onboarding_preferences_saved_desc,
      ],
    ),
  ];
}
