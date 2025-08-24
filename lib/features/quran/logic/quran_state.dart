import 'package:noor/core/database/quran/quran_database.dart';

abstract class QuranState {

}

class QuranInitial extends QuranState {}

class QuranLoaded extends QuranState {
  final List<(Surah, List<Verse>)> verses;
  QuranLoaded(this.verses);
}



 class SurahsLoaded extends QuranState {
  final List<Surah> surahs;
   final List<Verse>? verses;
  SurahsLoaded({required this.surahs, this.verses});
}

