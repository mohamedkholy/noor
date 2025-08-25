// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasbih_database.dart';

// ignore_for_file: type=lint
class $TasbihsTable extends Tasbihs with TableInfo<$TasbihsTable, Tasbih> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TasbihsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _zekrMeta = const VerificationMeta('zekr');
  @override
  late final GeneratedColumn<String> zekr = GeneratedColumn<String>(
    'zekr',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _countMeta = const VerificationMeta('count');
  @override
  late final GeneratedColumn<int> count = GeneratedColumn<int>(
    'count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [zekr, count];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tasbihs';
  @override
  VerificationContext validateIntegrity(
    Insertable<Tasbih> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('zekr')) {
      context.handle(
        _zekrMeta,
        zekr.isAcceptableOrUnknown(data['zekr']!, _zekrMeta),
      );
    } else if (isInserting) {
      context.missing(_zekrMeta);
    }
    if (data.containsKey('count')) {
      context.handle(
        _countMeta,
        count.isAcceptableOrUnknown(data['count']!, _countMeta),
      );
    } else if (isInserting) {
      context.missing(_countMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {zekr};
  @override
  Tasbih map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Tasbih(
      zekr: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}zekr'],
      )!,
      count: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}count'],
      )!,
    );
  }

  @override
  $TasbihsTable createAlias(String alias) {
    return $TasbihsTable(attachedDatabase, alias);
  }
}

class Tasbih extends DataClass implements Insertable<Tasbih> {
  final String zekr;
  final int count;
  const Tasbih({required this.zekr, required this.count});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['zekr'] = Variable<String>(zekr);
    map['count'] = Variable<int>(count);
    return map;
  }

  TasbihsCompanion toCompanion(bool nullToAbsent) {
    return TasbihsCompanion(zekr: Value(zekr), count: Value(count));
  }

  factory Tasbih.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Tasbih(
      zekr: serializer.fromJson<String>(json['zekr']),
      count: serializer.fromJson<int>(json['count']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'zekr': serializer.toJson<String>(zekr),
      'count': serializer.toJson<int>(count),
    };
  }

  Tasbih copyWith({String? zekr, int? count}) =>
      Tasbih(zekr: zekr ?? this.zekr, count: count ?? this.count);
  Tasbih copyWithCompanion(TasbihsCompanion data) {
    return Tasbih(
      zekr: data.zekr.present ? data.zekr.value : this.zekr,
      count: data.count.present ? data.count.value : this.count,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Tasbih(')
          ..write('zekr: $zekr, ')
          ..write('count: $count')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(zekr, count);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Tasbih && other.zekr == this.zekr && other.count == this.count);
}

class TasbihsCompanion extends UpdateCompanion<Tasbih> {
  final Value<String> zekr;
  final Value<int> count;
  final Value<int> rowid;
  const TasbihsCompanion({
    this.zekr = const Value.absent(),
    this.count = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TasbihsCompanion.insert({
    required String zekr,
    required int count,
    this.rowid = const Value.absent(),
  }) : zekr = Value(zekr),
       count = Value(count);
  static Insertable<Tasbih> custom({
    Expression<String>? zekr,
    Expression<int>? count,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (zekr != null) 'zekr': zekr,
      if (count != null) 'count': count,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TasbihsCompanion copyWith({
    Value<String>? zekr,
    Value<int>? count,
    Value<int>? rowid,
  }) {
    return TasbihsCompanion(
      zekr: zekr ?? this.zekr,
      count: count ?? this.count,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (zekr.present) {
      map['zekr'] = Variable<String>(zekr.value);
    }
    if (count.present) {
      map['count'] = Variable<int>(count.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TasbihsCompanion(')
          ..write('zekr: $zekr, ')
          ..write('count: $count, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$TasbihDatabase extends GeneratedDatabase {
  _$TasbihDatabase(QueryExecutor e) : super(e);
  $TasbihDatabaseManager get managers => $TasbihDatabaseManager(this);
  late final $TasbihsTable tasbihs = $TasbihsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [tasbihs];
}

typedef $$TasbihsTableCreateCompanionBuilder =
    TasbihsCompanion Function({
      required String zekr,
      required int count,
      Value<int> rowid,
    });
typedef $$TasbihsTableUpdateCompanionBuilder =
    TasbihsCompanion Function({
      Value<String> zekr,
      Value<int> count,
      Value<int> rowid,
    });

class $$TasbihsTableFilterComposer
    extends Composer<_$TasbihDatabase, $TasbihsTable> {
  $$TasbihsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get zekr => $composableBuilder(
    column: $table.zekr,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get count => $composableBuilder(
    column: $table.count,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TasbihsTableOrderingComposer
    extends Composer<_$TasbihDatabase, $TasbihsTable> {
  $$TasbihsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get zekr => $composableBuilder(
    column: $table.zekr,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get count => $composableBuilder(
    column: $table.count,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TasbihsTableAnnotationComposer
    extends Composer<_$TasbihDatabase, $TasbihsTable> {
  $$TasbihsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get zekr =>
      $composableBuilder(column: $table.zekr, builder: (column) => column);

  GeneratedColumn<int> get count =>
      $composableBuilder(column: $table.count, builder: (column) => column);
}

class $$TasbihsTableTableManager
    extends
        RootTableManager<
          _$TasbihDatabase,
          $TasbihsTable,
          Tasbih,
          $$TasbihsTableFilterComposer,
          $$TasbihsTableOrderingComposer,
          $$TasbihsTableAnnotationComposer,
          $$TasbihsTableCreateCompanionBuilder,
          $$TasbihsTableUpdateCompanionBuilder,
          (Tasbih, BaseReferences<_$TasbihDatabase, $TasbihsTable, Tasbih>),
          Tasbih,
          PrefetchHooks Function()
        > {
  $$TasbihsTableTableManager(_$TasbihDatabase db, $TasbihsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TasbihsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TasbihsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TasbihsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> zekr = const Value.absent(),
                Value<int> count = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TasbihsCompanion(zekr: zekr, count: count, rowid: rowid),
          createCompanionCallback:
              ({
                required String zekr,
                required int count,
                Value<int> rowid = const Value.absent(),
              }) => TasbihsCompanion.insert(
                zekr: zekr,
                count: count,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TasbihsTableProcessedTableManager =
    ProcessedTableManager<
      _$TasbihDatabase,
      $TasbihsTable,
      Tasbih,
      $$TasbihsTableFilterComposer,
      $$TasbihsTableOrderingComposer,
      $$TasbihsTableAnnotationComposer,
      $$TasbihsTableCreateCompanionBuilder,
      $$TasbihsTableUpdateCompanionBuilder,
      (Tasbih, BaseReferences<_$TasbihDatabase, $TasbihsTable, Tasbih>),
      Tasbih,
      PrefetchHooks Function()
    >;

class $TasbihDatabaseManager {
  final _$TasbihDatabase _db;
  $TasbihDatabaseManager(this._db);
  $$TasbihsTableTableManager get tasbihs =>
      $$TasbihsTableTableManager(_db, _db.tasbihs);
}
