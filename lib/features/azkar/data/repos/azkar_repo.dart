import 'dart:math';

import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:noor/core/database/azkar/azkar_database.dart';

@Injectable()
class AzkarRepo {
  final AzkarDatabase _db;

  AzkarRepo(this._db);

  Future<List<AzkarData>> getAzkar(String category) async {
    return await (_db.select(
      _db.azkar,
    )..where((e) => e.category.equals(category))).get();
  }

  Stream<List<CategoryData>> getAzkarCategories() {
    return (_db.select(_db.category)..orderBy([(e)=>OrderingTerm(expression: e.isFavorite,mode: OrderingMode.desc)])).watch();
  }

  void updateCategory(String category) {
    (_db.update(_db.category)
          ..where((e) => e.category.equals(category)))
        .write(const CategoryCompanion(
          isFavorite: Value(true),
        ));
  }
}
