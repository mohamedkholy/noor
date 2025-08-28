import 'package:noor/core/database/quran/quran_database.dart';

class LastReadingData {
  final Verse verse;
  final String suraNameEn;
  LastReadingData({required this.verse, required this.suraNameEn});

  factory LastReadingData.fromJson(Map<String, dynamic> json) =>
      LastReadingData(
        verse: Verse.fromJson(json['verse']),
        suraNameEn: json['suraNameEn'],
      );

  Map<String, dynamic> toJson() => {
    'verse': verse.toJson(),
    'suraNameEn': suraNameEn,
  };
}
