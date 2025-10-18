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

abstract class AyahSoundState extends QuranState {
  final int surahNumber;
  final int verseNumber;
  AyahSoundState({required this.surahNumber, required this.verseNumber});
}

class AyahSoundPlayed extends AyahSoundState {
  AyahSoundPlayed({required super.surahNumber, required super.verseNumber});
}

class AyahSoundLoading extends AyahSoundState {
  AyahSoundLoading({required super.surahNumber, required super.verseNumber});
}

class AyahSoundError extends AyahSoundState {
  final String message;
  AyahSoundError({
    required this.message,
    required super.surahNumber,
    required super.verseNumber,
  });
}

class AudioPlayerPaused extends AyahSoundState {
  AudioPlayerPaused({required super.surahNumber, required super.verseNumber});
}

class AudioPlayerStopped extends QuranState {}

class PageSoundLoaded extends QuranState {
  final QuranPageSoundResponse sound;
  PageSoundLoaded(this.sound);
}

class PageSoundLoading extends QuranState {}

class PageSoundError extends QuranState {
  final String message;
  PageSoundError(this.message);
}
