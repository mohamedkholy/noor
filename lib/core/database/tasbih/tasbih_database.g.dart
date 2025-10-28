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
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dailyTargetMeta = const VerificationMeta(
    'dailyTarget',
  );
  @override
  late final GeneratedColumn<int> dailyTarget = GeneratedColumn<int>(
    'daily_target',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dailyCountMeta = const VerificationMeta(
    'dailyCount',
  );
  @override
  late final GeneratedColumn<int> dailyCount = GeneratedColumn<int>(
    'daily_count',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    zekr,
    count,
    date,
    dailyTarget,
    dailyCount,
  ];
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
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    }
    if (data.containsKey('daily_target')) {
      context.handle(
        _dailyTargetMeta,
        dailyTarget.isAcceptableOrUnknown(
          data['daily_target']!,
          _dailyTargetMeta,
        ),
      );
    }
    if (data.containsKey('daily_count')) {
      context.handle(
        _dailyCountMeta,
        dailyCount.isAcceptableOrUnknown(data['daily_count']!, _dailyCountMeta),
      );
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
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      ),
      dailyTarget: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}daily_target'],
      ),
      dailyCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}daily_count'],
      ),
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
  final DateTime? date;
  final int? dailyTarget;
  final int? dailyCount;
  const Tasbih({
    required this.zekr,
    required this.count,
    this.date,
    this.dailyTarget,
    this.dailyCount,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['zekr'] = Variable<String>(zekr);
    map['count'] = Variable<int>(count);
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<DateTime>(date);
    }
    if (!nullToAbsent || dailyTarget != null) {
      map['daily_target'] = Variable<int>(dailyTarget);
    }
    if (!nullToAbsent || dailyCount != null) {
      map['daily_count'] = Variable<int>(dailyCount);
    }
    return map;
  }

  TasbihsCompanion toCompanion(bool nullToAbsent) {
    return TasbihsCompanion(
      zekr: Value(zekr),
      count: Value(count),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      dailyTarget: dailyTarget == null && nullToAbsent
          ? const Value.absent()
          : Value(dailyTarget),
      dailyCount: dailyCount == null && nullToAbsent
          ? const Value.absent()
          : Value(dailyCount),
    );
  }

  factory Tasbih.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Tasbih(
      zekr: serializer.fromJson<String>(json['zekr']),
      count: serializer.fromJson<int>(json['count']),
      date: serializer.fromJson<DateTime?>(json['date']),
      dailyTarget: serializer.fromJson<int?>(json['dailyTarget']),
      dailyCount: serializer.fromJson<int?>(json['dailyCount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'zekr': serializer.toJson<String>(zekr),
      'count': serializer.toJson<int>(count),
      'date': serializer.toJson<DateTime?>(date),
      'dailyTarget': serializer.toJson<int?>(dailyTarget),
      'dailyCount': serializer.toJson<int?>(dailyCount),
    };
  }

  Tasbih copyWith({
    String? zekr,
    int? count,
    Value<DateTime?> date = const Value.absent(),
    Value<int?> dailyTarget = const Value.absent(),
    Value<int?> dailyCount = const Value.absent(),
  }) => Tasbih(
    zekr: zekr ?? this.zekr,
    count: count ?? this.count,
    date: date.present ? date.value : this.date,
    dailyTarget: dailyTarget.present ? dailyTarget.value : this.dailyTarget,
    dailyCount: dailyCount.present ? dailyCount.value : this.dailyCount,
  );
  Tasbih copyWithCompanion(TasbihsCompanion data) {
    return Tasbih(
      zekr: data.zekr.present ? data.zekr.value : this.zekr,
      count: data.count.present ? data.count.value : this.count,
      date: data.date.present ? data.date.value : this.date,
      dailyTarget: data.dailyTarget.present
          ? data.dailyTarget.value
          : this.dailyTarget,
      dailyCount: data.dailyCount.present
          ? data.dailyCount.value
          : this.dailyCount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Tasbih(')
          ..write('zekr: $zekr, ')
          ..write('count: $count, ')
          ..write('date: $date, ')
          ..write('dailyTarget: $dailyTarget, ')
          ..write('dailyCount: $dailyCount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(zekr, count, date, dailyTarget, dailyCount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Tasbih &&
          other.zekr == this.zekr &&
          other.count == this.count &&
          other.date == this.date &&
          other.dailyTarget == this.dailyTarget &&
          other.dailyCount == this.dailyCount);
}

class TasbihsCompanion extends UpdateCompanion<Tasbih> {
  final Value<String> zekr;
  final Value<int> count;
  final Value<DateTime?> date;
  final Value<int?> dailyTarget;
  final Value<int?> dailyCount;
  final Value<int> rowid;
  const TasbihsCompanion({
    this.zekr = const Value.absent(),
    this.count = const Value.absent(),
    this.date = const Value.absent(),
    this.dailyTarget = const Value.absent(),
    this.dailyCount = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TasbihsCompanion.insert({
    required String zekr,
    required int count,
    this.date = const Value.absent(),
    this.dailyTarget = const Value.absent(),
    this.dailyCount = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : zekr = Value(zekr),
       count = Value(count);
  static Insertable<Tasbih> custom({
    Expression<String>? zekr,
    Expression<int>? count,
    Expression<DateTime>? date,
    Expression<int>? dailyTarget,
    Expression<int>? dailyCount,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (zekr != null) 'zekr': zekr,
      if (count != null) 'count': count,
      if (date != null) 'date': date,
      if (dailyTarget != null) 'daily_target': dailyTarget,
      if (dailyCount != null) 'daily_count': dailyCount,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TasbihsCompanion copyWith({
    Value<String>? zekr,
    Value<int>? count,
    Value<DateTime?>? date,
    Value<int?>? dailyTarget,
    Value<int?>? dailyCount,
    Value<int>? rowid,
  }) {
    return TasbihsCompanion(
      zekr: zekr ?? this.zekr,
      count: count ?? this.count,
      date: date ?? this.date,
      dailyTarget: dailyTarget ?? this.dailyTarget,
      dailyCount: dailyCount ?? this.dailyCount,
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
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (dailyTarget.present) {
      map['daily_target'] = Variable<int>(dailyTarget.value);
    }
    if (dailyCount.present) {
      map['daily_count'] = Variable<int>(dailyCount.value);
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
          ..write('date: $date, ')
          ..write('dailyTarget: $dailyTarget, ')
          ..write('dailyCount: $dailyCount, ')
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
      Value<DateTime?> date,
      Value<int?> dailyTarget,
      Value<int?> dailyCount,
      Value<int> rowid,
    });
typedef $$TasbihsTableUpdateCompanionBuilder =
    TasbihsCompanion Function({
      Value<String> zekr,
      Value<int> count,
      Value<DateTime?> date,
      Value<int?> dailyTarget,
      Value<int?> dailyCount,
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

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dailyTarget => $composableBuilder(
    column: $table.dailyTarget,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dailyCount => $composableBuilder(
    column: $table.dailyCount,
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

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dailyTarget => $composableBuilder(
    column: $table.dailyTarget,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dailyCount => $composableBuilder(
    column: $table.dailyCount,
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

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get dailyTarget => $composableBuilder(
    column: $table.dailyTarget,
    builder: (column) => column,
  );

  GeneratedColumn<int> get dailyCount => $composableBuilder(
    column: $table.dailyCount,
    builder: (column) => column,
  );
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
                Value<DateTime?> date = const Value.absent(),
                Value<int?> dailyTarget = const Value.absent(),
                Value<int?> dailyCount = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TasbihsCompanion(
                zekr: zekr,
                count: count,
                date: date,
                dailyTarget: dailyTarget,
                dailyCount: dailyCount,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String zekr,
                required int count,
                Value<DateTime?> date = const Value.absent(),
                Value<int?> dailyTarget = const Value.absent(),
                Value<int?> dailyCount = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TasbihsCompanion.insert(
                zekr: zekr,
                count: count,
                date: date,
                dailyTarget: dailyTarget,
                dailyCount: dailyCount,
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
