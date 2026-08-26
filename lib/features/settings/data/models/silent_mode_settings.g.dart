// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'silent_mode_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SilentModeSettings _$SilentModeSettingsFromJson(Map<String, dynamic> json) =>
    SilentModeSettings(
      isEnabled: json['isEnabled'] as bool,
      startOffsetMinutes: (json['startOffsetMinutes'] as num).toInt(),
      endOffsetMinutes: (json['endOffsetMinutes'] as num).toInt(),
    );

Map<String, dynamic> _$SilentModeSettingsToJson(SilentModeSettings instance) =>
    <String, dynamic>{
      'isEnabled': instance.isEnabled,
      'startOffsetMinutes': instance.startOffsetMinutes,
      'endOffsetMinutes': instance.endOffsetMinutes,
    };
