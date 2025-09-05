// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cities_database.dart';

// ignore_for_file: type=lint
class $CitiesTable extends Cities with TableInfo<$CitiesTable, City> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CitiesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _searchNamesMeta = const VerificationMeta(
    'searchNames',
  );
  @override
  late final GeneratedColumn<String> searchNames = GeneratedColumn<String>(
    'search_names',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _latMeta = const VerificationMeta('lat');
  @override
  late final GeneratedColumn<double> lat = GeneratedColumn<double>(
    'lat',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lngMeta = const VerificationMeta('lng');
  @override
  late final GeneratedColumn<double> lng = GeneratedColumn<double>(
    'lng',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _countryMeta = const VerificationMeta(
    'country',
  );
  @override
  late final GeneratedColumn<String> country = GeneratedColumn<String>(
    'country',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [name, searchNames, lat, lng, country];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cities';
  @override
  VerificationContext validateIntegrity(
    Insertable<City> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('search_names')) {
      context.handle(
        _searchNamesMeta,
        searchNames.isAcceptableOrUnknown(
          data['search_names']!,
          _searchNamesMeta,
        ),
      );
    }
    if (data.containsKey('lat')) {
      context.handle(
        _latMeta,
        lat.isAcceptableOrUnknown(data['lat']!, _latMeta),
      );
    } else if (isInserting) {
      context.missing(_latMeta);
    }
    if (data.containsKey('lng')) {
      context.handle(
        _lngMeta,
        lng.isAcceptableOrUnknown(data['lng']!, _lngMeta),
      );
    } else if (isInserting) {
      context.missing(_lngMeta);
    }
    if (data.containsKey('country')) {
      context.handle(
        _countryMeta,
        country.isAcceptableOrUnknown(data['country']!, _countryMeta),
      );
    } else if (isInserting) {
      context.missing(_countryMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  City map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return City(
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      searchNames: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}search_names'],
      ),
      lat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lat'],
      )!,
      lng: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lng'],
      )!,
      country: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}country'],
      )!,
    );
  }

  @override
  $CitiesTable createAlias(String alias) {
    return $CitiesTable(attachedDatabase, alias);
  }
}

class City extends DataClass implements Insertable<City> {
  final String name;
  final String? searchNames;
  final double lat;
  final double lng;
  final String country;
  const City({
    required this.name,
    this.searchNames,
    required this.lat,
    required this.lng,
    required this.country,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || searchNames != null) {
      map['search_names'] = Variable<String>(searchNames);
    }
    map['lat'] = Variable<double>(lat);
    map['lng'] = Variable<double>(lng);
    map['country'] = Variable<String>(country);
    return map;
  }

  CitiesCompanion toCompanion(bool nullToAbsent) {
    return CitiesCompanion(
      name: Value(name),
      searchNames: searchNames == null && nullToAbsent
          ? const Value.absent()
          : Value(searchNames),
      lat: Value(lat),
      lng: Value(lng),
      country: Value(country),
    );
  }

  factory City.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return City(
      name: serializer.fromJson<String>(json['name']),
      searchNames: serializer.fromJson<String?>(json['searchNames']),
      lat: serializer.fromJson<double>(json['lat']),
      lng: serializer.fromJson<double>(json['lng']),
      country: serializer.fromJson<String>(json['country']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
      'searchNames': serializer.toJson<String?>(searchNames),
      'lat': serializer.toJson<double>(lat),
      'lng': serializer.toJson<double>(lng),
      'country': serializer.toJson<String>(country),
    };
  }

  City copyWith({
    String? name,
    Value<String?> searchNames = const Value.absent(),
    double? lat,
    double? lng,
    String? country,
  }) => City(
    name: name ?? this.name,
    searchNames: searchNames.present ? searchNames.value : this.searchNames,
    lat: lat ?? this.lat,
    lng: lng ?? this.lng,
    country: country ?? this.country,
  );
  City copyWithCompanion(CitiesCompanion data) {
    return City(
      name: data.name.present ? data.name.value : this.name,
      searchNames: data.searchNames.present
          ? data.searchNames.value
          : this.searchNames,
      lat: data.lat.present ? data.lat.value : this.lat,
      lng: data.lng.present ? data.lng.value : this.lng,
      country: data.country.present ? data.country.value : this.country,
    );
  }

