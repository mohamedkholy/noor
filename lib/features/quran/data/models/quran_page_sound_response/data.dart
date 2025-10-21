import 'package:json_annotation/json_annotation.dart';

import 'ayah.dart';
import 'edition.dart';
import '../surah.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  int? number;
  List<Ayah>? ayahs;
  Map<int, Surah>? surahs;
  Edition? edition;

  Data({this.number, this.ayahs, this.surahs, this.edition});

  @override
  String toString() {
    return 'Data(number: $number, ayahs: $ayahs, surahs: $surahs, edition: $edition)';
  }

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  Data copyWith({
    int? number,
    List<Ayah>? ayahs,
    Map<int, Surah>? surahs,
    Edition? edition,
  }) {
    return Data(
      number: number ?? this.number,
      ayahs: ayahs ?? this.ayahs,
      surahs: surahs ?? this.surahs,
      edition: edition ?? this.edition,
    );
  }
}
