import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:noor/core/database/cities/cities_database.dart';

@Injectable()
class HomeRepo {
 final CitiesDatabase _db;

 HomeRepo(this._db);

 Future<City> findNearest(double userLat, double userLng) async {
    final latDiff = _db.cities.lat - Constant(userLat);
    final lngDiff = _db.cities.lng - Constant(userLng);

    final distanceExpr = latDiff * latDiff + lngDiff * lngDiff;

    final query = (_db.select(_db.cities)
      ..orderBy([(c) => OrderingTerm(expression: distanceExpr)])
      ..limit(1));

    return query.getSingle();
  }

}