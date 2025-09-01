import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:noor/core/database/mosques/mosques_database.dart';
import 'package:noor/core/di/dependency_injection.dart';
import 'package:noor/core/helpers/distance_calculator.dart';
import 'package:noor/core/networking/mosque_api_service.dart';
import 'package:noor/core/shared_preferences/shared_preferences_keys.dart';
import 'package:noor/features/near_mosque/data/models/mosque_data.dart';
import 'package:noor/features/near_mosque/data/models/nearby_mosques_response.dart';
import 'package:noor/generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable()
class NearMosqueRepo {
  final MosquesDatabase _db;
  final MosqueApiService _mosqueApiService;
  NearMosqueRepo(this._db, this._mosqueApiService);

  Future<NearbyMosquesResponse> getNearbyMosques(
    LatLng location, {
    int radius = 2000,
  }) async {
    try {
      final elements = await _mosqueApiService.fetchNearbyMosques(
        location,
        radius,
      );
      final mosques = await Future.wait(
        elements.map((e) async {
          final double lat = e.lat;
          final double lng = e.lon;
          return MosqueData(
            name: e.tags.name!,
            address: await getAddressFromLocation(LatLng(lat, lng)),
            location: LatLng(lat, lng),
            distance: DistanceCalculator.distanceToPoint(
              location,
              LatLng(lat, lng),
            ),
            route: await _mosqueApiService.fetchRouteFromOSRM(
              location,
              LatLng(lat, lng),
            ),
          );
        }).toList(),
      );
      await saveLastLocation(location);
      await saveNearMosquesLastLocations(mosques);
      return NearbyMosquesSuccess(mosques);
    } catch (e) {
      debugPrint("Overpass API error: $e");
      return NearbyMosquesError(S.current.unknown_error);
    }
  }

  Future<String?> getAddressFromLocation(LatLng location) async {
    final place = (await GeocodingPlatform.instance?.placemarkFromCoordinates(
      location.latitude,
      location.longitude,
    ))?.first;
    return place != null
        ? [
            place.street,
            place.locality,
            place.administrativeArea,
            place.country,
          ].where((e) => e != null && e.isNotEmpty).join(", ")
        : null;
  }

  Future<void> saveLastLocation(LatLng location) async {
    await getIt<SharedPreferences>().setString(
      SharedPreferencesKeys.lastLocation,
      json.encode({"lat": location.latitude, "lng": location.longitude}),
    );
  }

  Future<LatLng?> getLastLocation() async {
    final location = getIt<SharedPreferences>().getString(
      SharedPreferencesKeys.lastLocation,
    );
    if (location == null) {
      return null;
    }

    final data = json.decode(location) as Map<String, dynamic>;
    return LatLng(data["lat"], data["lng"]);
  }

  Future<List<MosqueData>> getNearMosquesLastLocations() async {
    final locations = await _db
        .select(_db.nearMosques)
        .map((p0) => MosqueData.fromDataBase(p0))
        .get();
    return locations;
  }

  Future<void> saveNearMosquesLastLocations(List<MosqueData> mosques) async {
    await _db.delete(_db.nearMosques).go();
    for (var element in mosques) {
      await _db.into(_db.nearMosques).insert(element.toDataBase());
    }
  }
}