  @override
  String toString() {
    return (StringBuffer('City(')
          ..write('name: $name, ')
          ..write('searchNames: $searchNames, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng, ')
          ..write('country: $country')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(name, searchNames, lat, lng, country);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is City &&
          other.name == this.name &&
          other.searchNames == this.searchNames &&
          other.lat == this.lat &&
          other.lng == this.lng &&
          other.country == this.country);
}

class CitiesCompanion extends UpdateCompanion<City> {
  final Value<String> name;
  final Value<String?> searchNames;
  final Value<double> lat;
  final Value<double> lng;
  final Value<String> country;
  final Value<int> rowid;
  const CitiesCompanion({
    this.name = const Value.absent(),
    this.searchNames = const Value.absent(),
    this.lat = const Value.absent(),
    this.lng = const Value.absent(),
    this.country = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CitiesCompanion.insert({
    required String name,
    this.searchNames = const Value.absent(),
    required double lat,
    required double lng,
    required String country,
    this.rowid = const Value.absent(),
  }) : name = Value(name),
       lat = Value(lat),
       lng = Value(lng),
       country = Value(country);
  static Insertable<City> custom({
    Expression<String>? name,
    Expression<String>? searchNames,
    Expression<double>? lat,
    Expression<double>? lng,
    Expression<String>? country,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (searchNames != null) 'search_names': searchNames,
      if (lat != null) 'lat': lat,
      if (lng != null) 'lng': lng,
      if (country != null) 'country': country,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CitiesCompanion copyWith({
    Value<String>? name,
    Value<String?>? searchNames,
    Value<double>? lat,
    Value<double>? lng,
    Value<String>? country,
    Value<int>? rowid,
  }) {
    return CitiesCompanion(
      name: name ?? this.name,
      searchNames: searchNames ?? this.searchNames,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      country: country ?? this.country,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (searchNames.present) {
      map['search_names'] = Variable<String>(searchNames.value);
    }
    if (lat.present) {
      map['lat'] = Variable<double>(lat.value);
    }
    if (lng.present) {
      map['lng'] = Variable<double>(lng.value);
    }
    if (country.present) {
      map['country'] = Variable<String>(country.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CitiesCompanion(')
          ..write('name: $name, ')
          ..write('searchNames: $searchNames, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng, ')
          ..write('country: $country, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$CitiesDatabase extends GeneratedDatabase {
  _$CitiesDatabase(QueryExecutor e) : super(e);
  $CitiesDatabaseManager get managers => $CitiesDatabaseManager(this);
  late final $CitiesTable cities = $CitiesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [cities];
}

typedef $$CitiesTableCreateCompanionBuilder =
    CitiesCompanion Function({
      required String name,
      Value<String?> searchNames,
      required double lat,
      required double lng,
      required String country,
      Value<int> rowid,
    });
typedef $$CitiesTableUpdateCompanionBuilder =
    CitiesCompanion Function({
      Value<String> name,
      Value<String?> searchNames,
      Value<double> lat,
      Value<double> lng,
      Value<String> country,
      Value<int> rowid,
    });

class $$CitiesTableFilterComposer
    extends Composer<_$CitiesDatabase, $CitiesTable> {
  $$CitiesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get searchNames => $composableBuilder(
    column: $table.searchNames,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lng => $composableBuilder(
    column: $table.lng,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get country => $composableBuilder(
    column: $table.country,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CitiesTableOrderingComposer
    extends Composer<_$CitiesDatabase, $CitiesTable> {
  $$CitiesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get searchNames => $composableBuilder(
    column: $table.searchNames,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lng => $composableBuilder(
    column: $table.lng,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get country => $composableBuilder(
    column: $table.country,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CitiesTableAnnotationComposer
    extends Composer<_$CitiesDatabase, $CitiesTable> {
  $$CitiesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get searchNames => $composableBuilder(
    column: $table.searchNames,
    builder: (column) => column,
  );

  GeneratedColumn<double> get lat =>
      $composableBuilder(column: $table.lat, builder: (column) => column);

  GeneratedColumn<double> get lng =>
      $composableBuilder(column: $table.lng, builder: (column) => column);

  GeneratedColumn<String> get country =>
      $composableBuilder(column: $table.country, builder: (column) => column);
}

class $$CitiesTableTableManager
    extends
        RootTableManager<
          _$CitiesDatabase,
          $CitiesTable,
          City,
          $$CitiesTableFilterComposer,
          $$CitiesTableOrderingComposer,
          $$CitiesTableAnnotationComposer,
          $$CitiesTableCreateCompanionBuilder,
          $$CitiesTableUpdateCompanionBuilder,
          (City, BaseReferences<_$CitiesDatabase, $CitiesTable, City>),
          City,
          PrefetchHooks Function()
        > {
  $$CitiesTableTableManager(_$CitiesDatabase db, $CitiesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CitiesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CitiesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CitiesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> name = const Value.absent(),
                Value<String?> searchNames = const Value.absent(),
                Value<double> lat = const Value.absent(),
                Value<double> lng = const Value.absent(),
                Value<String> country = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CitiesCompanion(
                name: name,
                searchNames: searchNames,
                lat: lat,
                lng: lng,
                country: country,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String name,
                Value<String?> searchNames = const Value.absent(),
                required double lat,
                required double lng,
                required String country,
                Value<int> rowid = const Value.absent(),
              }) => CitiesCompanion.insert(
                name: name,
                searchNames: searchNames,
                lat: lat,
                lng: lng,
                country: country,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CitiesTableProcessedTableManager =
    ProcessedTableManager<
      _$CitiesDatabase,
      $CitiesTable,
      City,
      $$CitiesTableFilterComposer,
      $$CitiesTableOrderingComposer,
      $$CitiesTableAnnotationComposer,
      $$CitiesTableCreateCompanionBuilder,
      $$CitiesTableUpdateCompanionBuilder,
      (City, BaseReferences<_$CitiesDatabase, $CitiesTable, City>),
      City,
      PrefetchHooks Function()
    >;

class $CitiesDatabaseManager {
  final _$CitiesDatabase _db;
  $CitiesDatabaseManager(this._db);
  $$CitiesTableTableManager get cities =>
      $$CitiesTableTableManager(_db, _db.cities);
}
