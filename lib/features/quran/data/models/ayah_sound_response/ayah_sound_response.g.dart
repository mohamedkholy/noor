// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ayah_sound_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AyahSoundResponse _$AyahSoundResponseFromJson(Map<String, dynamic> json) =>
    AyahSoundResponse(
      code: (json['code'] as num?)?.toInt(),
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AyahSoundResponseToJson(AyahSoundResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'data': instance.data,
    };
