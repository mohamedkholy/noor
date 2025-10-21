// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ayah.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ayah _$AyahFromJson(Map<String, dynamic> json) => Ayah(
  number: (json['number'] as num?)?.toInt(),
  audio: json['audio'] as String?,
  audioSecondary: (json['audioSecondary'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  text: json['text'] as String?,
  surah: json['surah'] == null
      ? null
      : Surah.fromJson(json['surah'] as Map<String, dynamic>),
  numberInSurah: (json['numberInSurah'] as num?)?.toInt(),
  juz: (json['juz'] as num?)?.toInt(),
  manzil: (json['manzil'] as num?)?.toInt(),
  page: (json['page'] as num?)?.toInt(),
  ruku: (json['ruku'] as num?)?.toInt(),
  hizbQuarter: (json['hizbQuarter'] as num?)?.toInt(),
);

Map<String, dynamic> _$AyahToJson(Ayah instance) => <String, dynamic>{
  'number': instance.number,
  'audio': instance.audio,
  'audioSecondary': instance.audioSecondary,
  'text': instance.text,
  'surah': instance.surah,
  'numberInSurah': instance.numberInSurah,
  'juz': instance.juz,
  'manzil': instance.manzil,
  'page': instance.page,
  'ruku': instance.ruku,
  'hizbQuarter': instance.hizbQuarter,
};
