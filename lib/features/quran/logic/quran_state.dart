import 'package:noor/core/database/quran/quran_database.dart';

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
