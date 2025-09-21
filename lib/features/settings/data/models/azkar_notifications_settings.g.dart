// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'azkar_notifications_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AzkarNotificationsSettings _$AzkarNotificationsSettingsFromJson(
  Map<String, dynamic> json,
) => AzkarNotificationsSettings(
  morningAzkarState: json['morningAzkarState'] as bool,
  eveningAzkarState: json['eveningAzkarState'] as bool,
  morningAzkarTime: (json['morningAzkarTime'] as num).toInt(),
  eveningAzkarTime: (json['eveningAzkarTime'] as num).toInt(),
);

Map<String, dynamic> _$AzkarNotificationsSettingsToJson(
  AzkarNotificationsSettings instance,
) => <String, dynamic>{
  'morningAzkarState': instance.morningAzkarState,
  'eveningAzkarState': instance.eveningAzkarState,
  'morningAzkarTime': instance.morningAzkarTime,
  'eveningAzkarTime': instance.eveningAzkarTime,
};
