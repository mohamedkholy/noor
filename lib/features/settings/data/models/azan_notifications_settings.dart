import 'package:json_annotation/json_annotation.dart';

part 'azan_notifications_settings.g.dart';

@JsonSerializable()
class AzanNotificationsSettings {
  final bool fajrState;
  final bool dhuhrState;
  final bool asrState;
  final bool maghribState;
  final bool ishaState;

  AzanNotificationsSettings({
    required this.fajrState,
    required this.dhuhrState,
    required this.asrState,
    required this.maghribState,
    required this.ishaState,
  });

  factory AzanNotificationsSettings.fromJson(Map<String, dynamic> json) =>
      _$AzanNotificationsSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$AzanNotificationsSettingsToJson(this);
}
