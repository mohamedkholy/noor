import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:noor/generated/l10n.dart';

class ApiConstants {
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
  static const String quranSoundUrl = "http://api.alquran.cloud/v1/";

  static String mapDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return S.current.connectionTimedOut;
      case DioExceptionType.sendTimeout:
        return S.current.sendTimeout;
      case DioExceptionType.receiveTimeout:
        return S.current.receiveTimeout;
      case DioExceptionType.badResponse:
        return "${S.current.serverError} ${e.response?.statusCode}";
      case DioExceptionType.cancel:
        return S.current.requestCancelled;
      case DioExceptionType.connectionError:
        return S.current.noInternetConnection;
      default:
        return S.current.unexpectedError;
    }
  }
}
