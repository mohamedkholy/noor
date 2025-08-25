// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hadith_database.dart';

// ignore_for_file: type=lint
class $HadithsTable extends Hadiths with TableInfo<$HadithsTable, Hadith> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HadithsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _numberMeta = const VerificationMeta('number');
  @override
  late final GeneratedColumn<int> number = GeneratedColumn<int>(
    'number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _kitabMeta = const VerificationMeta('kitab');
  @override
  late final GeneratedColumn<String> kitab = GeneratedColumn<String>(
    'kitab',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _arabMeta = const VerificationMeta('arab');
  @override
  late final GeneratedColumn<String> arab = GeneratedColumn<String>(
    'arab',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _terjemahMeta = const VerificationMeta(
    'terjemah',
  );
  @override
  late final GeneratedColumn<String> terjemah = GeneratedColumn<String>(
    'terjemah',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [number, kitab, arab, terjemah];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'hadiths';
  @override
  VerificationContext validateIntegrity(
    Insertable<Hadith> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('number')) {
      context.handle(
        _numberMeta,
        number.isAcceptableOrUnknown(data['number']!, _numberMeta),
      );
    } else if (isInserting) {
      context.missing(_numberMeta);
    }
    if (data.containsKey('kitab')) {
      context.handle(
        _kitabMeta,
        kitab.isAcceptableOrUnknown(data['kitab']!, _kitabMeta),
      );
    } else if (isInserting) {
      context.missing(_kitabMeta);
    }
    if (data.containsKey('arab')) {
      context.handle(
        _arabMeta,
        arab.isAcceptableOrUnknown(data['arab']!, _arabMeta),
      );
    } else if (isInserting) {
      context.missing(_arabMeta);
    }
    if (data.containsKey('terjemah')) {
      context.handle(
        _terjemahMeta,
        terjemah.isAcceptableOrUnknown(data['terjemah']!, _terjemahMeta),
      );
    } else if (isInserting) {
      context.missing(_terjemahMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {number, kitab};
  @override
  Hadith map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Hadith(
      number: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}number'],
      )!,
      kitab: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kitab'],
      )!,
      arab: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}arab'],
      )!,
      terjemah: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}terjemah'],
      )!,
    );
  }

  @override
  $HadithsTable createAlias(String alias) {
    return $HadithsTable(attachedDatabase, alias);
  }
}

