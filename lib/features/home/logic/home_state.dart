import 'package:noor/core/database/cities/cities_database.dart';
import 'package:noor/features/home/data/models/last_reading.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class LastReadingLoaded extends HomeState {
  final LastReadingData lastReading;
  LastReadingLoaded({required this.lastReading});
}

class CityLoaded extends HomeState {
  final City city;
  CityLoaded({required this.city});
}
