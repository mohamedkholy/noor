import 'package:noor/core/database/quran/quran_database.dart';
import 'package:noor/features/quran/data/models/ayah_sound_response/ayah_sound_response.dart';
import 'package:noor/features/quran/data/models/line_data.dart';
import 'package:noor/features/quran/data/models/quran_page_sound_response/quran_page_sound_response.dart';

abstract class QuranState {}

class QuranInitial extends QuranState {}

class QuranLoaded extends QuranState {
  final List<(Surah, List<Verse>)> surahs;
  QuranLoaded(this.surahs);
}

class QuranLodedFromStart extends QuranState {
  final List<(Surah, List<Verse>)> surahs;
  QuranLodedFromStart(this.surahs);
}

class QuranLodedFromEnd extends QuranState {
  final List<(Surah, List<Verse>)> surahs;
  QuranLodedFromEnd(this.surahs);
}

class SurahsLoaded extends QuranState {
  final List<Surah> surahs;
  final List<Verse> verses;
  SurahsLoaded({required this.surahs, required this.verses});
}

class QuranLinesLoaded extends QuranState {
  final List<List<LineData>> pages;
  QuranLinesLoaded(this.pages);
}

class QuranLinesLodedFromStart extends QuranState {
  final List<List<LineData>> pages;
  QuranLinesLodedFromStart(this.pages);
}

class QuranLinesLodedFromEnd extends QuranState {
  final List<List<LineData>> pages;
  QuranLinesLodedFromEnd(this.pages);
}

class PageSoundLoaded extends QuranState {
  final QuranPageSoundResponse sound;
  PageSoundLoaded(this.sound);
}

class PageSoundLoading extends QuranState {}

class PageSoundError extends QuranState {
  final String message;
  PageSoundError(this.message);
}

 class AyahSoundLoaded extends QuranState {
  final AyahSoundResponse sound;
  AyahSoundLoaded(this.sound);
}

class AyahSoundLoading extends QuranState {}

class AyahSoundError extends QuranState {
  final String message;
  AyahSoundError(this.message);
}
