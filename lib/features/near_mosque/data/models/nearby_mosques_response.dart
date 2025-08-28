import 'package:noor/features/near_mosque/data/models/mosque_data.dart';

class NearbyMosquesResponse {}

class NearbyMosquesError extends NearbyMosquesResponse {
  final String message;
  NearbyMosquesError(this.message);
}

class NearbyMosquesSuccess extends NearbyMosquesResponse {
  final List<MosqueData> mosques;
  NearbyMosquesSuccess(this.mosques);
}
