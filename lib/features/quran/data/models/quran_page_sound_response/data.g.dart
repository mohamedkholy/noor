// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  number: (json['number'] as num?)?.toInt(),
  ayahs: (json['ayahs'] as List<dynamic>?)
      ?.map((e) => Ayah.fromJson(e as Map<String, dynamic>))
      .toList(),
  surahs: (json['surahs'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(int.parse(k), Surah.fromJson(e as Map<String, dynamic>)),
  ),
  edition: json['edition'] == null
      ? null
      : Edition.fromJson(json['edition'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'number': instance.number,
  'ayahs': instance.ayahs,
  'surahs': instance.surahs?.map((k, e) => MapEntry(k.toString(), e)),
  'edition': instance.edition,
};
