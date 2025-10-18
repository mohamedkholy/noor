import 'package:json_annotation/json_annotation.dart';

import '../surah.dart';

part 'ayah.g.dart';

@JsonSerializable()
class Ayah {
  int? number;
  String? audio;
  List<String>? audioSecondary;
  String? text;
  Surah? surah;
  int? numberInSurah;
  int? juz;
  int? manzil;
  int? page;
  int? ruku;
  int? hizbQuarter;
  bool? sajda;

  Ayah({
    this.number,
    this.audio,
    this.audioSecondary,
    this.text,
    this.surah,
    this.numberInSurah,
    this.juz,
    this.manzil,
    this.page,
    this.ruku,
    this.hizbQuarter,
    this.sajda,
  });

  @override
  String toString() {
    return 'Ayah(number: $number, audio: $audio, audioSecondary: $audioSecondary, text: $text, surah: $surah, numberInSurah: $numberInSurah, juz: $juz, manzil: $manzil, page: $page, ruku: $ruku, hizbQuarter: $hizbQuarter, sajda: $sajda)';
  }

  factory Ayah.fromJson(Map<String, dynamic> json) => _$AyahFromJson(json);

  Map<String, dynamic> toJson() => _$AyahToJson(this);

  Ayah copyWith({
    int? number,
    String? audio,
    List<String>? audioSecondary,
    String? text,
    Surah? surah,
    int? numberInSurah,
    int? juz,
    int? manzil,
    int? page,
    int? ruku,
    int? hizbQuarter,
    bool? sajda,
  }) {
    return Ayah(
      number: number ?? this.number,
      audio: audio ?? this.audio,
      audioSecondary: audioSecondary ?? this.audioSecondary,
      text: text ?? this.text,
      surah: surah ?? this.surah,
      numberInSurah: numberInSurah ?? this.numberInSurah,
      juz: juz ?? this.juz,
      manzil: manzil ?? this.manzil,
      page: page ?? this.page,
      ruku: ruku ?? this.ruku,
      hizbQuarter: hizbQuarter ?? this.hizbQuarter,
      sajda: sajda ?? this.sajda,
    );
  }
}
