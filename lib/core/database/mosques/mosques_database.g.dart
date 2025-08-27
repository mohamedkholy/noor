// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mosques_database.dart';

// ignore_for_file: type=lint
class $NearMosquesTable extends NearMosques
    with TableInfo<$NearMosquesTable, NearMosque> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NearMosquesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
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
  static const VerificationMeta _distanceMeta = const VerificationMeta(
    'distance',
  );
  @override
  late final GeneratedColumn<double> distance = GeneratedColumn<double>(
    'distance',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _routeMeta = const VerificationMeta('route');
  @override
  late final GeneratedColumn<String> route = GeneratedColumn<String>(
    'route',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    name,
    address,
    lat,
    lng,
    distance,
    route,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'near_mosques';
  @override
  VerificationContext validateIntegrity(
    Insertable<NearMosque> instance, {
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
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
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
    if (data.containsKey('distance')) {
      context.handle(
        _distanceMeta,
        distance.isAcceptableOrUnknown(data['distance']!, _distanceMeta),
      );
    } else if (isInserting) {
      context.missing(_distanceMeta);
    }
    if (data.containsKey('route')) {
      context.handle(
        _routeMeta,
        route.isAcceptableOrUnknown(data['route']!, _routeMeta),
      );
    } else if (isInserting) {
      context.missing(_routeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  NearMosque map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NearMosque(
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      ),
      lat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lat'],
      )!,
      lng: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lng'],
      )!,
      distance: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}distance'],
      )!,
      route: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}route'],
      )!,
    );
  }

  @override
  $NearMosquesTable createAlias(String alias) {
    return $NearMosquesTable(attachedDatabase, alias);
  }
}

