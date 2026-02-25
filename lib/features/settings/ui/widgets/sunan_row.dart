import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/helpers/font_weight_helper.dart';
import 'package:noor/core/theming/my_colors.dart';
import 'package:noor/core/widgets/decorated_container.dart';
import 'package:noor/features/settings/data/models/sunan_settings.dart';
import 'package:noor/features/settings/logic/settings_cubit.dart';
import 'package:noor/generated/l10n.dart';

class SunanRow extends StatefulWidget {
  const SunanRow({super.key, required this.sunanSettings});

  final SunanSettings sunanSettings;

  @override
  State<SunanRow> createState() => _SunanRowState();
}

class _SunanRowState extends State<SunanRow> {
  late final SettingsCubit _settingsCubit = context.read();
  late List<(String, IconData, bool)> sunan;

  @override
  void didChangeDependencies() {
    sunan = [
      (
        S.of(context).fajr_sunnah,
        Icons.nights_stay,
        widget.sunanSettings.fajrSunnah,
      ),
      (S.of(context).dhuhrSunan, Icons.sunny, widget.sunanSettings.dhuhrSunan),
      (
        S.of(context).maghrib_sunnah,
        Icons.nightlight_round,
        widget.sunanSettings.maghribSunnah,
      ),
      (
        S.of(context).isha_sunnah,
        Icons.nightlight,
        widget.sunanSettings.ishaSunnah,
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
          S.of(context).sunan_notifications,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        DecoratedContainer(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ...List.generate(sunan.length, (i) {
                return Expanded(
                  child: Column(
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        sunan[i].$1,
                        style: TextStyle(
                          color: sunan[i].$3
                              ? Colors.white
                              : Colors.grey.shade400,
                          fontWeight: FontWeightHelper.medium,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Icon(
                        sunan[i].$2,
                        color: sunan[i].$3
                            ? Colors.white
                            : Colors.grey.shade400,
                      ),
                      const SizedBox(height: 15),
                      Transform.scale(
                        scale: 1.3,
                        child: Checkbox(
                          checkColor: MyColors.primary,
                          activeColor: MyColors.secondary,
                          value: sunan[i].$3,
                          onChanged: (value) {
                            setState(() {
                              sunan[i] = (sunan[i].$1, sunan[i].$2, value!);
                            });
                            _settingsCubit.saveSunanSetting(
                              SunanSettings(
                                isEnabled: true,
                                fajrSunnah: sunan[0].$3,
                                dhuhrSunan: sunan[1].$3,
                                maghribSunnah: sunan[3].$3,
                                ishaSunnah: sunan[4].$3,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}
