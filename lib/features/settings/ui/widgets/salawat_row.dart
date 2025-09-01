import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/helpers/font_weight_helper.dart';
import 'package:noor/core/theming/my_colors.dart';
import 'package:noor/core/widgets/decorated_container.dart';
import 'package:noor/features/settings/data/models/azan_notifications_settings.dart';
import 'package:noor/features/settings/logic/settings_cubit.dart';
import 'package:noor/generated/l10n.dart';

class SalawatRow extends StatefulWidget {
  const SalawatRow({super.key, required this.azanNotificationsSettings});

  final AzanNotificationsSettings azanNotificationsSettings;

  @override
  State<SalawatRow> createState() => _SalawatRowState();
}

class _SalawatRowState extends State<SalawatRow> {
  late final SettingsCubit _settingsCubit = context.read();
  late List<(String, IconData, bool)> prayers;

  @override
  void didChangeDependencies() {
    prayers = [
      (
        S.of(context).fajr,
        Icons.nights_stay,
        widget.azanNotificationsSettings.fajrState,
      ),
      (
        S.of(context).dhuhr,
        Icons.sunny,
        widget.azanNotificationsSettings.dhuhrState,
      ),
      (
        S.of(context).asr,
        Icons.brightness_medium,
        widget.azanNotificationsSettings.asrState,
      ),
      (
        S.of(context).maghrib,
        Icons.nightlight_round,
        widget.azanNotificationsSettings.maghribState,
      ),
      (
        S.of(context).isha,
        Icons.nightlight,
        widget.azanNotificationsSettings.ishaState,
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
          S.of(context).azan_notifications,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        DecoratedContainer(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ...List.generate(prayers.length, (i) {
                return Column(
                  children: [
                    Text(
                      prayers[i].$1,
                      style: TextStyle(
                        color: prayers[i].$3
                            ? Colors.white
                            : Colors.grey.shade400,
                        fontWeight: FontWeightHelper.medium,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Icon(
                      prayers[i].$2,
                      color: prayers[i].$3
                          ? Colors.white
                          : Colors.grey.shade400,
                    ),
                    const SizedBox(height: 15),
                    Transform.scale(
                      scale: 1.3,
                      child: Checkbox(
                        checkColor: MyColors.primary,
                        activeColor: MyColors.secondary,
                        value: prayers[i].$3,
                        onChanged: (value) {
                          setState(() {
                            prayers[i] = (prayers[i].$1, prayers[i].$2, value!);
                          });
                          _settingsCubit.saveAzanNotificationSetting(
                            AzanNotificationsSettings(
                              fajrState: prayers[0].$3,
                              dhuhrState: prayers[1].$3,
                              asrState: prayers[2].$3,
                              maghribState: prayers[3].$3,
                              ishaState: prayers[4].$3,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}
