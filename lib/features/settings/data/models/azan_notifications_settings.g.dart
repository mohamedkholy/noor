// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'azan_notifications_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AzanNotificationsSettings _$AzanNotificationsSettingsFromJson(
  Map<String, dynamic> json,
) => AzanNotificationsSettings(
  fajrState: json['fajrState'] as bool,
  dhuhrState: json['dhuhrState'] as bool,
  asrState: json['asrState'] as bool,
  maghribState: json['maghribState'] as bool,
  ishaState: json['ishaState'] as bool,
);

Map<String, dynamic> _$AzanNotificationsSettingsToJson(
  AzanNotificationsSettings instance,
) => <String, dynamic>{
  'fajrState': instance.fajrState,
  'dhuhrState': instance.dhuhrState,
  'asrState': instance.asrState,
  'maghribState': instance.maghribState,
  'ishaState': instance.ishaState,
};
