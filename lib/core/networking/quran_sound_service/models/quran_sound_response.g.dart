// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_sound_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuranSoundResponse _$QuranSoundResponseFromJson(Map<String, dynamic> json) =>
    QuranSoundResponse(
      audioFiles: (json['audioFiles'] as List<dynamic>)
          .map((e) => AudioFile.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: Pagination.fromJson(
        json['pagination'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$QuranSoundResponseToJson(QuranSoundResponse instance) =>
    <String, dynamic>{
      'audioFiles': instance.audioFiles,
      'pagination': instance.pagination,
    };

AudioFile _$AudioFileFromJson(Map<String, dynamic> json) => AudioFile(
  url: json['url'] as String,
  duration: (json['duration'] as num).toInt(),
  format: json['format'] as String,
  segments: (json['segments'] as List<dynamic>)
      .map(
        (e) => (e as List<dynamic>)
            .map(
              (e) =>
                  (e as List<dynamic>).map((e) => (e as num).toInt()).toList(),
            )
            .toList(),
      )
      .toList(),
);

Map<String, dynamic> _$AudioFileToJson(AudioFile instance) => <String, dynamic>{
  'url': instance.url,
  'duration': instance.duration,
  'format': instance.format,
  'segments': instance.segments,
};

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination(
  perPage: (json['per_page'] as num).toInt(),
  currentPage: (json['current_page'] as num).toInt(),
  nextPage: (json['next_page'] as num).toInt(),
  totalPages: (json['total_pages='] as num).toInt(),
  totalRecords: (json['total_records='] as num).toInt(),
);

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'per_page': instance.perPage,
      'current_page': instance.currentPage,
      'next_page': instance.nextPage,
      'total_pages=': instance.totalPages,
      'total_records=': instance.totalRecords,
    };
