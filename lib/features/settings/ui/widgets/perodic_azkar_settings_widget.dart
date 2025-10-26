import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/theming/my_colors.dart';
import 'package:noor/core/widgets/decorated_container.dart';
import 'package:noor/features/settings/data/models/perodic_azkar_settings.dart';
import 'package:noor/features/settings/logic/settings_cubit.dart';
import 'package:noor/generated/l10n.dart';

class PerodicAzkarSettingsWidget extends StatefulWidget {
  final PerodicAzkarSettings perodicAzkarSettings;
  const PerodicAzkarSettingsWidget({
    super.key,
    required this.perodicAzkarSettings,
  });

  @override
  State<PerodicAzkarSettingsWidget> createState() =>
      _PerodicAzkarSettingsWidgetState();
}

class _PerodicAzkarSettingsWidgetState
    extends State<PerodicAzkarSettingsWidget> {
  late final SettingsCubit _settingsCubit = context.read();
  late bool _state = widget.perodicAzkarSettings.isActive;
  late int _time = widget.perodicAzkarSettings.perodicAzkarTime;
  final List<(String, String)> perodicNotifications = [
    ("صلي علي نبينا محمد", "prophet_salah"),
    ("سبحان الله و بحمده", "sobhan_allah"),
    ("استغفر الله و أتوب إليه", "astaghfirullah"),
  ];
  late (String, String) _selectedNotification = (
    widget.perodicAzkarSettings.text,
    widget.perodicAzkarSettings.sound,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).perodicAzkarSettings,
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
                      S.of(context).activatePerodicAzkar,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Switch(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    activeThumbColor: MyColors.secondary,
                    value: _state,
                    onChanged: (value) {
                      setState(() {
                        _state = value;
                      });
                      _settingsCubit.savePerodicAzkarSetting(
                        PerodicAzkarSettings(
                          isActive: value,
                          perodicAzkarTime: _time,
                          sound: _selectedNotification.$2,
                          text: _selectedNotification.$1,
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              RadioGroup(
                groupValue: _time,
                onChanged: (value) {
                  setState(() {
                    _time = value ?? 1;
                  });
                  _settingsCubit.savePerodicAzkarSetting(
                    PerodicAzkarSettings(
                      isActive: _state,
                      perodicAzkarTime: value ?? 1,
                      sound: _selectedNotification.$2,
                      text: _selectedNotification.$1,
                    ),
                  );
                },
                child: Row(
                  children: [
                    Text(
                      S.of(context).hourly,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Transform.scale(
                        scale: 1.3,
                        child: const Radio(
                          value: 60,
                          activeColor: MyColors.secondary,
                        ),
                      ),
                    ),
                    Text(
                      S.of(context).everyMinute,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Transform.scale(
                        scale: 1.3,
                        child: const Radio(
                          value: 1,
                          activeColor: MyColors.secondary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white),
                ),
                child: DropdownButton(
                  isExpanded: true,
                  dropdownColor: Colors.black87,
                  iconEnabledColor: Colors.white,
                  underline: const SizedBox(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                  value: _selectedNotification,
                  items: perodicNotifications.map((e) {
                    return DropdownMenuItem(value: e, child: Text(e.$1));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedNotification = value!;
                    });
                    _settingsCubit.savePerodicAzkarSetting(
                      PerodicAzkarSettings(
                        isActive: _state,
                        perodicAzkarTime: _time,
                        sound: _selectedNotification.$2,
                        text: _selectedNotification.$1,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
