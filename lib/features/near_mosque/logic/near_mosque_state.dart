import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:noor/features/near_mosque/data/models/mosque_data.dart';
import 'package:noor/features/near_mosque/data/models/near_mosque_error.dart';

abstract class NearMosqueState {}

class NearMosqueInitial extends NearMosqueState {}

class NearMosqueLoading extends NearMosqueState {}

class NearMosquesLoaded extends NearMosqueState {
  final List<MosqueData> mosques;
  final LatLng currelocation;
  NearMosquesLoaded({required this.mosques, required this.currelocation});
}

class MosqueSelected extends NearMosqueState {
  final MosqueData mosque;
  MosqueSelected({required this.mosque});
}

class UnselectMosque extends NearMosqueState {}

class NearMosqueErrorState extends NearMosqueState {
  final String message;
  final NearMosqueError errorType;
  final bool? openSettings;
  NearMosqueErrorState({
    required this.message,
    required this.errorType,
    this.openSettings,
  });
}
