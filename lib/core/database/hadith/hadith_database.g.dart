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

class $DailyHadithsTable extends DailyHadiths
    with TableInfo<$DailyHadithsTable, DailyHadith> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DailyHadithsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _dayMeta = const VerificationMeta('day');
  @override
  late final GeneratedColumn<int> day = GeneratedColumn<int>(
    'day',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _kitabNameMeta = const VerificationMeta(
    'kitabName',
  );
  @override
  late final GeneratedColumn<String> kitabName = GeneratedColumn<String>(
    'kitab_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _numberMeta = const VerificationMeta('number');
  @override
  late final GeneratedColumn<int> number = GeneratedColumn<int>(
    'number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [day, kitabName, number];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'daily_hadiths';
  @override
  VerificationContext validateIntegrity(
    Insertable<DailyHadith> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('day')) {
      context.handle(
        _dayMeta,
        day.isAcceptableOrUnknown(data['day']!, _dayMeta),
      );
    } else if (isInserting) {
      context.missing(_dayMeta);
    }
    if (data.containsKey('kitab_name')) {
      context.handle(
        _kitabNameMeta,
        kitabName.isAcceptableOrUnknown(data['kitab_name']!, _kitabNameMeta),
      );
    } else if (isInserting) {
      context.missing(_kitabNameMeta);
    }
    if (data.containsKey('number')) {
      context.handle(
        _numberMeta,
        number.isAcceptableOrUnknown(data['number']!, _numberMeta),
      );
    } else if (isInserting) {
      context.missing(_numberMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {day, number};
  @override
  DailyHadith map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DailyHadith(
      day: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}day'],
      )!,
      kitabName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kitab_name'],
      )!,
      number: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}number'],
      )!,
    );
  }

  @override
  $DailyHadithsTable createAlias(String alias) {
    return $DailyHadithsTable(attachedDatabase, alias);
  }
}

