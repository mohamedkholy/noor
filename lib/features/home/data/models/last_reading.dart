import 'package:noor/core/database/quran/quran_database.dart';
import 'package:noor/features/quran/data/models/reading_position.dart';

class LastReadingData {
  final ReadingPosition readingPosition;
  final String suraNameEn;
  LastReadingData({required this.readingPosition, required this.suraNameEn});

  factory LastReadingData.fromJson(Map<String, dynamic> json) =>
      LastReadingData(
        readingPosition: ReadingPosition.fromJson(json['readingPosition']),
        suraNameEn: json['suraNameEn'],
      );

  Map<String, dynamic> toJson() => {
    'readingPosition': readingPosition.toJson(),
    'suraNameEn': suraNameEn,
  };
}
