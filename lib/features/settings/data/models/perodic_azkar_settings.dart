class PerodicAzkarSettings {
  final bool isActive;
  final int perodicAzkarTime;
  final String sound;
  final String text;

  PerodicAzkarSettings({
    required this.isActive,
    required this.perodicAzkarTime,
    required this.sound,
    required this.text,
  });

  factory PerodicAzkarSettings.fromJson(Map<String, dynamic> json) =>
      PerodicAzkarSettings(
        isActive: json["perodicAzkarSetting"],
        perodicAzkarTime: json["perodicAzkarTime"],
        sound: json["sound"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
    "perodicAzkarSetting": isActive,
    "perodicAzkarTime": perodicAzkarTime,
    "sound": sound,
    "text": text,
  };
}
