import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/widgets/decorated_container.dart';
import 'package:noor/features/settings/data/models/azkar_notifications_settings.dart';
import 'package:noor/features/settings/data/models/azkar_type.dart';
import 'package:noor/features/settings/logic/settings_cubit.dart';
import 'package:noor/features/settings/ui/widgets/azkar_notification_widget.dart';
import 'package:noor/generated/l10n.dart';

class AzkarSettingsWidget extends StatefulWidget {
  final AzkarNotificationsSettings azkarNotificationsSettings;

  const AzkarSettingsWidget({
    super.key,
    required this.azkarNotificationsSettings,
  });

  @override
  State<AzkarSettingsWidget> createState() => _AzkarSettingsWidgetState();
}

class _AzkarSettingsWidgetState extends State<AzkarSettingsWidget> {
  late bool _morningAzkarState =
      widget.azkarNotificationsSettings.morningAzkarState;
  late bool _eveningAzkarState =
      widget.azkarNotificationsSettings.eveningAzkarState;
  late int _morningAzkarTime =
      widget.azkarNotificationsSettings.morningAzkarTime;
  late int _eveningAzkarTime =
      widget.azkarNotificationsSettings.eveningAzkarTime;
  late bool _sleepingAzkarState =
      widget.azkarNotificationsSettings.sleepingAzkarState;
  late int _sleepingAzkarTime =
      widget.azkarNotificationsSettings.sleepingAzkarTime;

  late final SettingsCubit _settingsCubit = context.read();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).azkar_notifications,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        DecoratedContainer(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AzkarNotificationWidget(
                azkarTime: _morningAzkarTime,
                azkarType: AzkarType.morning,
                azkarState: _morningAzkarState,
                onAzkarStateChange: (value) {
                  _morningAzkarState = value;
                  _saveAzkarNotificationSetting();
                },
                onAzkarTimeChange: (value) {
                  _morningAzkarTime = value;
                  _saveAzkarNotificationSetting();
                },
              ),
              const SizedBox(height: 30),
              AzkarNotificationWidget(
                azkarTime: _eveningAzkarTime,
                azkarType: AzkarType.evening,
                azkarState: _eveningAzkarState,
                onAzkarTimeChange: (value) {
                  _eveningAzkarTime = value;
                  _saveAzkarNotificationSetting();
                },
                onAzkarStateChange: (value) {
                  _eveningAzkarState = value;
                  _saveAzkarNotificationSetting();
                },
              ),
              const SizedBox(height: 30),
              AzkarNotificationWidget(
                azkarTime: _sleepingAzkarTime,
                azkarType: AzkarType.sleeping,
                azkarState: _sleepingAzkarState,
                onAzkarTimeChange: (value) {
                  _sleepingAzkarTime = value;
                  _saveAzkarNotificationSetting();
                },
                onAzkarStateChange: (value) {
                  _sleepingAzkarState = value;
                  _saveAzkarNotificationSetting();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _saveAzkarNotificationSetting() {
    _settingsCubit.saveAzkarNotificationSetting(
      AzkarNotificationsSettings(
        morningAzkarState: _morningAzkarState,
        eveningAzkarState: _eveningAzkarState,
        morningAzkarTime: _morningAzkarTime,
        eveningAzkarTime: _eveningAzkarTime,
        sleepingAzkarState: _sleepingAzkarState,
        sleepingAzkarTime: _sleepingAzkarTime,
      ),
    );
  }
}
