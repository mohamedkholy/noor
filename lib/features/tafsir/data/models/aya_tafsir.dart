import 'package:flutter/material.dart';

@immutable
class AyaTafsir {
  final int? tafseerId;
  final String? tafseerName;
  final String? ayahUrl;
  final int? ayahNumber;
  final String? text;

  const AyaTafsir({
    this.tafseerId,
    this.tafseerName,
    this.ayahUrl,
    this.ayahNumber,
    this.text,
  });

  @override
  String toString() {
    return 'AyaTafsir(tafseerId: $tafseerId, tafseerName: $tafseerName, ayahUrl: $ayahUrl, ayahNumber: $ayahNumber, text: $text)';
  }

  factory AyaTafsir.fromJson(Map<String, dynamic> json) => AyaTafsir(
    tafseerId: json['tafseer_id'] as int?,
    tafseerName: json['tafseer_name'] as String?,
    ayahUrl: json['ayah_url'] as String?,
    ayahNumber: json['ayah_number'] as int?,
    text: json['text'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'tafseer_id': tafseerId,
    'tafseer_name': tafseerName,
    'ayah_url': ayahUrl,
    'ayah_number': ayahNumber,
    'text': text,
  };

  AyaTafsir copyWith({
    int? tafseerId,
    String? tafseerName,
    String? ayahUrl,
    int? ayahNumber,
    String? text,
  }) {
    return AyaTafsir(
      tafseerId: tafseerId ?? this.tafseerId,
      tafseerName: tafseerName ?? this.tafseerName,
      ayahUrl: ayahUrl ?? this.ayahUrl,
      ayahNumber: ayahNumber ?? this.ayahNumber,
      text: text ?? this.text,
    );
  }
}
