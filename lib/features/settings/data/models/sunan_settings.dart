class SunanSettings {
  final bool isEnabled;
  final bool fajrSunnah;
  final bool dhuhrSunan;
  final bool maghribSunnah;
  final bool ishaSunnah;

  const SunanSettings({
    required this.isEnabled,
    required this.fajrSunnah,
    required this.dhuhrSunan,
    required this.maghribSunnah,
    required this.ishaSunnah,
  });

  factory SunanSettings.fromJson(Map<String, dynamic> json) {
    return SunanSettings(
      isEnabled: json['is_enabled'],
      fajrSunnah: json['fajr_sunnah'],
      dhuhrSunan: json['dhuhr_sunnah'],
      maghribSunnah: json['maghrib_sunnah'],
      ishaSunnah: json['isha_sunnah'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'is_enabled': isEnabled,
      'fajr_sunnah': fajrSunnah,
      'dhuhr_sunnah': dhuhrSunan,
      'maghrib_sunnah': maghribSunnah,
      'isha_sunnah': ishaSunnah,
    };
  }
}