class DailyHadith extends DataClass implements Insertable<DailyHadith> {
  final int day;
  final String kitabName;
  final int number;
  const DailyHadith({
    required this.day,
    required this.kitabName,
    required this.number,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['day'] = Variable<int>(day);
    map['kitab_name'] = Variable<String>(kitabName);
    map['number'] = Variable<int>(number);
    return map;
  }

  DailyHadithsCompanion toCompanion(bool nullToAbsent) {
    return DailyHadithsCompanion(
      day: Value(day),
      kitabName: Value(kitabName),
      number: Value(number),
    );
  }

  factory DailyHadith.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DailyHadith(
      day: serializer.fromJson<int>(json['day']),
      kitabName: serializer.fromJson<String>(json['kitabName']),
      number: serializer.fromJson<int>(json['number']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'day': serializer.toJson<int>(day),
      'kitabName': serializer.toJson<String>(kitabName),
      'number': serializer.toJson<int>(number),
    };
  }

  DailyHadith copyWith({int? day, String? kitabName, int? number}) =>
      DailyHadith(
        day: day ?? this.day,
        kitabName: kitabName ?? this.kitabName,
        number: number ?? this.number,
      );
  DailyHadith copyWithCompanion(DailyHadithsCompanion data) {
    return DailyHadith(
      day: data.day.present ? data.day.value : this.day,
      kitabName: data.kitabName.present ? data.kitabName.value : this.kitabName,
      number: data.number.present ? data.number.value : this.number,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DailyHadith(')
          ..write('day: $day, ')
          ..write('kitabName: $kitabName, ')
          ..write('number: $number')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(day, kitabName, number);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DailyHadith &&
          other.day == this.day &&
          other.kitabName == this.kitabName &&
          other.number == this.number);
}

class DailyHadithsCompanion extends UpdateCompanion<DailyHadith> {
  final Value<int> day;
  final Value<String> kitabName;
  final Value<int> number;
  final Value<int> rowid;
  const DailyHadithsCompanion({
    this.day = const Value.absent(),
    this.kitabName = const Value.absent(),
    this.number = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DailyHadithsCompanion.insert({
    required int day,
    required String kitabName,
    required int number,
    this.rowid = const Value.absent(),
  }) : day = Value(day),
       kitabName = Value(kitabName),
       number = Value(number);
  static Insertable<DailyHadith> custom({
    Expression<int>? day,
    Expression<String>? kitabName,
    Expression<int>? number,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (day != null) 'day': day,
      if (kitabName != null) 'kitab_name': kitabName,
      if (number != null) 'number': number,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DailyHadithsCompanion copyWith({
    Value<int>? day,
    Value<String>? kitabName,
    Value<int>? number,
    Value<int>? rowid,
  }) {
    return DailyHadithsCompanion(
      day: day ?? this.day,
      kitabName: kitabName ?? this.kitabName,
      number: number ?? this.number,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (day.present) {
      map['day'] = Variable<int>(day.value);
    }
    if (kitabName.present) {
      map['kitab_name'] = Variable<String>(kitabName.value);
    }
    if (number.present) {
      map['number'] = Variable<int>(number.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DailyHadithsCompanion(')
          ..write('day: $day, ')
          ..write('kitabName: $kitabName, ')
          ..write('number: $number, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$HadithDatabase extends GeneratedDatabase {
  _$HadithDatabase(QueryExecutor e) : super(e);
  $HadithDatabaseManager get managers => $HadithDatabaseManager(this);
  late final $HadithsTable hadiths = $HadithsTable(this);
  late final $DailyHadithsTable dailyHadiths = $DailyHadithsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [hadiths, dailyHadiths];
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
typedef $$DailyHadithsTableCreateCompanionBuilder =
    DailyHadithsCompanion Function({
      required int day,
      required String kitabName,
      required int number,
      Value<int> rowid,
    });
typedef $$DailyHadithsTableUpdateCompanionBuilder =
    DailyHadithsCompanion Function({
      Value<int> day,
      Value<String> kitabName,
      Value<int> number,
      Value<int> rowid,
    });

class $$DailyHadithsTableFilterComposer
    extends Composer<_$HadithDatabase, $DailyHadithsTable> {
  $$DailyHadithsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get day => $composableBuilder(
    column: $table.day,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kitabName => $composableBuilder(
    column: $table.kitabName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get number => $composableBuilder(
    column: $table.number,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DailyHadithsTableOrderingComposer
    extends Composer<_$HadithDatabase, $DailyHadithsTable> {
  $$DailyHadithsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get day => $composableBuilder(
    column: $table.day,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kitabName => $composableBuilder(
    column: $table.kitabName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get number => $composableBuilder(
    column: $table.number,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DailyHadithsTableAnnotationComposer
    extends Composer<_$HadithDatabase, $DailyHadithsTable> {
  $$DailyHadithsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get day =>
      $composableBuilder(column: $table.day, builder: (column) => column);

  GeneratedColumn<String> get kitabName =>
      $composableBuilder(column: $table.kitabName, builder: (column) => column);

  GeneratedColumn<int> get number =>
      $composableBuilder(column: $table.number, builder: (column) => column);
}

class $$DailyHadithsTableTableManager
    extends
        RootTableManager<
          _$HadithDatabase,
          $DailyHadithsTable,
          DailyHadith,
          $$DailyHadithsTableFilterComposer,
          $$DailyHadithsTableOrderingComposer,
          $$DailyHadithsTableAnnotationComposer,
          $$DailyHadithsTableCreateCompanionBuilder,
          $$DailyHadithsTableUpdateCompanionBuilder,
          (
            DailyHadith,
            BaseReferences<_$HadithDatabase, $DailyHadithsTable, DailyHadith>,
          ),
          DailyHadith,
          PrefetchHooks Function()
        > {
  $$DailyHadithsTableTableManager(_$HadithDatabase db, $DailyHadithsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DailyHadithsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DailyHadithsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DailyHadithsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> day = const Value.absent(),
                Value<String> kitabName = const Value.absent(),
                Value<int> number = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DailyHadithsCompanion(
                day: day,
                kitabName: kitabName,
                number: number,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int day,
                required String kitabName,
                required int number,
                Value<int> rowid = const Value.absent(),
              }) => DailyHadithsCompanion.insert(
                day: day,
                kitabName: kitabName,
                number: number,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DailyHadithsTableProcessedTableManager =
    ProcessedTableManager<
      _$HadithDatabase,
      $DailyHadithsTable,
      DailyHadith,
      $$DailyHadithsTableFilterComposer,
      $$DailyHadithsTableOrderingComposer,
      $$DailyHadithsTableAnnotationComposer,
      $$DailyHadithsTableCreateCompanionBuilder,
      $$DailyHadithsTableUpdateCompanionBuilder,
      (
        DailyHadith,
        BaseReferences<_$HadithDatabase, $DailyHadithsTable, DailyHadith>,
      ),
      DailyHadith,
      PrefetchHooks Function()
    >;

class $HadithDatabaseManager {
  final _$HadithDatabase _db;
  $HadithDatabaseManager(this._db);
  $$HadithsTableTableManager get hadiths =>
      $$HadithsTableTableManager(_db, _db.hadiths);
  $$DailyHadithsTableTableManager get dailyHadiths =>
      $$DailyHadithsTableTableManager(_db, _db.dailyHadiths);
}
