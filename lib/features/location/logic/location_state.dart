import 'package:noor/core/database/cities/cities_database.dart';

abstract class LocationState {}

class LocationStateInitial extends LocationState {}

class LocationStateLoading extends LocationState {}

class CitiesLoadedState extends LocationState {
  final List<City> cities;

  CitiesLoadedState({required this.cities});
}

class RelocatingState extends LocationState {}

class RelocatingErrorState extends LocationState {
  final String message;
  final bool openSettings;
  RelocatingErrorState({required this.message, required this.openSettings});
}

 class RelocatingSuccessState extends LocationState {
  final City city;
  RelocatingSuccessState({required this.city}); 
}
