import 'package:json_annotation/json_annotation.dart';

part 'quran_sound_response.g.dart';

@JsonSerializable()
class QuranSoundResponse {
  final List<AudioFile> audioFiles;
  final Pagination pagination;

  QuranSoundResponse({
    required this.audioFiles,
    required this.pagination,
  });

  factory QuranSoundResponse.fromJson(Map<String, dynamic> json) =>
      _$QuranSoundResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuranSoundResponseToJson(this);
}

@JsonSerializable()
class AudioFile {
  final String url;
  final int duration;
  final String format;
  final List<List<List<int>>> segments;

  AudioFile({
    required this.url,
    required this.duration,
    required this.format,
    required this.segments,
  });

  factory AudioFile.fromJson(Map<String, dynamic> json) =>
      _$AudioFileFromJson(json);

  Map<String, dynamic> toJson() => _$AudioFileToJson(this);
}

@JsonSerializable()
class Pagination {
  @JsonKey(name: 'per_page')
  final int perPage;

  @JsonKey(name: 'current_page')
  final int currentPage;

  @JsonKey(name: 'next_page')
  final int nextPage;

  @JsonKey(name: 'total_pages=')
  final int totalPages;

  @JsonKey(name: 'total_records=')
  final int totalRecords;

  Pagination({
    required this.perPage,
    required this.currentPage,
    required this.nextPage,
    required this.totalPages,
    required this.totalRecords,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationToJson(this);
}
