import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/helpers/font_weight_helper.dart';
import 'package:noor/core/theming/my_colors.dart';
import 'package:noor/core/widgets/decorated_container.dart';
import 'package:noor/features/settings/data/models/iqama_notifications_settings.dart';
import 'package:noor/features/settings/logic/settings_cubit.dart';
import 'package:noor/generated/l10n.dart';
import 'package:numberpicker/numberpicker.dart';

class IqamaSettingWidget extends StatefulWidget {
  const IqamaSettingWidget({
    super.key,
    required this.iqamaNotificationsSettings,
  });

  final IqamaNotificationsSettings iqamaNotificationsSettings;

  @override
  State<IqamaSettingWidget> createState() => _IqamaSettingWidgetState();
}

class _IqamaSettingWidgetState extends State<IqamaSettingWidget> {
  late final SettingsCubit _settingsCubit = context.read();
  late List<(String, IconData, int)> prayers;
  late bool isEnabled;

  @override
  void initState() {
    super.initState();
    isEnabled = widget.iqamaNotificationsSettings.isEnabled;
  }

  @override
  void didChangeDependencies() {
    prayers = [
      (
        S.of(context).fajr,
        Icons.nights_stay,
        widget.iqamaNotificationsSettings.fajrTime,
      ),
      (
        S.of(context).dhuhr,
        Icons.sunny,
        widget.iqamaNotificationsSettings.dhuhrTime,
      ),
      (
        S.of(context).asr,
        Icons.brightness_medium,
        widget.iqamaNotificationsSettings.asrTime,
      ),
      (
        S.of(context).maghrib,
        Icons.nightlight_round,
        widget.iqamaNotificationsSettings.maghribTime,
      ),
      (
        S.of(context).isha,
        Icons.nightlight,
        widget.iqamaNotificationsSettings.ishaTime,
      ),
    ];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).iqama_notifications,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        DecoratedContainer(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      S.of(context).iqama_notifications,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Switch(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    activeThumbColor: MyColors.secondary,
                    value: isEnabled,
                    onChanged: (value) {
                      setState(() {
                        isEnabled = value;
                      });
                      _settingsCubit.saveIqamaNotificationSetting(
                        IqamaNotificationsSettings(
                          isEnabled: isEnabled,
                          fajrTime: prayers[0].$3,
                          dhuhrTime: prayers[1].$3,
                          asrTime: prayers[2].$3,
                          maghribTime: prayers[3].$3,
                          ishaTime: prayers[4].$3,
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ...List.generate(prayers.length, (i) {
                    return Expanded(
                      child: Column(
                        children: [
                          Text(
                            prayers[i].$1,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeightHelper.medium,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Icon(prayers[i].$2, color: Colors.white),
                          const SizedBox(height: 15),
                          NumberPicker(
                            selectedTextStyle: const TextStyle(
                              color: MyColors.secondary,
                              fontWeight: FontWeightHelper.bold,
                              fontSize: 25,
                            ),
                            infiniteLoop: true,
                            textMapper: (value) {
                              return "$value ${Localizations.localeOf(context).languageCode == 'ar' ? 'د' : 'm'}";
                            },
                            minValue: 3,
                            maxValue: 30,
                            value: prayers[i].$3,
                            onChanged: (value) {
                              setState(() {
                                prayers[i] = (
                                  prayers[i].$1,
                                  prayers[i].$2,
                                  value,
                                );
                              });
                              _settingsCubit.saveIqamaNotificationSetting(
                                IqamaNotificationsSettings(
                                  isEnabled: isEnabled,
                                  fajrTime: prayers[0].$3,
                                  dhuhrTime: prayers[1].$3,
                                  asrTime: prayers[2].$3,
                                  maghribTime: prayers[3].$3,
                                  ishaTime: prayers[4].$3,
                                ),
                              );
                            },
                            decoration: const BoxDecoration(
                              border: Border(
                                top: BorderSide(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.warning_amber_rounded, color: Colors.white),
                  const SizedBox(width: 5),
                  Text(
                    S.of(context).chooseTimeAfterAzan,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeightHelper.medium,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
