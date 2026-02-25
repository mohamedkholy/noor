import 'package:noor/core/database/quran/quran_database.dart';

abstract class AyatState {}

class AyatInitial extends AyatState {}

class QuranLoaded extends AyatState {
  final List<(Surah, List<Verse>)> surahs;
  QuranLoaded(this.surahs);
}

class QuranLodedFromStart extends AyatState {
  final List<(Surah, List<Verse>)> surahs;
  QuranLodedFromStart(this.surahs);
}

class QuranLodedFromEnd extends AyatState {
  final List<(Surah, List<Verse>)> surahs;
  QuranLodedFromEnd(this.surahs);
}

abstract class AyahSoundState extends AyatState {
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

class AudioPlayerStopped extends AyatState {}