class Hadith extends DataClass implements Insertable<Hadith> {
  final int number;
  final String kitab;
  final String arab;
  final String terjemah;
  const Hadith({
    required this.number,
    required this.kitab,
    required this.arab,
    required this.terjemah,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['number'] = Variable<int>(number);
    map['kitab'] = Variable<String>(kitab);
    map['arab'] = Variable<String>(arab);
    map['terjemah'] = Variable<String>(terjemah);
    return map;
  }

  HadithsCompanion toCompanion(bool nullToAbsent) {
    return HadithsCompanion(
      number: Value(number),
      kitab: Value(kitab),
      arab: Value(arab),
      terjemah: Value(terjemah),
    );
  }

  factory Hadith.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Hadith(
      number: serializer.fromJson<int>(json['number']),
      kitab: serializer.fromJson<String>(json['kitab']),
      arab: serializer.fromJson<String>(json['arab']),
      terjemah: serializer.fromJson<String>(json['terjemah']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'number': serializer.toJson<int>(number),
      'kitab': serializer.toJson<String>(kitab),
      'arab': serializer.toJson<String>(arab),
      'terjemah': serializer.toJson<String>(terjemah),
    };
  }

  Hadith copyWith({
    int? number,
    String? kitab,
    String? arab,
    String? terjemah,
  }) => Hadith(
    number: number ?? this.number,
    kitab: kitab ?? this.kitab,
    arab: arab ?? this.arab,
    terjemah: terjemah ?? this.terjemah,
  );
  Hadith copyWithCompanion(HadithsCompanion data) {
    return Hadith(
      number: data.number.present ? data.number.value : this.number,
      kitab: data.kitab.present ? data.kitab.value : this.kitab,
      arab: data.arab.present ? data.arab.value : this.arab,
      terjemah: data.terjemah.present ? data.terjemah.value : this.terjemah,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Hadith(')
          ..write('number: $number, ')
          ..write('kitab: $kitab, ')
          ..write('arab: $arab, ')
          ..write('terjemah: $terjemah')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(number, kitab, arab, terjemah);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Hadith &&
          other.number == this.number &&
          other.kitab == this.kitab &&
          other.arab == this.arab &&
          other.terjemah == this.terjemah);
}

class HadithsCompanion extends UpdateCompanion<Hadith> {
  final Value<int> number;
  final Value<String> kitab;
  final Value<String> arab;
  final Value<String> terjemah;
  final Value<int> rowid;
  const HadithsCompanion({
    this.number = const Value.absent(),
    this.kitab = const Value.absent(),
    this.arab = const Value.absent(),
    this.terjemah = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HadithsCompanion.insert({
    required int number,
    required String kitab,
    required String arab,
    required String terjemah,
    this.rowid = const Value.absent(),
  }) : number = Value(number),
       kitab = Value(kitab),
       arab = Value(arab),
       terjemah = Value(terjemah);
  static Insertable<Hadith> custom({
    Expression<int>? number,
    Expression<String>? kitab,
    Expression<String>? arab,
    Expression<String>? terjemah,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (number != null) 'number': number,
      if (kitab != null) 'kitab': kitab,
      if (arab != null) 'arab': arab,
      if (terjemah != null) 'terjemah': terjemah,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HadithsCompanion copyWith({
    Value<int>? number,
    Value<String>? kitab,
    Value<String>? arab,
    Value<String>? terjemah,
    Value<int>? rowid,
  }) {
    return HadithsCompanion(
      number: number ?? this.number,
      kitab: kitab ?? this.kitab,
      arab: arab ?? this.arab,
      terjemah: terjemah ?? this.terjemah,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (number.present) {
      map['number'] = Variable<int>(number.value);
    }
    if (kitab.present) {
      map['kitab'] = Variable<String>(kitab.value);
    }
    if (arab.present) {
      map['arab'] = Variable<String>(arab.value);
    }
    if (terjemah.present) {
      map['terjemah'] = Variable<String>(terjemah.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HadithsCompanion(')
          ..write('number: $number, ')
          ..write('kitab: $kitab, ')
          ..write('arab: $arab, ')
          ..write('terjemah: $terjemah, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$HadithDatabase extends GeneratedDatabase {
  _$HadithDatabase(QueryExecutor e) : super(e);
  $HadithDatabaseManager get managers => $HadithDatabaseManager(this);
  late final $HadithsTable hadiths = $HadithsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [hadiths];
}

typedef $$HadithsTableCreateCompanionBuilder =
    HadithsCompanion Function({
      required int number,
      required String kitab,
      required String arab,
      required String terjemah,
      Value<int> rowid,
    });
typedef $$HadithsTableUpdateCompanionBuilder =
    HadithsCompanion Function({
      Value<int> number,
      Value<String> kitab,
      Value<String> arab,
      Value<String> terjemah,
      Value<int> rowid,
    });

class $$HadithsTableFilterComposer
    extends Composer<_$HadithDatabase, $HadithsTable> {
  $$HadithsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get number => $composableBuilder(
    column: $table.number,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kitab => $composableBuilder(
    column: $table.kitab,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get arab => $composableBuilder(
    column: $table.arab,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get terjemah => $composableBuilder(
    column: $table.terjemah,
    builder: (column) => ColumnFilters(column),
  );
}

class $$HadithsTableOrderingComposer
    extends Composer<_$HadithDatabase, $HadithsTable> {
  $$HadithsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get number => $composableBuilder(
    column: $table.number,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kitab => $composableBuilder(
    column: $table.kitab,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get arab => $composableBuilder(
    column: $table.arab,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get terjemah => $composableBuilder(
    column: $table.terjemah,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$HadithsTableAnnotationComposer
    extends Composer<_$HadithDatabase, $HadithsTable> {
  $$HadithsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get number =>
      $composableBuilder(column: $table.number, builder: (column) => column);

  GeneratedColumn<String> get kitab =>
      $composableBuilder(column: $table.kitab, builder: (column) => column);

  GeneratedColumn<String> get arab =>
      $composableBuilder(column: $table.arab, builder: (column) => column);

  GeneratedColumn<String> get terjemah =>
      $composableBuilder(column: $table.terjemah, builder: (column) => column);
}

class $$HadithsTableTableManager
    extends
        RootTableManager<
          _$HadithDatabase,
          $HadithsTable,
          Hadith,
          $$HadithsTableFilterComposer,
          $$HadithsTableOrderingComposer,
          $$HadithsTableAnnotationComposer,
          $$HadithsTableCreateCompanionBuilder,
          $$HadithsTableUpdateCompanionBuilder,
          (Hadith, BaseReferences<_$HadithDatabase, $HadithsTable, Hadith>),
          Hadith,
          PrefetchHooks Function()
        > {
  $$HadithsTableTableManager(_$HadithDatabase db, $HadithsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HadithsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HadithsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HadithsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> number = const Value.absent(),
                Value<String> kitab = const Value.absent(),
                Value<String> arab = const Value.absent(),
                Value<String> terjemah = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HadithsCompanion(
                number: number,
                kitab: kitab,
                arab: arab,
                terjemah: terjemah,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int number,
                required String kitab,
                required String arab,
                required String terjemah,
                Value<int> rowid = const Value.absent(),
              }) => HadithsCompanion.insert(
                number: number,
                kitab: kitab,
                arab: arab,
                terjemah: terjemah,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$HadithsTableProcessedTableManager =
    ProcessedTableManager<
      _$HadithDatabase,
      $HadithsTable,
      Hadith,
      $$HadithsTableFilterComposer,
      $$HadithsTableOrderingComposer,
      $$HadithsTableAnnotationComposer,
      $$HadithsTableCreateCompanionBuilder,
      $$HadithsTableUpdateCompanionBuilder,
      (Hadith, BaseReferences<_$HadithDatabase, $HadithsTable, Hadith>),
      Hadith,
      PrefetchHooks Function()
    >;

class $HadithDatabaseManager {
  final _$HadithDatabase _db;
  $HadithDatabaseManager(this._db);
  $$HadithsTableTableManager get hadiths =>
      $$HadithsTableTableManager(_db, _db.hadiths);
}
