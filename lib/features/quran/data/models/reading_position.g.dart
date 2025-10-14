// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reading_position.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReadingPosition _$ReadingPositionFromJson(Map<String, dynamic> json) =>
    ReadingPosition(
      juz: (json['juz'] as num).toInt(),
      surahNumber: (json['surahNumber'] as num).toInt(),
      surahName: json['surahName'] as String,
      verseNumber: (json['verseNumber'] as num).toInt(),
      pageNumber: (json['pageNumber'] as num).toInt(),
    );

Map<String, dynamic> _$ReadingPositionToJson(ReadingPosition instance) =>
    <String, dynamic>{
      'juz': instance.juz,
      'surahNumber': instance.surahNumber,
      'surahName': instance.surahName,
      'verseNumber': instance.verseNumber,
      'pageNumber': instance.pageNumber,
    };
