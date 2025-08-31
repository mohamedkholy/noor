import 'package:noor/core/database/cities/cities_database.dart';
import 'package:noor/core/database/hadith/hadith_database.dart';
import 'package:noor/core/database/quran/quran_database.dart';
import 'package:noor/features/home/data/models/last_reading.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class LastReadingLoaded extends HomeState {
  final LastReadingData lastReading;
  LastReadingLoaded({required this.lastReading});
}

class TodayHadithLoaded extends HomeState {
  final Hadith hadith;
  TodayHadithLoaded({required this.hadith});
}

class TodayVerseLoaded extends HomeState {
  final Verse verse;
  TodayVerseLoaded({required this.verse});
}
