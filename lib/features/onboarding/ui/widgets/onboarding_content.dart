import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:noor/core/theming/my_colors.dart';
import 'package:noor/core/widgets/decorated_container.dart';
import 'package:noor/features/onboarding/data/models/onboarding_config.dart';
import 'package:noor/features/settings/data/models/perodic_azkar_settings.dart';
import 'package:noor/features/settings/ui/widgets/perodic_azkar_settings_widget.dart';
import 'package:noor/generated/l10n.dart';

class OnboardingContent extends StatelessWidget {
  final OnboardingScreen screen;

  const OnboardingContent({super.key, required this.screen});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Title
        Text(
          screen.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          screen.description,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: _buildInteractivePreview(screen, context),
        ),
        const SizedBox(height: 32),
        DecoratedContainer(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: screen.bulletPoints.map((point) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 4, right: 12),
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: MyColors.secondary,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        point,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildInteractivePreview(
    OnboardingScreen screen,
    BuildContext context,
  ) {
    switch (screen.type) {
      case OnboardingScreenType.welcome:
        return Container(
          key: UniqueKey(),
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withOpacity(0.3), width: 2),
          ),
          child: const Icon(Icons.settings, size: 80, color: Colors.white),
        );

      case OnboardingScreenType.prayerNotifications:
        return DecoratedContainer(
          key: UniqueKey(),
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildPrayerIcon(Icons.nights_stay, S.of(context).fajr, true),
              _buildPrayerIcon(Icons.sunny, S.of(context).dhuhr, true),
              _buildPrayerIcon(
                Icons.brightness_medium,
                S.of(context).asr,
                true,
              ),
              _buildPrayerIcon(
                Icons.nightlight_round,
                S.of(context).maghrib,
                true,
              ),
              _buildPrayerIcon(Icons.nightlight, S.of(context).isha, true),
            ],
          ),
        );

      case OnboardingScreenType.azanSounds:
        return DecoratedContainer(
          key: UniqueKey(),
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                S.of(context).azan_notifications,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.white),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        Intl.getCurrentLocale() == 'ar'
                            ? 'مكة - المسجد الحرام'
                            : 'Makkah - Masjid al-Haram',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const Icon(Icons.arrow_drop_down, color: Colors.white),
                  ],
                ),
              ),
            ],
          ),
        );

      case OnboardingScreenType.azkarReminders:
        return DecoratedContainer(
          key: UniqueKey(),
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildAzkarItem(S.of(context).morning_azkar, '6:00 AM', true),
              const SizedBox(height: 10),
              _buildAzkarItem(S.of(context).evening_azkar, '6:00 PM', true),
              const SizedBox(height: 10),
              _buildAzkarItem(S.of(context).sleepingAzkar, '10:00 PM', true),
            ],
          ),
        );

      case OnboardingScreenType.periodicDhikr:
        return AbsorbPointer(
          key: UniqueKey(),
          child: PerodicAzkarSettingsWidget(
            perodicAzkarSettings: PerodicAzkarSettings(
              isActive: true,
              perodicAzkarTime: 60,
              sound: "prophet_salah",
              text: "صلي علي نبينا محمد",
            ),
          ),
        );

      case OnboardingScreenType.languageSetup:
        return DecoratedContainer(
          key: UniqueKey(),
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Text(
                S.of(context).language,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              const Row(
                children: [
                  Text(
                    'English',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  Icon(Icons.arrow_drop_down, color: Colors.white),
                ],
              ),
            ],
          ),
        );
    }
  }

  Widget _buildPrayerIcon(IconData icon, String label, bool isActive) {
    return Column(
      children: [
        Icon(
          icon,
          color: isActive ? Colors.white : Colors.grey.shade400,
          size: 24,
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.grey.shade400,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 8),
        Transform.scale(
          scale: 0.8,
          child: Checkbox(
            value: isActive,
            onChanged: (value) {},
            activeColor: MyColors.secondary,
            checkColor: MyColors.primary,
          ),
        ),
      ],
    );
  }

  Widget _buildAzkarItem(String title, String time, bool isEnabled) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                time,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        Switch(
          value: isEnabled,
          onChanged: (value) {},
          activeThumbColor: MyColors.secondary,
        ),
      ],
    );
  }
}
