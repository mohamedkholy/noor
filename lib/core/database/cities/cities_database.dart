import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:noor/core/database/cities/cities_tables.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

part 'cities_database.g.dart';

@DriftDatabase(tables: [Cities])
@singleton
class CitiesDatabase extends _$CitiesDatabase {
  CitiesDatabase() : super(_openConnection());
  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, "cities.db"));
      if (!await file.exists()) {
        final blob = await rootBundle.load("assets/database/cities.db");
        final buffer = blob.buffer;
        await file.writeAsBytes(
          buffer.asUint8List(blob.offsetInBytes, blob.lengthInBytes),
        );
      }
      if (Platform.isAndroid) {
        await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
      }
      final cachebase = (await getTemporaryDirectory()).path;
      sqlite3.tempDirectory = cachebase;
      return NativeDatabase.createInBackground(file);
    });
  }
}
