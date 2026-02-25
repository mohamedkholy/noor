import 'package:noor/features/quran/data/models/line_data.dart';

abstract class MushafState {}

class MushafInitial extends MushafState {}

class QuranLinesLoading extends MushafState {}

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

abstract class AudioPlayerState extends MushafState {
  final int pageNumber;
  final int suraNumber;
  final int ayaNumber;
  AudioPlayerState({
    required this.pageNumber,
    required this.suraNumber,
    required this.ayaNumber,
  });
}

class AudioPlayerPlaying extends AudioPlayerState {
  AudioPlayerPlaying({
    required super.pageNumber,
    required super.suraNumber,
    required super.ayaNumber,
  });
}

class AudioPlayerPaused extends AudioPlayerState {
  AudioPlayerPaused({
    required super.pageNumber,
    required super.suraNumber,
    required super.ayaNumber,
  });
}

class AudioPlayerStopped extends MushafState {}

class PageSoundLoading extends AudioPlayerState {
  PageSoundLoading({
    required super.pageNumber,
    required super.suraNumber,
    required super.ayaNumber,
  });
}

class PageSoundError extends MushafState {
  final String message;
  final int suraNumber;
  final int ayaNumber;
  final int lineNumber;
  PageSoundError({
    required this.message,
    required this.suraNumber,
    required this.ayaNumber,
    required this.lineNumber,
  });
}
