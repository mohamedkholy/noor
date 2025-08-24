// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'azkar_database.dart';

// ignore_for_file: type=lint
class $CategoryTable extends Category
    with TableInfo<$CategoryTable, CategoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _searchMeta = const VerificationMeta('search');
  @override
  late final GeneratedColumn<String> search = GeneratedColumn<String>(
    'search',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isFavoriteMeta = const VerificationMeta(
    'isFavorite',
  );
  @override
  late final GeneratedColumn<bool> isFavorite = GeneratedColumn<bool>(
    'is_favorite',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_favorite" IN (0, 1))',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [category, search, isFavorite];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'category';
  @override
  VerificationContext validateIntegrity(
    Insertable<CategoryData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('search')) {
      context.handle(
        _searchMeta,
        search.isAcceptableOrUnknown(data['search']!, _searchMeta),
      );
    }
    if (data.containsKey('is_favorite')) {
      context.handle(
        _isFavoriteMeta,
        isFavorite.isAcceptableOrUnknown(data['is_favorite']!, _isFavoriteMeta),
      );
    } else if (isInserting) {
      context.missing(_isFavoriteMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {category};
  @override
  CategoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryData(
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      search: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}search'],
      ),
      isFavorite: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_favorite'],
      )!,
    );
  }

  @override
  $CategoryTable createAlias(String alias) {
    return $CategoryTable(attachedDatabase, alias);
  }
}

