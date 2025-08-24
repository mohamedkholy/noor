import 'package:noor/core/database/quran/quran_database.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class LastReadingLoaded extends HomeState {
  final Verse verse;
  final String suraNameEn;
  LastReadingLoaded({required this.verse, required this.suraNameEn});
}