import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/widgets/my_app_bar.dart';
import 'package:noor/features/settings/data/models/azan_notifications_settings.dart';
import 'package:noor/features/settings/data/models/azkar_notifications_settings.dart';
import 'package:noor/features/settings/logic/settings_cubit.dart';
import 'package:noor/features/settings/ui/widgets/azkar_settings_widget.dart';
import 'package:noor/features/settings/ui/widgets/language_settings_widget.dart';
import 'package:noor/features/settings/ui/widgets/location_settings_widget.dart';
import 'package:noor/features/settings/ui/widgets/salawat_row.dart';
import 'package:noor/generated/l10n.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late final SettingsCubit _settingsCubit = context.read();
  late final AzkarNotificationsSettings _azkarNotificationsSettings;
  late final AzanNotificationsSettings _azanNotificationsSettings;
  late final bool _locationUpdateSetting;

  @override
  void initState() {
    super.initState();
    _azkarNotificationsSettings = _settingsCubit.getAzkarNotificationSetting();
    _azanNotificationsSettings = _settingsCubit.getAzanNotificationSetting();
    _locationUpdateSetting = _settingsCubit.getLocationUpdateSetting();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: S.of(context).settings,
        actions: [
          IconButton(
            icon: const Icon(Icons.save, color: Colors.white, size: 30),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    SalawatRow(
                      azanNotificationsSettings: _azanNotificationsSettings,
                    ),
                    const SizedBox(height: 20),
                    AzkarSettingsWidget(
                      azkarNotificationsSettings: _azkarNotificationsSettings,
                    ),
                    const SizedBox(height: 20),
                    LocationSettingsWidget(
                      locationUpdateSetting: _locationUpdateSetting,
                    ),
                    const SizedBox(height: 20),
                    const LanguageSettingsWidget(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