class NearMosque extends DataClass implements Insertable<NearMosque> {
  final String name;
  final String? address;
  final double lat;
  final double lng;
  final double distance;
  final String route;
  const NearMosque({
    required this.name,
    this.address,
    required this.lat,
    required this.lng,
    required this.distance,
    required this.route,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    map['lat'] = Variable<double>(lat);
    map['lng'] = Variable<double>(lng);
    map['distance'] = Variable<double>(distance);
    map['route'] = Variable<String>(route);
    return map;
  }

  NearMosquesCompanion toCompanion(bool nullToAbsent) {
    return NearMosquesCompanion(
      name: Value(name),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      lat: Value(lat),
      lng: Value(lng),
      distance: Value(distance),
      route: Value(route),
    );
  }

  factory NearMosque.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NearMosque(
      name: serializer.fromJson<String>(json['name']),
      address: serializer.fromJson<String?>(json['address']),
      lat: serializer.fromJson<double>(json['lat']),
      lng: serializer.fromJson<double>(json['lng']),
      distance: serializer.fromJson<double>(json['distance']),
      route: serializer.fromJson<String>(json['route']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
      'address': serializer.toJson<String?>(address),
      'lat': serializer.toJson<double>(lat),
      'lng': serializer.toJson<double>(lng),
      'distance': serializer.toJson<double>(distance),
      'route': serializer.toJson<String>(route),
    };
  }

  NearMosque copyWith({
    String? name,
    Value<String?> address = const Value.absent(),
    double? lat,
    double? lng,
    double? distance,
    String? route,
  }) => NearMosque(
    name: name ?? this.name,
    address: address.present ? address.value : this.address,
    lat: lat ?? this.lat,
    lng: lng ?? this.lng,
    distance: distance ?? this.distance,
    route: route ?? this.route,
  );
  NearMosque copyWithCompanion(NearMosquesCompanion data) {
    return NearMosque(
      name: data.name.present ? data.name.value : this.name,
      address: data.address.present ? data.address.value : this.address,
      lat: data.lat.present ? data.lat.value : this.lat,
      lng: data.lng.present ? data.lng.value : this.lng,
      distance: data.distance.present ? data.distance.value : this.distance,
      route: data.route.present ? data.route.value : this.route,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NearMosque(')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng, ')
          ..write('distance: $distance, ')
          ..write('route: $route')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(name, address, lat, lng, distance, route);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NearMosque &&
          other.name == this.name &&
          other.address == this.address &&
          other.lat == this.lat &&
          other.lng == this.lng &&
          other.distance == this.distance &&
          other.route == this.route);
}

class NearMosquesCompanion extends UpdateCompanion<NearMosque> {
  final Value<String> name;
  final Value<String?> address;
  final Value<double> lat;
  final Value<double> lng;
  final Value<double> distance;
  final Value<String> route;
  final Value<int> rowid;
  const NearMosquesCompanion({
    this.name = const Value.absent(),
    this.address = const Value.absent(),
    this.lat = const Value.absent(),
    this.lng = const Value.absent(),
    this.distance = const Value.absent(),
    this.route = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NearMosquesCompanion.insert({
    required String name,
    this.address = const Value.absent(),
    required double lat,
    required double lng,
    required double distance,
    required String route,
    this.rowid = const Value.absent(),
  }) : name = Value(name),
       lat = Value(lat),
       lng = Value(lng),
       distance = Value(distance),
       route = Value(route);
  static Insertable<NearMosque> custom({
    Expression<String>? name,
    Expression<String>? address,
    Expression<double>? lat,
    Expression<double>? lng,
    Expression<double>? distance,
    Expression<String>? route,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (address != null) 'address': address,
      if (lat != null) 'lat': lat,
      if (lng != null) 'lng': lng,
      if (distance != null) 'distance': distance,
      if (route != null) 'route': route,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NearMosquesCompanion copyWith({
    Value<String>? name,
    Value<String?>? address,
    Value<double>? lat,
    Value<double>? lng,
    Value<double>? distance,
    Value<String>? route,
    Value<int>? rowid,
  }) {
    return NearMosquesCompanion(
      name: name ?? this.name,
      address: address ?? this.address,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      distance: distance ?? this.distance,
      route: route ?? this.route,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (lat.present) {
      map['lat'] = Variable<double>(lat.value);
    }
    if (lng.present) {
      map['lng'] = Variable<double>(lng.value);
    }
    if (distance.present) {
      map['distance'] = Variable<double>(distance.value);
    }
    if (route.present) {
      map['route'] = Variable<String>(route.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NearMosquesCompanion(')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng, ')
          ..write('distance: $distance, ')
          ..write('route: $route, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$MosquesDatabase extends GeneratedDatabase {
  _$MosquesDatabase(QueryExecutor e) : super(e);
  $MosquesDatabaseManager get managers => $MosquesDatabaseManager(this);
  late final $NearMosquesTable nearMosques = $NearMosquesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [nearMosques];
}

typedef $$NearMosquesTableCreateCompanionBuilder =
    NearMosquesCompanion Function({
      required String name,
      Value<String?> address,
      required double lat,
      required double lng,
      required double distance,
      required String route,
      Value<int> rowid,
    });
typedef $$NearMosquesTableUpdateCompanionBuilder =
    NearMosquesCompanion Function({
      Value<String> name,
      Value<String?> address,
      Value<double> lat,
      Value<double> lng,
      Value<double> distance,
      Value<String> route,
      Value<int> rowid,
    });

class $$NearMosquesTableFilterComposer
    extends Composer<_$MosquesDatabase, $NearMosquesTable> {
  $$NearMosquesTableFilterComposer({
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

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
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

  ColumnFilters<double> get distance => $composableBuilder(
    column: $table.distance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get route => $composableBuilder(
    column: $table.route,
    builder: (column) => ColumnFilters(column),
  );
}

class $$NearMosquesTableOrderingComposer
    extends Composer<_$MosquesDatabase, $NearMosquesTable> {
  $$NearMosquesTableOrderingComposer({
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

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
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

  ColumnOrderings<double> get distance => $composableBuilder(
    column: $table.distance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get route => $composableBuilder(
    column: $table.route,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$NearMosquesTableAnnotationComposer
    extends Composer<_$MosquesDatabase, $NearMosquesTable> {
  $$NearMosquesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<double> get lat =>
      $composableBuilder(column: $table.lat, builder: (column) => column);

  GeneratedColumn<double> get lng =>
      $composableBuilder(column: $table.lng, builder: (column) => column);

  GeneratedColumn<double> get distance =>
      $composableBuilder(column: $table.distance, builder: (column) => column);

  GeneratedColumn<String> get route =>
      $composableBuilder(column: $table.route, builder: (column) => column);
}

class $$NearMosquesTableTableManager
    extends
        RootTableManager<
          _$MosquesDatabase,
          $NearMosquesTable,
          NearMosque,
          $$NearMosquesTableFilterComposer,
          $$NearMosquesTableOrderingComposer,
          $$NearMosquesTableAnnotationComposer,
          $$NearMosquesTableCreateCompanionBuilder,
          $$NearMosquesTableUpdateCompanionBuilder,
          (
            NearMosque,
            BaseReferences<_$MosquesDatabase, $NearMosquesTable, NearMosque>,
          ),
          NearMosque,
          PrefetchHooks Function()
        > {
  $$NearMosquesTableTableManager(_$MosquesDatabase db, $NearMosquesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NearMosquesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NearMosquesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NearMosquesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> name = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<double> lat = const Value.absent(),
                Value<double> lng = const Value.absent(),
                Value<double> distance = const Value.absent(),
                Value<String> route = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => NearMosquesCompanion(
                name: name,
                address: address,
                lat: lat,
                lng: lng,
                distance: distance,
                route: route,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String name,
                Value<String?> address = const Value.absent(),
                required double lat,
                required double lng,
                required double distance,
                required String route,
                Value<int> rowid = const Value.absent(),
              }) => NearMosquesCompanion.insert(
                name: name,
                address: address,
                lat: lat,
                lng: lng,
                distance: distance,
                route: route,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$NearMosquesTableProcessedTableManager =
    ProcessedTableManager<
      _$MosquesDatabase,
      $NearMosquesTable,
      NearMosque,
      $$NearMosquesTableFilterComposer,
      $$NearMosquesTableOrderingComposer,
      $$NearMosquesTableAnnotationComposer,
      $$NearMosquesTableCreateCompanionBuilder,
      $$NearMosquesTableUpdateCompanionBuilder,
      (
        NearMosque,
        BaseReferences<_$MosquesDatabase, $NearMosquesTable, NearMosque>,
      ),
      NearMosque,
      PrefetchHooks Function()
    >;

class $MosquesDatabaseManager {
  final _$MosquesDatabase _db;
  $MosquesDatabaseManager(this._db);
  $$NearMosquesTableTableManager get nearMosques =>
      $$NearMosquesTableTableManager(_db, _db.nearMosques);
}
