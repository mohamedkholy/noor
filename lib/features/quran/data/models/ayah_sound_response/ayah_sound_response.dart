import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'ayah_sound_response.g.dart';

@JsonSerializable()
class AyahSoundResponse {
  int? code;
  String? status;
  Data? data;

  AyahSoundResponse({this.code, this.status, this.data});

  @override
  String toString() {
    return 'AyahSoundResponse(code: $code, status: $status, data: $data)';
  }

  factory AyahSoundResponse.fromJson(Map<String, dynamic> json) {
    return _$AyahSoundResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AyahSoundResponseToJson(this);

  AyahSoundResponse copyWith({int? code, String? status, Data? data}) {
    return AyahSoundResponse(
      code: code ?? this.code,
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }
}
