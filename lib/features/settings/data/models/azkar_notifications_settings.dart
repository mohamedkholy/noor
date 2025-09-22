import 'package:json_annotation/json_annotation.dart';

part 'azkar_notifications_settings.g.dart';

@JsonSerializable()
class AzkarNotificationsSettings {
  final bool morningAzkarState;
  final bool eveningAzkarState;
  final int morningAzkarTime;
  final int eveningAzkarTime;
  final bool sleepingAzkarState;
  final int sleepingAzkarTime;

  AzkarNotificationsSettings({
    required this.morningAzkarState,
    required this.eveningAzkarState,
    required this.morningAzkarTime,
    required this.eveningAzkarTime,
    required this.sleepingAzkarState,
    required this.sleepingAzkarTime,
  });

  factory AzkarNotificationsSettings.fromJson(Map<String, dynamic> json) =>
      _$AzkarNotificationsSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$AzkarNotificationsSettingsToJson(this);
}
