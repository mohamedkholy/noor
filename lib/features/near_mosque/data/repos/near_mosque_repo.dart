import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:noor/core/database/mosques/mosques_database.dart';
import 'package:noor/core/di/dependency_injection.dart';
import 'package:noor/core/helpers/distance_calculator.dart';
import 'package:noor/features/near_mosque/data/models/mosque_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable()
class NearMosqueRepo {
  final MosquesDatabase _db;
  final dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
    ),
  );
  NearMosqueRepo(this._db);

  Future<NearbyMosquesResponse> getNearbyMosques(
    LatLng location, {
    int radius = 2000,
  }) async {
    final query =
        """
[out:json][timeout:60];
node
  (around:$radius,${location.latitude},${location.longitude})
  ["amenity"="place_of_worship"]
  ["religion"="muslim"];
out 10;
""";

    try {
      debugPrint("start calling");
      const url = "https://overpass-api.de/api/interpreter";

      final response = await dio.post(
        url,
        data: {"data": query},
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );
      debugPrint("response: ${response.data}");
      if (response.statusCode != 200) {
        throw Exception("Overpass API error: ${response.statusCode}");
      }

      final data = response.data is String
          ? json.decode(response.data)
          : response.data;

      final elements = data["elements"] as List;
      final mosques = await Future.wait(
        elements.map((e) async {
          final tags = e["tags"] ?? {};
          final lat = e["lat"] as double;
          final lng = e["lon"] as double;
          return MosqueData(
            name: tags["name"] ?? "mosque",
            address: await getAddressFromLocation(LatLng(lat, lng)),
            location: LatLng(lat, lng),
            distance: DistanceCalculator.distanceToPoint(
              location,
              LatLng(lat, lng),
            ),
            route: await getRouteFromOSRM(location, LatLng(lat, lng)),
          );
        }).toList(),
      );
      await saveLastLocation(location);
      await saveLastLocationNearMosques(mosques);
      return NearbyMosquesSuccess(mosques);
    } catch (e) {
      debugPrint("Overpass API error: $e");
      return NearbyMosquesError("Unknown error Has occurred");
    }
  }

  Future<String?> getAddressFromLocation(LatLng location) async {
    final place = (await GeocodingPlatform.instance?.placemarkFromCoordinates(
      location.latitude,
      location.longitude,
    ))?.first;
    return place != null
        ? "${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}"
        : null;
  }

  Future<List<LatLng>> getRouteFromOSRM(
    LatLng origin,
    LatLng destination,
  ) async {
    final String pathParams =
        "${origin.longitude},${origin.latitude};${destination.longitude},${destination.latitude}";
    final url =
        'https://router.project-osrm.org/route/v1/driving/$pathParams?overview=full&geometries=geojson';

    final response = await dio.get(url);

    if (response.statusCode != 200) return [];

    final data = response.data;
    final coords = data['routes'][0]['geometry']['coordinates'] as List;

    return coords.map((c) => LatLng(c[1].toDouble(), c[0].toDouble())).toList();
  }

  Future<void> saveLastLocation(LatLng location) async {
    await getIt<SharedPreferences>().setString(
      "last_location",
      json.encode({"lat": location.latitude, "lng": location.longitude}),
    );
  }

  Future<LatLng?> getLastLocation() async {
    final location = getIt<SharedPreferences>().getString("last_location");
    if (location == null) {
      return null;
    }

    final data = json.decode(location) as Map<String, dynamic>;
    return LatLng(data["lat"], data["lng"]);
  }

  Future<List<MosqueData>> getLastLocationNearMosques() async {
    final locations = await _db
        .select(_db.nearMosques)
        .map((p0) => MosqueData.fromDataBase(p0))
        .get();
    return locations;
  }

  Future<void> saveLastLocationNearMosques(List<MosqueData> mosques) async {
    await _db.delete(_db.nearMosques).go();
    for (var element in mosques) {
      await _db.into(_db.nearMosques).insert(element.toDataBase());
    }
  }
}

class NearbyMosquesResponse {}

class NearbyMosquesError extends NearbyMosquesResponse {
  final String message;
  NearbyMosquesError(this.message);
}

class NearbyMosquesSuccess extends NearbyMosquesResponse {
  final List<MosqueData> mosques;
  NearbyMosquesSuccess(this.mosques);
}
