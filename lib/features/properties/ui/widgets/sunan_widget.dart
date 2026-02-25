import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/helpers/font_weight_helper.dart';
import 'package:noor/core/theming/my_colors.dart';
import 'package:noor/core/widgets/decorated_container.dart';
import 'package:noor/features/properties/data/models/sunan_data.dart';
import 'package:noor/features/properties/logic/properties_cubit.dart';
import 'package:noor/features/properties/ui/widgets/complete_sunan_dialog.dart';
import 'package:noor/generated/l10n.dart';

class SunanWidget extends StatefulWidget {
  const SunanWidget({super.key, this.onSunanCompleted});

  final VoidCallback? onSunanCompleted;

  @override
  State<SunanWidget> createState() => _SunanWidgetState();
}

class _SunanWidgetState extends State<SunanWidget> {
  late List<(String, IconData, bool)> prayers;
  late final PropertiesCubit _propertiesCubit = context.read();
  late SunanData sunanSetting = _propertiesCubit.getSunanSetting();

  @override
  void didChangeDependencies() {
    prayers = [
      (S.of(context).fajr_sunnah, Icons.nights_stay, sunanSetting.fajrSunnah),
      (
        S.of(context).before_dhuhr_sunnah,
        Icons.sunny,
        sunanSetting.beforeDhuhrSunnah,
      ),
      (
        S.of(context).after_dhuhr_sunnah,
        Icons.brightness_medium,
        sunanSetting.afterDhuhrSunnah,
      ),
      (
        S.of(context).maghrib_sunnah,
        Icons.nightlight_round,
        sunanSetting.maghribSunnah,
      ),
      (S.of(context).isha_sunnah, Icons.nightlight, sunanSetting.ishaSunnah),
    ];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedContainer(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            S.of(context).sunnah_prayers,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          ...List.generate(prayers.length, (i) {
            return Row(
              children: [
                Text(
                  prayers[i].$1,
                  style: TextStyle(
                    color: prayers[i].$3 ? Colors.white : Colors.grey.shade400,
                    fontWeight: FontWeightHelper.medium,
                  ),
                ),
                const SizedBox(width: 10),
                Icon(
                  prayers[i].$2,
                  color: prayers[i].$3 ? Colors.white : Colors.grey.shade400,
                ),
                const SizedBox(width: 15),
                const Spacer(),
                Transform.scale(
                  scale: 1.3,
                  child: Checkbox(
                    checkColor: MyColors.primary,
                    activeColor: MyColors.secondary,
                    value: prayers[i].$3,
                    onChanged: (value) {
                      if (prayers.every((element) => element.$3) &&
                          value == false) {
                        _propertiesCubit.changePropertiesCount(-1);
                      }
                      setState(() {
                        prayers[i] = (prayers[i].$1, prayers[i].$2, value!);
                      });
                      _propertiesCubit.saveSunanSetting(
                        SunanData(
                          fajrSunnah: prayers[0].$3,
                          beforeDhuhrSunnah: prayers[1].$3,
                          afterDhuhrSunnah: prayers[2].$3,
                          maghribSunnah: prayers[3].$3,
                          ishaSunnah: prayers[4].$3,
                          date: DateTime.now(),
                        ),
                      );
                      if (prayers.every((element) => element.$3)) {
                        widget.onSunanCompleted?.call();
                        _propertiesCubit.changePropertiesCount(1);
                        showDialog(
                          barrierColor: Colors.black87,
                          context: context,
                          builder: (context) {
                            return const CompleteSunanDialog();
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
