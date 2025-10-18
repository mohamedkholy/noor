// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_page_sound_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuranPageSoundResponse _$QuranPageSoundResponseFromJson(
  Map<String, dynamic> json,
) => QuranPageSoundResponse(
  code: (json['code'] as num?)?.toInt(),
  status: json['status'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$QuranPageSoundResponseToJson(
  QuranPageSoundResponse instance,
) => <String, dynamic>{
  'code': instance.code,
  'status': instance.status,
  'data': instance.data,
};
