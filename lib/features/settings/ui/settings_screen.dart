import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/helpers/ui_helper.dart';
import 'package:noor/core/widgets/my_app_bar.dart';
import 'package:noor/features/settings/data/models/azan_notifications_settings.dart';
import 'package:noor/features/settings/data/models/azkar_notifications_settings.dart';
import 'package:noor/features/settings/data/models/calculation_settings.dart';
import 'package:noor/features/settings/data/models/iqama_notifications_settings.dart';
import 'package:noor/features/settings/data/models/perodic_azkar_settings.dart';
import 'package:noor/features/settings/data/models/sunan_settings.dart';
import 'package:noor/features/settings/logic/settings_cubit.dart';
import 'package:noor/features/settings/ui/widgets/azan_sounds_widget.dart';
import 'package:noor/features/settings/ui/widgets/azkar_settings_widget.dart';
import 'package:noor/features/settings/ui/widgets/calculation_settings_widget.dart';
import 'package:noor/features/settings/ui/widgets/iqama_setting_widget.dart';
import 'package:noor/features/settings/ui/widgets/language_settings_widget.dart';
import 'package:noor/features/settings/ui/widgets/location_settings_widget.dart';
import 'package:noor/features/settings/ui/widgets/perodic_azkar_settings_widget.dart';
import 'package:noor/features/settings/ui/widgets/salawat_row.dart';
import 'package:noor/features/settings/ui/widgets/sunan_row.dart';
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
  late final PerodicAzkarSettings _perodicAzkarSetting;
  late final IqamaNotificationsSettings _iqamaNotificationsSettings;
  late final SunanSettings _sunanSetting;
  late final CalculationSettings _calculationSettings;

  @override
  void initState() {
    super.initState();
    _azkarNotificationsSettings = _settingsCubit.getAzkarNotificationSetting();
    _azanNotificationsSettings = _settingsCubit.getAzanNotificationSetting();
    _perodicAzkarSetting = _settingsCubit.getPerodicAzkarSetting();
    _locationUpdateSetting = _settingsCubit.getLocationUpdateSetting();
    _iqamaNotificationsSettings = _settingsCubit.getIqamaNotificationSetting();
    _sunanSetting = _settingsCubit.getSunanSetting();
    _calculationSettings = _settingsCubit.getCalculationSettings();
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
              UiHelper.showToast(
                text: S.of(context).settingsSaved,
                state: ToastStates.success,
              );
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
                    CalculationSettingsWidget(
                      calculationSettings: _calculationSettings,
                    ),
                    const SizedBox(height: 20),
                    SalawatRow(
                      azanNotificationsSettings: _azanNotificationsSettings,
                    ),
                    const SizedBox(height: 20),
                    SunanRow(sunanSettings: _sunanSetting),
                    const SizedBox(height: 20),
                    IqamaSettingWidget(
                      iqamaNotificationsSettings: _iqamaNotificationsSettings,
                    ),
                    const SizedBox(height: 20),
                    AzanSoundsWidget(
                      onSoundChanged: (String sound) {
                        _settingsCubit.saveAzkarSound(sound);
                      },
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
                    PerodicAzkarSettingsWidget(
                      perodicAzkarSettings: _perodicAzkarSetting,
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
