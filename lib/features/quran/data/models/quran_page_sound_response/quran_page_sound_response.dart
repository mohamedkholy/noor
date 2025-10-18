import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'quran_page_sound_response.g.dart';

@JsonSerializable()
class QuranPageSoundResponse {
  int? code;
  String? status;
  Data? data;

  QuranPageSoundResponse({this.code, this.status, this.data});

  @override
  String toString() {
    return 'QuranPageSoundResponse(code: $code, status: $status, data: $data)';
  }

  factory QuranPageSoundResponse.fromJson(Map<String, dynamic> json) {
    return _$QuranPageSoundResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$QuranPageSoundResponseToJson(this);

  QuranPageSoundResponse copyWith({int? code, String? status, Data? data}) {
    return QuranPageSoundResponse(
      code: code ?? this.code,
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }
}
