import 'package:json_annotation/json_annotation.dart';
import 'package:noor/core/database/quran/quran_database.dart';

part 'reading_position.g.dart';

@JsonSerializable()
class ReadingPosition {
  final int juz;
  final int surahNumber;
  final String surahName;
  final int verseNumber;
  final int pageNumber;

  ReadingPosition({
    required this.juz,
    required this.surahNumber,
    required this.surahName,
    required this.verseNumber,
    required this.pageNumber,
  });

  factory ReadingPosition.fromVerse(Verse verse) {
    return ReadingPosition(
      juz: verse.juz,
      surahNumber: verse.surahNumber,
      surahName: verse.surahName,
      verseNumber: verse.number,
      pageNumber: verse.page,
    );
  }

  factory ReadingPosition.fromJson(Map<String, dynamic> json) =>
      _$ReadingPositionFromJson(json);

  Map<String, dynamic> toJson() => _$ReadingPositionToJson(this);

  @override
  String toString() =>
      'ReadingPosition(juz: $juz, surahNumber: $surahNumber, surahName: $surahName, verseNumber: $verseNumber, pageNumber: $pageNumber)';
}