class CategoryData extends DataClass implements Insertable<CategoryData> {
  final String category;
  final String? search;
  final bool isFavorite;
  const CategoryData({
    required this.category,
    this.search,
    required this.isFavorite,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['category'] = Variable<String>(category);
    if (!nullToAbsent || search != null) {
      map['search'] = Variable<String>(search);
    }
    map['is_favorite'] = Variable<bool>(isFavorite);
    return map;
  }

  CategoryCompanion toCompanion(bool nullToAbsent) {
    return CategoryCompanion(
      category: Value(category),
      search: search == null && nullToAbsent
          ? const Value.absent()
          : Value(search),
      isFavorite: Value(isFavorite),
    );
  }

  factory CategoryData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryData(
      category: serializer.fromJson<String>(json['category']),
      search: serializer.fromJson<String?>(json['search']),
      isFavorite: serializer.fromJson<bool>(json['isFavorite']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'category': serializer.toJson<String>(category),
      'search': serializer.toJson<String?>(search),
      'isFavorite': serializer.toJson<bool>(isFavorite),
    };
  }

  CategoryData copyWith({
    String? category,
    Value<String?> search = const Value.absent(),
    bool? isFavorite,
  }) => CategoryData(
    category: category ?? this.category,
    search: search.present ? search.value : this.search,
    isFavorite: isFavorite ?? this.isFavorite,
  );
  CategoryData copyWithCompanion(CategoryCompanion data) {
    return CategoryData(
      category: data.category.present ? data.category.value : this.category,
      search: data.search.present ? data.search.value : this.search,
      isFavorite: data.isFavorite.present
          ? data.isFavorite.value
          : this.isFavorite,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoryData(')
          ..write('category: $category, ')
          ..write('search: $search, ')
          ..write('isFavorite: $isFavorite')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(category, search, isFavorite);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryData &&
          other.category == this.category &&
          other.search == this.search &&
          other.isFavorite == this.isFavorite);
}

class CategoryCompanion extends UpdateCompanion<CategoryData> {
  final Value<String> category;
  final Value<String?> search;
  final Value<bool> isFavorite;
  final Value<int> rowid;
  const CategoryCompanion({
    this.category = const Value.absent(),
    this.search = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CategoryCompanion.insert({
    required String category,
    this.search = const Value.absent(),
    required bool isFavorite,
    this.rowid = const Value.absent(),
  }) : category = Value(category),
       isFavorite = Value(isFavorite);
  static Insertable<CategoryData> custom({
    Expression<String>? category,
    Expression<String>? search,
    Expression<bool>? isFavorite,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (category != null) 'category': category,
      if (search != null) 'search': search,
      if (isFavorite != null) 'is_favorite': isFavorite,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CategoryCompanion copyWith({
    Value<String>? category,
    Value<String?>? search,
    Value<bool>? isFavorite,
    Value<int>? rowid,
  }) {
    return CategoryCompanion(
      category: category ?? this.category,
      search: search ?? this.search,
      isFavorite: isFavorite ?? this.isFavorite,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (search.present) {
      map['search'] = Variable<String>(search.value);
    }
    if (isFavorite.present) {
      map['is_favorite'] = Variable<bool>(isFavorite.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryCompanion(')
          ..write('category: $category, ')
          ..write('search: $search, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AzkarTable extends Azkar with TableInfo<$AzkarTable, AzkarData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AzkarTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES category (category) ON UPDATE CASCADE',
    ),
  );
  static const VerificationMeta _zekrMeta = const VerificationMeta('zekr');
  @override
  late final GeneratedColumn<String> zekr = GeneratedColumn<String>(
    'zekr',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _countMeta = const VerificationMeta('count');
  @override
  late final GeneratedColumn<int> count = GeneratedColumn<int>(
    'count',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _referenceMeta = const VerificationMeta(
    'reference',
  );
  @override
  late final GeneratedColumn<String> reference = GeneratedColumn<String>(
    'reference',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _searchMeta = const VerificationMeta('search');
  @override
  late final GeneratedColumn<String> search = GeneratedColumn<String>(
    'search',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    category,
    zekr,
    description,
    count,
    reference,
    search,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'azkar';
  @override
  VerificationContext validateIntegrity(
    Insertable<AzkarData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('zekr')) {
      context.handle(
        _zekrMeta,
        zekr.isAcceptableOrUnknown(data['zekr']!, _zekrMeta),
      );
    } else if (isInserting) {
      context.missing(_zekrMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('count')) {
      context.handle(
        _countMeta,
        count.isAcceptableOrUnknown(data['count']!, _countMeta),
      );
    }
    if (data.containsKey('reference')) {
      context.handle(
        _referenceMeta,
        reference.isAcceptableOrUnknown(data['reference']!, _referenceMeta),
      );
    }
    if (data.containsKey('search')) {
      context.handle(
        _searchMeta,
        search.isAcceptableOrUnknown(data['search']!, _searchMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  AzkarData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AzkarData(
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      zekr: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}zekr'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      count: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}count'],
      ),
      reference: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reference'],
      ),
      search: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}search'],
      ),
    );
  }

  @override
  $AzkarTable createAlias(String alias) {
    return $AzkarTable(attachedDatabase, alias);
  }
}

class AzkarData extends DataClass implements Insertable<AzkarData> {
  final String category;
  final String zekr;
  final String? description;
  final int? count;
  final String? reference;
  final String? search;
  const AzkarData({
    required this.category,
    required this.zekr,
    this.description,
    this.count,
    this.reference,
    this.search,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['category'] = Variable<String>(category);
    map['zekr'] = Variable<String>(zekr);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || count != null) {
      map['count'] = Variable<int>(count);
    }
    if (!nullToAbsent || reference != null) {
      map['reference'] = Variable<String>(reference);
    }
    if (!nullToAbsent || search != null) {
      map['search'] = Variable<String>(search);
    }
    return map;
  }

  AzkarCompanion toCompanion(bool nullToAbsent) {
    return AzkarCompanion(
      category: Value(category),
      zekr: Value(zekr),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      count: count == null && nullToAbsent
          ? const Value.absent()
          : Value(count),
      reference: reference == null && nullToAbsent
          ? const Value.absent()
          : Value(reference),
      search: search == null && nullToAbsent
          ? const Value.absent()
          : Value(search),
    );
  }

  factory AzkarData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AzkarData(
      category: serializer.fromJson<String>(json['category']),
      zekr: serializer.fromJson<String>(json['zekr']),
      description: serializer.fromJson<String?>(json['description']),
      count: serializer.fromJson<int?>(json['count']),
      reference: serializer.fromJson<String?>(json['reference']),
      search: serializer.fromJson<String?>(json['search']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'category': serializer.toJson<String>(category),
      'zekr': serializer.toJson<String>(zekr),
      'description': serializer.toJson<String?>(description),
      'count': serializer.toJson<int?>(count),
      'reference': serializer.toJson<String?>(reference),
      'search': serializer.toJson<String?>(search),
    };
  }

  AzkarData copyWith({
    String? category,
    String? zekr,
    Value<String?> description = const Value.absent(),
    Value<int?> count = const Value.absent(),
    Value<String?> reference = const Value.absent(),
    Value<String?> search = const Value.absent(),
  }) => AzkarData(
    category: category ?? this.category,
    zekr: zekr ?? this.zekr,
    description: description.present ? description.value : this.description,
    count: count.present ? count.value : this.count,
    reference: reference.present ? reference.value : this.reference,
    search: search.present ? search.value : this.search,
  );
  AzkarData copyWithCompanion(AzkarCompanion data) {
    return AzkarData(
      category: data.category.present ? data.category.value : this.category,
      zekr: data.zekr.present ? data.zekr.value : this.zekr,
      description: data.description.present
          ? data.description.value
          : this.description,
      count: data.count.present ? data.count.value : this.count,
      reference: data.reference.present ? data.reference.value : this.reference,
      search: data.search.present ? data.search.value : this.search,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AzkarData(')
          ..write('category: $category, ')
          ..write('zekr: $zekr, ')
          ..write('description: $description, ')
          ..write('count: $count, ')
          ..write('reference: $reference, ')
          ..write('search: $search')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(category, zekr, description, count, reference, search);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AzkarData &&
          other.category == this.category &&
          other.zekr == this.zekr &&
          other.description == this.description &&
          other.count == this.count &&
          other.reference == this.reference &&
          other.search == this.search);
}

class AzkarCompanion extends UpdateCompanion<AzkarData> {
  final Value<String> category;
  final Value<String> zekr;
  final Value<String?> description;
  final Value<int?> count;
  final Value<String?> reference;
  final Value<String?> search;
  final Value<int> rowid;
  const AzkarCompanion({
    this.category = const Value.absent(),
    this.zekr = const Value.absent(),
    this.description = const Value.absent(),
    this.count = const Value.absent(),
    this.reference = const Value.absent(),
    this.search = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AzkarCompanion.insert({
    required String category,
    required String zekr,
    this.description = const Value.absent(),
    this.count = const Value.absent(),
    this.reference = const Value.absent(),
    this.search = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : category = Value(category),
       zekr = Value(zekr);
  static Insertable<AzkarData> custom({
    Expression<String>? category,
    Expression<String>? zekr,
    Expression<String>? description,
    Expression<int>? count,
    Expression<String>? reference,
    Expression<String>? search,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (category != null) 'category': category,
      if (zekr != null) 'zekr': zekr,
      if (description != null) 'description': description,
      if (count != null) 'count': count,
      if (reference != null) 'reference': reference,
      if (search != null) 'search': search,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AzkarCompanion copyWith({
    Value<String>? category,
    Value<String>? zekr,
    Value<String?>? description,
    Value<int?>? count,
    Value<String?>? reference,
    Value<String?>? search,
    Value<int>? rowid,
  }) {
    return AzkarCompanion(
      category: category ?? this.category,
      zekr: zekr ?? this.zekr,
      description: description ?? this.description,
      count: count ?? this.count,
      reference: reference ?? this.reference,
      search: search ?? this.search,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (zekr.present) {
      map['zekr'] = Variable<String>(zekr.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (count.present) {
      map['count'] = Variable<int>(count.value);
    }
    if (reference.present) {
      map['reference'] = Variable<String>(reference.value);
    }
    if (search.present) {
      map['search'] = Variable<String>(search.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AzkarCompanion(')
          ..write('category: $category, ')
          ..write('zekr: $zekr, ')
          ..write('description: $description, ')
          ..write('count: $count, ')
          ..write('reference: $reference, ')
          ..write('search: $search, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AzkarDatabase extends GeneratedDatabase {
  _$AzkarDatabase(QueryExecutor e) : super(e);
  $AzkarDatabaseManager get managers => $AzkarDatabaseManager(this);
  late final $CategoryTable category = $CategoryTable(this);
  late final $AzkarTable azkar = $AzkarTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [category, azkar];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'category',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [TableUpdate('azkar', kind: UpdateKind.update)],
    ),
  ]);
}

typedef $$CategoryTableCreateCompanionBuilder =
    CategoryCompanion Function({
      required String category,
      Value<String?> search,
      required bool isFavorite,
      Value<int> rowid,
    });
typedef $$CategoryTableUpdateCompanionBuilder =
    CategoryCompanion Function({
      Value<String> category,
      Value<String?> search,
      Value<bool> isFavorite,
      Value<int> rowid,
    });

final class $$CategoryTableReferences
    extends BaseReferences<_$AzkarDatabase, $CategoryTable, CategoryData> {
  $$CategoryTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$AzkarTable, List<AzkarData>> _azkarRefsTable(
    _$AzkarDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.azkar,
    aliasName: $_aliasNameGenerator(db.category.category, db.azkar.category),
  );

  $$AzkarTableProcessedTableManager get azkarRefs {
    final manager = $$AzkarTableTableManager($_db, $_db.azkar).filter(
      (f) => f.category.category.sqlEquals($_itemColumn<String>('category')!),
    );

    final cache = $_typedResult.readTableOrNull(_azkarRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CategoryTableFilterComposer
    extends Composer<_$AzkarDatabase, $CategoryTable> {
  $$CategoryTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get search => $composableBuilder(
    column: $table.search,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> azkarRefs(
    Expression<bool> Function($$AzkarTableFilterComposer f) f,
  ) {
    final $$AzkarTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.category,
      referencedTable: $db.azkar,
      getReferencedColumn: (t) => t.category,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AzkarTableFilterComposer(
            $db: $db,
            $table: $db.azkar,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CategoryTableOrderingComposer
    extends Composer<_$AzkarDatabase, $CategoryTable> {
  $$CategoryTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get search => $composableBuilder(
    column: $table.search,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CategoryTableAnnotationComposer
    extends Composer<_$AzkarDatabase, $CategoryTable> {
  $$CategoryTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get search =>
      $composableBuilder(column: $table.search, builder: (column) => column);

  GeneratedColumn<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => column,
  );

  Expression<T> azkarRefs<T extends Object>(
    Expression<T> Function($$AzkarTableAnnotationComposer a) f,
  ) {
    final $$AzkarTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.category,
      referencedTable: $db.azkar,
      getReferencedColumn: (t) => t.category,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AzkarTableAnnotationComposer(
            $db: $db,
            $table: $db.azkar,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CategoryTableTableManager
    extends
        RootTableManager<
          _$AzkarDatabase,
          $CategoryTable,
          CategoryData,
          $$CategoryTableFilterComposer,
          $$CategoryTableOrderingComposer,
          $$CategoryTableAnnotationComposer,
          $$CategoryTableCreateCompanionBuilder,
          $$CategoryTableUpdateCompanionBuilder,
          (CategoryData, $$CategoryTableReferences),
          CategoryData,
          PrefetchHooks Function({bool azkarRefs})
        > {
  $$CategoryTableTableManager(_$AzkarDatabase db, $CategoryTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoryTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoryTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoryTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> category = const Value.absent(),
                Value<String?> search = const Value.absent(),
                Value<bool> isFavorite = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CategoryCompanion(
                category: category,
                search: search,
                isFavorite: isFavorite,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String category,
                Value<String?> search = const Value.absent(),
                required bool isFavorite,
                Value<int> rowid = const Value.absent(),
              }) => CategoryCompanion.insert(
                category: category,
                search: search,
                isFavorite: isFavorite,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CategoryTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({azkarRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (azkarRefs) db.azkar],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (azkarRefs)
                    await $_getPrefetchedData<
                      CategoryData,
                      $CategoryTable,
                      AzkarData
                    >(
                      currentTable: table,
                      referencedTable: $$CategoryTableReferences
                          ._azkarRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$CategoryTableReferences(db, table, p0).azkarRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.category == item.category,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CategoryTableProcessedTableManager =
    ProcessedTableManager<
      _$AzkarDatabase,
      $CategoryTable,
      CategoryData,
      $$CategoryTableFilterComposer,
      $$CategoryTableOrderingComposer,
      $$CategoryTableAnnotationComposer,
      $$CategoryTableCreateCompanionBuilder,
      $$CategoryTableUpdateCompanionBuilder,
      (CategoryData, $$CategoryTableReferences),
      CategoryData,
      PrefetchHooks Function({bool azkarRefs})
    >;
typedef $$AzkarTableCreateCompanionBuilder =
    AzkarCompanion Function({
      required String category,
      required String zekr,
      Value<String?> description,
      Value<int?> count,
      Value<String?> reference,
      Value<String?> search,
      Value<int> rowid,
    });
typedef $$AzkarTableUpdateCompanionBuilder =
    AzkarCompanion Function({
      Value<String> category,
      Value<String> zekr,
      Value<String?> description,
      Value<int?> count,
      Value<String?> reference,
      Value<String?> search,
      Value<int> rowid,
    });

final class $$AzkarTableReferences
    extends BaseReferences<_$AzkarDatabase, $AzkarTable, AzkarData> {
  $$AzkarTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CategoryTable _categoryTable(_$AzkarDatabase db) =>
      db.category.createAlias(
        $_aliasNameGenerator(db.azkar.category, db.category.category),
      );

  $$CategoryTableProcessedTableManager get category {
    final $_column = $_itemColumn<String>('category')!;

    final manager = $$CategoryTableTableManager(
      $_db,
      $_db.category,
    ).filter((f) => f.category.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AzkarTableFilterComposer
    extends Composer<_$AzkarDatabase, $AzkarTable> {
  $$AzkarTableFilterComposer({
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

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get count => $composableBuilder(
    column: $table.count,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reference => $composableBuilder(
    column: $table.reference,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get search => $composableBuilder(
    column: $table.search,
    builder: (column) => ColumnFilters(column),
  );

  $$CategoryTableFilterComposer get category {
    final $$CategoryTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.category,
      referencedTable: $db.category,
      getReferencedColumn: (t) => t.category,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoryTableFilterComposer(
            $db: $db,
            $table: $db.category,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AzkarTableOrderingComposer
    extends Composer<_$AzkarDatabase, $AzkarTable> {
  $$AzkarTableOrderingComposer({
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

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get count => $composableBuilder(
    column: $table.count,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reference => $composableBuilder(
    column: $table.reference,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get search => $composableBuilder(
    column: $table.search,
    builder: (column) => ColumnOrderings(column),
  );

  $$CategoryTableOrderingComposer get category {
    final $$CategoryTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.category,
      referencedTable: $db.category,
      getReferencedColumn: (t) => t.category,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoryTableOrderingComposer(
            $db: $db,
            $table: $db.category,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AzkarTableAnnotationComposer
    extends Composer<_$AzkarDatabase, $AzkarTable> {
  $$AzkarTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get zekr =>
      $composableBuilder(column: $table.zekr, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<int> get count =>
      $composableBuilder(column: $table.count, builder: (column) => column);

  GeneratedColumn<String> get reference =>
      $composableBuilder(column: $table.reference, builder: (column) => column);

  GeneratedColumn<String> get search =>
      $composableBuilder(column: $table.search, builder: (column) => column);

  $$CategoryTableAnnotationComposer get category {
    final $$CategoryTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.category,
      referencedTable: $db.category,
      getReferencedColumn: (t) => t.category,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoryTableAnnotationComposer(
            $db: $db,
            $table: $db.category,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AzkarTableTableManager
    extends
        RootTableManager<
          _$AzkarDatabase,
          $AzkarTable,
          AzkarData,
          $$AzkarTableFilterComposer,
          $$AzkarTableOrderingComposer,
          $$AzkarTableAnnotationComposer,
          $$AzkarTableCreateCompanionBuilder,
          $$AzkarTableUpdateCompanionBuilder,
          (AzkarData, $$AzkarTableReferences),
          AzkarData,
          PrefetchHooks Function({bool category})
        > {
  $$AzkarTableTableManager(_$AzkarDatabase db, $AzkarTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AzkarTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AzkarTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AzkarTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> category = const Value.absent(),
                Value<String> zekr = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<int?> count = const Value.absent(),
                Value<String?> reference = const Value.absent(),
                Value<String?> search = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AzkarCompanion(
                category: category,
                zekr: zekr,
                description: description,
                count: count,
                reference: reference,
                search: search,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String category,
                required String zekr,
                Value<String?> description = const Value.absent(),
                Value<int?> count = const Value.absent(),
                Value<String?> reference = const Value.absent(),
                Value<String?> search = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AzkarCompanion.insert(
                category: category,
                zekr: zekr,
                description: description,
                count: count,
                reference: reference,
                search: search,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$AzkarTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({category = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (category) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.category,
                                referencedTable: $$AzkarTableReferences
                                    ._categoryTable(db),
                                referencedColumn: $$AzkarTableReferences
                                    ._categoryTable(db)
                                    .category,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$AzkarTableProcessedTableManager =
    ProcessedTableManager<
      _$AzkarDatabase,
      $AzkarTable,
      AzkarData,
      $$AzkarTableFilterComposer,
      $$AzkarTableOrderingComposer,
      $$AzkarTableAnnotationComposer,
      $$AzkarTableCreateCompanionBuilder,
      $$AzkarTableUpdateCompanionBuilder,
      (AzkarData, $$AzkarTableReferences),
      AzkarData,
      PrefetchHooks Function({bool category})
    >;

class $AzkarDatabaseManager {
  final _$AzkarDatabase _db;
  $AzkarDatabaseManager(this._db);
  $$CategoryTableTableManager get category =>
      $$CategoryTableTableManager(_db, _db.category);
  $$AzkarTableTableManager get azkar =>
      $$AzkarTableTableManager(_db, _db.azkar);
}
