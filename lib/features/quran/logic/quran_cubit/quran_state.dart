import 'package:noor/core/database/quran/quran_database.dart';
import 'package:noor/features/quran/data/models/ayah_sound_response/ayah_sound_response.dart';
import 'package:noor/features/quran/data/models/line_data.dart';
import 'package:noor/features/quran/data/models/quran_page_sound_response/quran_page_sound_response.dart';

abstract class QuranState {}

class QuranInitial extends QuranState {}

class SurahsLoaded extends QuranState {
  final List<Surah> surahs;
  final List<Verse> verses;
  SurahsLoaded({required this.surahs, required this.verses});
}

