import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:noor/core/helpers/connection_observer.dart';
import 'package:noor/features/near_mosque/data/models/mosque_data.dart';
import 'package:noor/features/near_mosque/data/models/near_mosque_error.dart';
import 'package:noor/features/near_mosque/data/models/nearby_mosques_response.dart';
import 'package:noor/features/near_mosque/data/repos/near_mosque_repo.dart';
import 'package:noor/features/near_mosque/logic/near_mosque_state.dart';
import 'package:url_launcher/url_launcher.dart';

@injectable
class NearMosqueCubit extends Cubit<NearMosqueState> {
  final NearMosqueRepo nearMosqueRepo;
  LatLng? currentLocation;
  NearMosqueCubit(this.nearMosqueRepo) : super(NearMosqueInitial()) {
    stream.listen((event) {
      debugPrint("event $event");
    });
  }

  Future<void> checkLocationStatus(LatLng? savedLocation) async {
    emit(NearMosqueLoading());
    if (await ConnectionObserver.checkConnectivity() ==
        InternetConnectionState.disconnected) {
      emit(
        NearMosqueErrorState(
          message: 'No internet connection',
          errorType: NearMosqueError.noInternet,
        ),
      );
      return;
    }
    if (await Geolocator.isLocationServiceEnabled()) {
      var status = await Geolocator.checkPermission();
      if (status == LocationPermission.always ||
          status == LocationPermission.whileInUse) {
        final position = await Geolocator.getCurrentPosition();
        if (savedLocation == LatLng(position.latitude, position.longitude)) {
          emit(NearMosqueInitial());
          return;
        }
        _getNearMosques(
          location: LatLng(position.latitude, position.longitude),
        );
      } else {
        status = await Geolocator.requestPermission();
        if (status == LocationPermission.deniedForever) {
          emit(
            NearMosqueErrorState(
              message: 'Location permission denied',
              errorType: NearMosqueError.locationDenied,
              openSettings: true,
            ),
          );
        } else if (status == LocationPermission.denied) {
          emit(
            NearMosqueErrorState(
              message: 'Location permission denied',
              errorType: NearMosqueError.locationDenied,
            ),
          );
        } else if (status == LocationPermission.always ||
            status == LocationPermission.whileInUse) {
          final position = await Geolocator.getCurrentPosition();
          if (savedLocation == LatLng(position.latitude, position.longitude)) {
            emit(NearMosqueInitial());
            return;
          }
          _getNearMosques(
            location: LatLng(position.latitude, position.longitude),
          );
        }
      }
    } else {
      emit(
        NearMosqueErrorState(
          message: 'Location service disabled',
          errorType: NearMosqueError.locationDenied,
        ),
      );
    }
  }

  Future<void> _getNearMosques({required LatLng location}) async {
    if (state is! NearMosqueLoading) {
      emit(NearMosqueLoading());
    }
    try {
      final response = await nearMosqueRepo.getNearbyMosques(location);
      if (response is NearbyMosquesSuccess) {
        emit(
          NearMosquesLoaded(mosques: response.mosques, currelocation: location),
        );
        currentLocation = location;
      } else if (response is NearbyMosquesError) {
        emit(
          NearMosqueErrorState(
            message: response.message,
            errorType: NearMosqueError.unknown,
          ),
        );
      }
    } catch (e) {
      emit(
        NearMosqueErrorState(
          message: e.toString(),
          errorType: NearMosqueError.unknown,
        ),
      );
    }
  }

  Future<void> initMap() async {
    final savedLocation = await nearMosqueRepo.getLastLocation();
    if (savedLocation != null) {
      final mosques = await nearMosqueRepo.getNearMosquesLastLocations();
      emit(NearMosquesLoaded(mosques: mosques, currelocation: savedLocation));
      currentLocation = savedLocation;
      await Future.delayed(const Duration(milliseconds: 300));
    }
    checkLocationStatus(savedLocation);
  }

  Future<void> Navigate(LatLng mosqueLocation) async {
    final startLat = currentLocation?.latitude;
    final startLng = currentLocation?.longitude;
    final destLat = mosqueLocation.latitude;
    final destLng = mosqueLocation.longitude;

    final uri = Uri.parse(
      'https://www.google.com/maps/dir/?api=1'
      '&origin=$startLat,$startLng'
      '&destination=$destLat,$destLng'
      '&travelmode=transit',
    );

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  void selectMosque({required MosqueData mosque}) {
    emit(MosqueSelected(mosque: mosque));
  }

  void unselectMosque() {
    emit(UnselectMosque());
  }
}
