import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/helpers/font_weight_helper.dart';
import 'package:noor/core/widgets/decorated_container.dart';
import 'package:noor/features/settings/data/models/calculation_settings.dart';
import 'package:noor/features/settings/logic/settings_cubit.dart';
import 'package:noor/generated/l10n.dart';

class CalculationSettingsWidget extends StatefulWidget {
  const CalculationSettingsWidget({
    super.key,
    required this.calculationSettings,
  });

  final CalculationSettings calculationSettings;

  @override
  State<CalculationSettingsWidget> createState() =>
      _CalculationSettingsWidgetState();
}

class _CalculationSettingsWidgetState extends State<CalculationSettingsWidget> {
  late final SettingsCubit _settingsCubit = context.read();
  late String selectedMethod;
  late String selectedMadhab;

  @override
  void initState() {
    super.initState();
    selectedMethod = widget.calculationSettings.calculationMethod;
    selectedMadhab = widget.calculationSettings.madhab;
  }

  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).calculation_settings,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        DecoratedContainer(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              _buildDropdown(
                label: S.of(context).calculation_method,
                value: selectedMethod,
                items: _getMethodItems(context),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      selectedMethod = value;
                    });
                    _saveSettings();
                  }
                },
                isArabic: isArabic,
              ),
              const SizedBox(height: 16),
              _buildDropdown(
                label: S.of(context).madhab,
                value: selectedMadhab,
                items: _getMadhabItems(context),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      selectedMadhab = value;
                    });
                    _saveSettings();
                  }
                },
                isArabic: isArabic,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown({
    required String label,
    required String value,
    required List<DropdownMenuItem<String>> items,
    required ValueChanged<String?> onChanged,
    required bool isArabic,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeightHelper.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButton<String>(
            value: value,
            isExpanded: true,
            dropdownColor: Colors.black87,
            underline: const SizedBox(),
            icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
            items: items,
            onChanged: onChanged,
            style: const TextStyle(color: Colors.white, fontFamily: "Cairo"),
          ),
        ),
      ],
    );
  }

  List<DropdownMenuItem<String>> _getMethodItems(BuildContext context) {
    return [
      DropdownMenuItem(
        value: 'egyptian',
        child: Text(S.of(context).method_egyptian),
      ),
      DropdownMenuItem(
        value: 'umm_al_qura',
        child: Text(S.of(context).method_umm_al_qura),
      ),
      DropdownMenuItem(
        value: 'karachi',
        child: Text(S.of(context).method_karachi),
      ),
      DropdownMenuItem(
        value: 'north_america',
        child: Text(S.of(context).method_north_america),
      ),
      DropdownMenuItem(
        value: 'muslim_world_league',
        child: Text(S.of(context).method_muslim_world_league),
      ),
      DropdownMenuItem(value: 'dubai', child: Text(S.of(context).method_dubai)),
      DropdownMenuItem(value: 'qatar', child: Text(S.of(context).method_qatar)),
      DropdownMenuItem(
        value: 'kuwait',
        child: Text(S.of(context).method_kuwait),
      ),
      DropdownMenuItem(
        value: 'singapore',
        child: Text(S.of(context).method_singapore),
      ),
    ];
  }

  List<DropdownMenuItem<String>> _getMadhabItems(BuildContext context) {
    return [
      DropdownMenuItem(value: 'shafi', child: Text(S.of(context).madhab_shafi)),
      DropdownMenuItem(
        value: 'hanafi',
        child: Text(S.of(context).madhab_hanafi),
      ),
    ];
  }

  void _saveSettings() {
    _settingsCubit.saveCalculationSettings(
      CalculationSettings(
        calculationMethod: selectedMethod,
        madhab: selectedMadhab,
      ),
    );
  }
}
