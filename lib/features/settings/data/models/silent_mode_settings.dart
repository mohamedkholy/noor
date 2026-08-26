import 'package:json_annotation/json_annotation.dart';

part 'silent_mode_settings.g.dart';

@JsonSerializable()
class SilentModeSettings {
  final bool isEnabled;
  final int startOffsetMinutes;
  final int endOffsetMinutes;

  const SilentModeSettings({
    required this.isEnabled,
    required this.startOffsetMinutes,
    required this.endOffsetMinutes,
  });

  factory SilentModeSettings.fromJson(Map<String, dynamic> json) =>
      _$SilentModeSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$SilentModeSettingsToJson(this);

  static const SilentModeSettings defaultSettings = SilentModeSettings(
    isEnabled: false,
    startOffsetMinutes: 0,
    endOffsetMinutes: 30,
  );

  SilentModeSettings copyWith({
    bool? isEnabled,
    int? startOffsetMinutes,
    int? endOffsetMinutes,
  }) {
    return SilentModeSettings(
      isEnabled: isEnabled ?? this.isEnabled,
      startOffsetMinutes: startOffsetMinutes ?? this.startOffsetMinutes,
      endOffsetMinutes: endOffsetMinutes ?? this.endOffsetMinutes,
    );
  }
}
