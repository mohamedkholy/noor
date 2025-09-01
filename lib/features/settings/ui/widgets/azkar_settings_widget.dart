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
  late final TextEditingController _morningAzkarTimeController =
      TextEditingController(
        text: widget.azkarNotificationsSettings.morningAzkarTime.toString(),
      );
  late final TextEditingController _eveningAzkarTimeController =
      TextEditingController(
        text: widget.azkarNotificationsSettings.eveningAzkarTime.toString(),
      );
  late bool _morningAzkarState =
      widget.azkarNotificationsSettings.morningAzkarState;
  late bool _eveningAzkarState =
      widget.azkarNotificationsSettings.eveningAzkarState;

  late final SettingsCubit _settingsCubit = context.read();

  @override
  void dispose() {
    _morningAzkarTimeController.dispose();
    _eveningAzkarTimeController.dispose();
    super.dispose();
  }

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
                azkarType: AzkarType.morning,
                azkarState: _morningAzkarState,
                azkarTimeController: _morningAzkarTimeController,
                onAzkarStateChange: (value) {
                  _morningAzkarState = value;
                  _saveAzkarNotificationSetting();
                },
                onAzkarTimeChange: (value) {
                  _saveAzkarNotificationSetting();
                },
              ),
              const SizedBox(height: 30),
              AzkarNotificationWidget(
                azkarType: AzkarType.evening,
                azkarState: _eveningAzkarState,
                azkarTimeController: _eveningAzkarTimeController,
                onAzkarTimeChange: (value) {
                  _saveAzkarNotificationSetting();
                },
                onAzkarStateChange: (value) {
                  setState(() {
                    _eveningAzkarState = value;
                    _saveAzkarNotificationSetting();
                  });
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
        morningAzkarTime: int.tryParse(_morningAzkarTimeController.text) ?? 45,
        eveningAzkarTime: int.tryParse(_eveningAzkarTimeController.text) ?? 45,
      ),
    );
  }
}
