import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:noor/core/database/hadith/hadith_database.dart';
import 'package:noor/features/hadith/data/models/kitab.dart';

@Singleton()
class HadithRepo {
  final HadithDatabase _db;

  HadithRepo(this._db);

  Future<List<Hadith>> getKitab(Kitab kitab, int page, String? value) async {
    return await (_db.select(_db.hadiths)
          ..where((t) => t.kitab.equals(kitab.name))
          ..where(
            (t) =>
                t.arab.contains(value??"") |
                t.terjemah.contains(value??"") |
                t.number.equals(int.tryParse(value??"") ?? 0),
          )
          ..limit(20, offset: page * 20)
          ..orderBy([(e) => OrderingTerm(expression: _db.hadiths.number)]))
        .get();
  }
}
