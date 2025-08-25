import 'package:injectable/injectable.dart';
import 'package:noor/core/database/tasbih/tasbih_database.dart';

@Injectable()
class TasbihRepo {
  final TasbihDatabase _db;

  TasbihRepo(this._db);

  Stream<List<Tasbih>> getTasbih() {
    return _db.select(_db.tasbihs).watch();
  }

  Future<void> updateCount(Tasbih tasbih) async {
    await (_db.update(
      _db.tasbihs,
    )..where((table) => table.zekr.equals(tasbih.zekr))).write(tasbih);
  }

  Future<void> deleteTasbih(Tasbih tasbih) async {
    await _db.delete(_db.tasbihs).delete(tasbih);
  }

  Future<int> insertTasbih(Tasbih tasbih) async {
    return await _db.into(_db.tasbihs).insert(tasbih);
  }

  Future<int> updateTasbih(String oldZekr, Tasbih newTasbih) async {
    return await (_db.update(
      _db.tasbihs,
    )..where((table) => table.zekr.equals(oldZekr))).write(newTasbih);
  }
}
