import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:noor/core/database/hadith/hadith_database.dart';
import 'package:noor/features/hadith/data/models/kitab.dart';

@Singleton()
class HadithRepo {
  final HadithDatabase _db;

  HadithRepo(this._db);

  /// Builds a nested REPLACE SQL string to strip tashkeel from a column
  String _buildStripSql(String columnSql) {
    const marks = [
      '\u064B',
      '\u064C',
      '\u064D',
      '\u064E',
      '\u064F',
      '\u0650',
      '\u0651',
      '\u0652',
      '\u0653',
      '\u0654',
      '\u0655',
      '\u0656',
      '\u0657',
      '\u0658',
      '\u0659',
      '\u065A',
      '\u065B',
      '\u065C',
      '\u065D',
      '\u065E',
      '\u065F',
    ];

    var sql = columnSql;
    for (final mark in marks) {
      sql = "REPLACE($sql, '$mark', '')";
    }
    return sql;
  }

  Future<List<Hadith>> getKitab(Kitab kitab, int page, String? search) async {
    final cleanSearch = _stripMarksDart(search ?? '');

    return await (_db.select(_db.hadiths)
          ..where((t) => t.kitab.equals(kitab.name))
          ..where((t) {
            if (search == null || search.isEmpty) {
              return const Constant(true);
            }

            final arabStripped = CustomExpression<String>(
              _buildStripSql('"arab"'),
            );
            final terjemahStripped = CustomExpression<String>(
              _buildStripSql('"terjemah"'),
            );

            return arabStripped.contains(cleanSearch) |
                terjemahStripped.contains(cleanSearch) |
                t.number.equals(int.tryParse(search) ?? 0);
          })
          ..limit(20, offset: page * 20)
          ..orderBy([(e) => OrderingTerm(expression: e.number)]))
        .get();
  }

  String _stripMarksDart(String text) {
    return text.replaceAll(RegExp(r'[\u064B-\u065F\u0610-\u061A]'), '');
  }
}
