import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DistanceCalculator {
  static double distanceToPoint(LatLng currentLocation, LatLng pointLatLng) {
    final distance =
        Geolocator.distanceBetween(
          currentLocation.latitude,
          currentLocation.longitude,
          pointLatLng.latitude,
          pointLatLng.longitude,
        ) /
        1000;
    return distance;
  }

  static double calculateRouteDistance(List<LatLng> route) {
    double totalDistance = 0.0;

    for (int i = 0; i < route.length - 1; i++) {
      totalDistance += Geolocator.distanceBetween(
        route[i].latitude,
        route[i].longitude,
        route[i + 1].latitude,
        route[i + 1].longitude,
      );
    }

    return totalDistance / 1000;
  }
}
