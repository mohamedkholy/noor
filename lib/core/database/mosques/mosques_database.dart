import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:noor/core/database/mosques/mosques_tables.dart';

part 'mosques_database.g.dart';

@DriftDatabase(tables: [NearMosques])
@Singleton()
class MosquesDatabase extends _$MosquesDatabase {
  MosquesDatabase() : super(_openConnection());
  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: "mosques_database");
  }
}
