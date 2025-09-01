import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/theming/my_colors.dart';
import 'package:noor/core/widgets/decorated_container.dart';
import 'package:noor/features/settings/logic/settings_cubit.dart';
import 'package:noor/generated/l10n.dart';

class LocationSettingsWidget extends StatefulWidget {
  const LocationSettingsWidget({
    super.key,
    required this.locationUpdateSetting,
  });

  final bool locationUpdateSetting;

  @override
  State<LocationSettingsWidget> createState() => _LocationSettingsWidgetState();
}

class _LocationSettingsWidgetState extends State<LocationSettingsWidget> {
  late final SettingsCubit _settingsCubit = context.read();
  late bool locationState = widget.locationUpdateSetting;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).location_settings,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        DecoratedContainer(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  S.of(context).automatic_location_update,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Switch(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                activeColor: MyColors.secondary,
                value: locationState,
                onChanged: (value) {
                  setState(() {
                    locationState = value;
                  });
                  _settingsCubit.saveLocationUpdateSetting(value);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
