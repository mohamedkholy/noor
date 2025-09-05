import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:noor/core/database/mosques/mosques_database.dart';

class MosqueData {
  final String name;
  final String? address;
  final LatLng location;
  final double distance;
  final List<LatLng> route;
  MosqueData({
    required this.name,
    required this.address,
    required this.location,
    required this.distance,
    required this.route,
  });

  static MosqueData fromDataBase(NearMosque mosque) {
    final List<LatLng> route = [];
    final List<String> routeString = mosque.route.split(',');
    for (int i = 0; i < routeString.length - 1; i += 2) {
      route.add(
        LatLng(double.parse(routeString[i]), double.parse(routeString[i + 1])),
      );
    }
    return MosqueData(
      name: mosque.name,
      address: mosque.address,
      location: LatLng(mosque.lat, mosque.lng),
      distance: mosque.distance,
      route: route,
    );
  }

  NearMosque toDataBase() {
    final List<String> routeString = [];
    for (var element in route) {
      routeString.add(element.latitude.toString());
      routeString.add(element.longitude.toString());
    }
    return NearMosque(
      name: name,
      address: address,
      lat: location.latitude,
      lng: location.longitude,
      distance: distance,
      route: routeString.join(','),
    );
  }
}
