class SunanSetting {
  final DateTime date;
  final bool fajrSunnah;
  final bool beforeDhuhrSunnah;
  final bool afterDhuhrSunnah;
  final bool maghribSunnah;
  final bool ishaSunnah;

  const SunanSetting({
    required this.date,
    required this.fajrSunnah,
    required this.beforeDhuhrSunnah,
    required this.afterDhuhrSunnah,
    required this.maghribSunnah,
    required this.ishaSunnah,
  });

  factory SunanSetting.fromJson(Map<String, dynamic> json) {
    return SunanSetting(
      date: DateTime.parse(json['date']),
      fajrSunnah: json['fajr_sunnah'],
      beforeDhuhrSunnah: json['before_dhuhr_sunnah'],
      afterDhuhrSunnah: json['after_dhuhr_sunnah'],
      maghribSunnah: json['maghrib_sunnah'],
      ishaSunnah: json['isha_sunnah'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(),
      'fajr_sunnah': fajrSunnah,
      'before_dhuhr_sunnah': beforeDhuhrSunnah,
      'after_dhuhr_sunnah': afterDhuhrSunnah,
      'maghrib_sunnah': maghribSunnah,
      'isha_sunnah': ishaSunnah,
    };
  }
}