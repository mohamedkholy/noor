import 'package:google_maps_flutter/google_maps_flutter.dart';

class MosqueApiConstants {
  static const String overpassApiUrl =
      "https://overpass-api.de/api/interpreter";
  static String overpassQuery(LatLng location, int radius) =>
      """
[out:json][timeout:60];
node
  (around:$radius,${location.latitude},${location.longitude})
  ["amenity"="place_of_worship"]
  ["religion"="muslim"];
out 10;
""";
  static String osrmApiUrl(String pathParams) =>
      'https://router.project-osrm.org/route/v1/driving/$pathParams?overview=full&geometries=geojson';
}
