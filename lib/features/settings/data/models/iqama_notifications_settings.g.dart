// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'iqama_notifications_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IqamaNotificationsSettings _$IqamaNotificationsSettingsFromJson(
  Map<String, dynamic> json,
) => IqamaNotificationsSettings(
  isEnabled: json['isEnabled'] as bool,
  fajrTime: (json['fajrTime'] as num).toInt(),
  dhuhrTime: (json['dhuhrTime'] as num).toInt(),
  asrTime: (json['asrTime'] as num).toInt(),
  maghribTime: (json['maghribTime'] as num).toInt(),
  ishaTime: (json['ishaTime'] as num).toInt(),
);

Map<String, dynamic> _$IqamaNotificationsSettingsToJson(
  IqamaNotificationsSettings instance,
) => <String, dynamic>{
  'isEnabled': instance.isEnabled,
  'fajrTime': instance.fajrTime,
  'dhuhrTime': instance.dhuhrTime,
  'asrTime': instance.asrTime,
  'maghribTime': instance.maghribTime,
  'ishaTime': instance.ishaTime,
};
