import 'package:noor/features/quran/data/models/line_data.dart';
import 'package:noor/features/quran/data/models/quran_page_sound_response/quran_page_sound_response.dart';

abstract class MushafState {}

class MushafInitial extends MushafState {}

class QuranLinesLoaded extends MushafState {
  final List<List<LineData>> pages;
  QuranLinesLoaded(this.pages);
}

class QuranLinesLodedFromStart extends MushafState {
  final List<List<LineData>> pages;
  QuranLinesLodedFromStart(this.pages);
}

class QuranLinesLodedFromEnd extends MushafState {
  final List<List<LineData>> pages;
  QuranLinesLodedFromEnd(this.pages);
}


class AudioPlayerPaused extends MushafState {
  final int surahNumber;
  final int verseNumber;
  AudioPlayerPaused({required this.surahNumber, required this.verseNumber});
}

class AudioPlayerStopped extends MushafState {}

class PageSoundLoaded extends MushafState {
  final QuranPageSoundResponse sound;
  PageSoundLoaded(this.sound);
}

class PageSoundLoading extends MushafState {}

class PageSoundError extends MushafState {
  final String message;
  PageSoundError(this.message);
}
