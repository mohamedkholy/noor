import 'package:json_annotation/json_annotation.dart';

part 'iqama_notifications_settings.g.dart';

@JsonSerializable()
class IqamaNotificationsSettings {
  final bool isEnabled;
  final int fajrTime;
  final int dhuhrTime;
  final int asrTime;
  final int maghribTime;
  final int ishaTime;

  IqamaNotificationsSettings({
    required this.isEnabled,
    required this.fajrTime,
    required this.dhuhrTime,
    required this.asrTime,
    required this.maghribTime,
    required this.ishaTime,
  });

  factory IqamaNotificationsSettings.fromJson(Map<String, dynamic> json) =>
      _$IqamaNotificationsSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$IqamaNotificationsSettingsToJson(this);
}