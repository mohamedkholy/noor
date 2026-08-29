import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/di/dependency_injection.dart';
import 'package:noor/core/helpers/silent_mode_helper.dart';
import 'package:noor/core/helpers/ui_helper.dart';
import 'package:noor/core/notifications/notifications_manager.dart';
import 'package:noor/core/theming/my_colors.dart';
import 'package:noor/core/widgets/battery_optimization_dialog.dart';
import 'package:noor/core/widgets/decorated_container.dart';
import 'package:noor/features/settings/data/models/silent_mode_settings.dart';
import 'package:noor/features/settings/logic/settings_cubit.dart';
import 'package:noor/generated/l10n.dart';

class SilentModeWidget extends StatefulWidget {
  const SilentModeWidget({super.key, required this.silentModeSettings});

  final SilentModeSettings silentModeSettings;

  @override
  State<SilentModeWidget> createState() => _SilentModeWidgetState();
}

class _SilentModeWidgetState extends State<SilentModeWidget> {
  late final SettingsCubit _settingsCubit = context.read();
  late SilentModeSettings _settings = _normalized(widget.silentModeSettings);

  SilentModeSettings _normalized(SilentModeSettings settings) {
    final minEnd = (settings.startOffsetMinutes + 5).clamp(5, 60);
    if (settings.endOffsetMinutes < minEnd) {
      return settings.copyWith(endOffsetMinutes: minEnd);
    }
    return settings;
  }

  @override
  Widget build(BuildContext context) {
    if (!Platform.isAndroid) return const SizedBox();

    final isBefore = _settings.startOffsetMinutes < 0;
    final startAbsMinutes = _settings.startOffsetMinutes.abs();
    final minEndMinutes = (_settings.startOffsetMinutes + 5).clamp(5, 60);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).silent_mode_settings,
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
                      S.of(context).silent_during_prayer,
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
                    value: _settings.isEnabled,
                    onChanged: _onToggleEnabled,
                  ),
                ],
              ),
              if (_settings.isEnabled) ...[
                const Divider(color: Colors.white24, height: 25),
                _buildTimeSection(
                  icon: Icons.play_circle_outline,
                  title: S.of(context).silent_start_time,
                  child: Column(
                    children: [
                      SegmentedButton<bool>(
                        segments: [
                          ButtonSegment<bool>(
                            value: true,
                            label: Text(S.of(context).before_adhan),
                          ),
                          ButtonSegment<bool>(
                            value: false,
                            label: Text(S.of(context).after_adhan),
                          ),
                        ],
                        selected: {isBefore},
                        onSelectionChanged: (newSelection) {
                          final selectBefore = newSelection.first;
                          final newOffset = selectBefore
                              ? -startAbsMinutes
                              : startAbsMinutes;
                          _commitSettings(
                            _settings.copyWith(startOffsetMinutes: newOffset),
                          );
                        },
                        style: ButtonStyle(
                          foregroundColor: WidgetStateProperty.resolveWith(
                            (states) => states.contains(WidgetState.selected)
                                ? MyColors.primary
                                : Colors.white,
                          ),
                          backgroundColor: WidgetStateProperty.resolveWith(
                            (states) => states.contains(WidgetState.selected)
                                ? MyColors.secondary
                                : Colors.transparent,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Slider(
                        max: 30,
                        divisions: 30,
                        value: startAbsMinutes.toDouble(),
                        thumbColor: MyColors.secondary,
                        activeColor: MyColors.secondary,
                        inactiveColor: Colors.grey,
                        onChanged: (val) {
                          final minutes = val.toInt();
                          final newOffset = isBefore ? -minutes : minutes;
                          _updateLocal(
                            _settings.copyWith(startOffsetMinutes: newOffset),
                          );
                        },
                        onChangeEnd: (val) => _commitSettings(_settings),
                      ),
                      Text(
                        startAbsMinutes == 0
                            ? S.of(context).silent_during_prayer
                            : "$startAbsMinutes ${isBefore ? S.of(context).minutes_before_adhan : S.of(context).minutes_after_adhan}",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 14),
                Builder(
                  builder: (_) {
                    final displayEndMinutes = _settings.endOffsetMinutes.clamp(
                      minEndMinutes,
                      60,
                    );
                    return _buildTimeSection(
                      icon: Icons.stop_circle_outlined,
                      title: S.of(context).silent_end_time,
                      child: Column(
                        children: [
                          Slider(
                            max: 60,
                            min: minEndMinutes.toDouble(),
                            divisions: (60 - minEndMinutes).clamp(1, 60),
                            value: displayEndMinutes.toDouble(),
                            thumbColor: MyColors.secondary,
                            activeColor: MyColors.secondary,
                            inactiveColor: Colors.grey,
                            onChanged: (val) {
                              _updateLocal(
                                _settings.copyWith(
                                  endOffsetMinutes: val.toInt(),
                                ),
                              );
                            },
                            onChangeEnd: (val) => _commitSettings(_settings),
                          ),
                          Text(
                            "$displayEndMinutes ${S.of(context).minutes_after_adhan}",
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTimeSection({
    required IconData icon,
    required String title,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 18, color: MyColors.secondary),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }

  Future<void> _onToggleEnabled(bool value) async {
    if (value && !await SilentModeHelper.isDndPermissionGranted()) {
      await SilentModeHelper.openDndSettings();
      if (!mounted) return;
      UiHelper.showToast(
        text: S.of(context).silent_mode_permission_message,
        state: ToastStates.warning,
      );
      return;
    }

    if (!mounted) return;

    if (value) {
      await showBatteryOptimizationDialog(context);
      if (!mounted) return;
    }

    _commitSettings(_settings.copyWith(isEnabled: value));
  }

  void _updateLocal(SilentModeSettings newSettings) {
    setState(() {
      _settings = _normalized(newSettings);
    });
  }

  void _commitSettings(SilentModeSettings newSettings) {
    final normalized = _normalized(newSettings);

    setState(() {
      _settings = normalized;
    });

    _settingsCubit.saveSilentModeSettings(normalized);

    if (normalized.isEnabled) {
      getIt<NotificationsManager>().scheduleSilentModeWindows();
    } else {
      SilentModeHelper.cancelSilentWindows();
    }
  }
}
