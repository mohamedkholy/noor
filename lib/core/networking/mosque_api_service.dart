import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:noor/core/networking/models/orsm_response.dart';
import 'package:noor/core/networking/models/overpass_response.dart';
import 'package:noor/core/networking/mosque_api_constants.dart';

@Injectable()
class MosqueApiService {
  final Dio _dio;
  MosqueApiService(this._dio);

  Future<List<Element>> fetchNearbyMosques(LatLng location, int radius) async {
    final query = MosqueApiConstants.overpassQuery(location, radius);
    const overpassApiUrl = MosqueApiConstants.overpassApiUrl;
    final response = await _dio.post(
      overpassApiUrl,
      data: {"data": query},
      options: Options(contentType: Headers.formUrlEncodedContentType),
    );

    if (response.statusCode != 200 || response.data == null) {
      throw Exception("Overpass API error: ${response.statusCode}");
    }
    final OverpassResponse overpassResponse = OverpassResponse.fromJson(
      response.data,
    );
    return overpassResponse.elements;
  }

  Future<List<LatLng>> fetchRouteFromOSRM(
    LatLng origin,
    LatLng destination,
  ) async {
    final pathParams =
        "${origin.longitude},${origin.latitude};${destination.longitude},${destination.latitude}";
    final osrmApiUrl = MosqueApiConstants.osrmApiUrl(pathParams);
    final response = await _dio.get(osrmApiUrl);
    if (response.statusCode != 200) return [];
    final OrsmResponse orsmResponse = OrsmResponse.fromJson(response.data);
    if (orsmResponse.routes.isEmpty) return [];
    final coords = orsmResponse.routes.first.geometry.coordinates;
    return coords.map((c) => LatLng(c[1].toDouble(), c[0].toDouble())).toList();
  }
}
