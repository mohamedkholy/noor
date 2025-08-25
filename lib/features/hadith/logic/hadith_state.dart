import 'package:noor/core/database/hadith/hadith_database.dart';

abstract class HadithState {}

class HadithInitial extends HadithState {}

class HadithLoaded extends HadithState {
  final List<Hadith> hadiths;

  HadithLoaded({required this.hadiths});
}

