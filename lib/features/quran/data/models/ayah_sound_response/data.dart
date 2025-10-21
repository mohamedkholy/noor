import 'package:json_annotation/json_annotation.dart';
import 'package:noor/features/quran/data/models/surah.dart';

import 'edition.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  int? number;
  String? audio;
  List<String>? audioSecondary;
  String? text;
  Edition? edition;
  Surah? surah;
  int? numberInSurah;
  int? juz;
  int? manzil;
  int? page;
  int? ruku;
  int? hizbQuarter;

  Data({
    this.number,
    this.audio,
    this.audioSecondary,
    this.text,
    this.edition,
    this.surah,
    this.numberInSurah,
    this.juz,
    this.manzil,
    this.page,
    this.ruku,
    this.hizbQuarter,
  });

  @override
  String toString() {
    return 'Data(number: $number, audio: $audio, audioSecondary: $audioSecondary, text: $text, edition: $edition, surah: $surah, numberInSurah: $numberInSurah, juz: $juz, manzil: $manzil, page: $page, ruku: $ruku, hizbQuarter: $hizbQuarter)';
  }

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  Data copyWith({
    int? number,
    String? audio,
    List<String>? audioSecondary,
    String? text,
    Edition? edition,
    Surah? surah,
    int? numberInSurah,
    int? juz,
    int? manzil,
    int? page,
    int? ruku,
    int? hizbQuarter,
  }) {
    return Data(
      number: number ?? this.number,
      audio: audio ?? this.audio,
      audioSecondary: audioSecondary ?? this.audioSecondary,
      text: text ?? this.text,
      edition: edition ?? this.edition,
      surah: surah ?? this.surah,
      numberInSurah: numberInSurah ?? this.numberInSurah,
      juz: juz ?? this.juz,
      manzil: manzil ?? this.manzil,
      page: page ?? this.page,
      ruku: ruku ?? this.ruku,
      hizbQuarter: hizbQuarter ?? this.hizbQuarter,
    );
  }
}
