import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:noor/core/database/cities/cities_database.dart';
import 'package:noor/features/location/data/repos/location_repo.dart';
import 'package:noor/features/location/logic/location_state.dart';

@injectable
class LocationCubit extends Cubit<LocationState> {
  final LocationRepo _locationRepo;
  final List<City> _cities = [];

  LocationCubit(this._locationRepo) : super(LocationStateLoading());

  Future<void> getCities(int page, [String? query]) async {
    if (page == 0) {
      _cities.clear();
    }
    final cities = await _locationRepo.getCities(page: page, query: query);
    _cities.addAll(cities);
    emit(CitiesLoadedState(cities: _cities));
  }

  Future<void> saveCity(City city) async {
    await _locationRepo.saveCityToPrefs(city);
  }

  City? getSavedCity() {
    return _locationRepo.getSavedCity();
  }

  Future<void> getUserLocation() async {
    emit(RelocatingState());
    if (await Geolocator.isLocationServiceEnabled()) {
      var status = await Geolocator.checkPermission();
      if (status == LocationPermission.always ||
          status == LocationPermission.whileInUse) {
        getNearestCity();
      } else {
        status = await Geolocator.requestPermission();
        if (status == LocationPermission.deniedForever) {
          emit(
            RelocatingErrorState(
              message: 'You need to allow location permission from settings',
              openSettings: true,
            ),
          );
        } else if (status == LocationPermission.denied) {
          emit(
            RelocatingErrorState(
              message:
                  'To get your current location you must accept the location permission',
              openSettings: false,
            ),
          );
        } else if (status == LocationPermission.always ||
            status == LocationPermission.whileInUse) {
          getNearestCity();
        }
      }
    } else {
      emit(
        RelocatingErrorState(
          message: 'Location service disabled',
          openSettings: false,
        ),
      );
    }
  }

  Future<void> getNearestCity() async {
    final position = await Geolocator.getCurrentPosition();
    final city = await _locationRepo.findNearest(
      position.latitude,
      position.longitude,
    );
    print("city =============== $city");
    await saveCity(city);
    emit(RelocatingSuccessState(city: city));
  }
}
