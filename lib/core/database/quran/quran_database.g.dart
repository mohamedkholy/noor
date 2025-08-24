// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_database.dart';

// ignore_for_file: type=lint
class $SurahsTable extends Surahs with TableInfo<$SurahsTable, Surah> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SurahsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _numberMeta = const VerificationMeta('number');
  @override
  late final GeneratedColumn<int> number = GeneratedColumn<int>(
    'number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameArMeta = const VerificationMeta('nameAr');
  @override
  late final GeneratedColumn<String> nameAr = GeneratedColumn<String>(
    'name_ar',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameEnMeta = const VerificationMeta('nameEn');
  @override
  late final GeneratedColumn<String> nameEn = GeneratedColumn<String>(
    'name_en',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameTransliterationMeta =
      const VerificationMeta('nameTransliteration');
  @override
  late final GeneratedColumn<String> nameTransliteration =
      GeneratedColumn<String>(
        'name_transliteration',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _revelationPlaceArMeta = const VerificationMeta(
    'revelationPlaceAr',
  );
  @override
  late final GeneratedColumn<String> revelationPlaceAr =
      GeneratedColumn<String>(
        'revelation_place_ar',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _revelationPlaceEnMeta = const VerificationMeta(
    'revelationPlaceEn',
  );
  @override
  late final GeneratedColumn<String> revelationPlaceEn =
      GeneratedColumn<String>(
        'revelation_place_en',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _versesCountMeta = const VerificationMeta(
    'versesCount',
  );
  @override
  late final GeneratedColumn<int> versesCount = GeneratedColumn<int>(
    'verses_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pageNumberMeta = const VerificationMeta(
    'pageNumber',
  );
  @override
  late final GeneratedColumn<int> pageNumber = GeneratedColumn<int>(
    'page_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    number,
    nameAr,
    nameEn,
    nameTransliteration,
    revelationPlaceAr,
    revelationPlaceEn,
    versesCount,
    pageNumber,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'surahs';
  @override
  VerificationContext validateIntegrity(
    Insertable<Surah> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('number')) {
      context.handle(
        _numberMeta,
        number.isAcceptableOrUnknown(data['number']!, _numberMeta),
      );
    }
    if (data.containsKey('name_ar')) {
      context.handle(
        _nameArMeta,
        nameAr.isAcceptableOrUnknown(data['name_ar']!, _nameArMeta),
      );
    } else if (isInserting) {
      context.missing(_nameArMeta);
    }
    if (data.containsKey('name_en')) {
      context.handle(
        _nameEnMeta,
        nameEn.isAcceptableOrUnknown(data['name_en']!, _nameEnMeta),
      );
    } else if (isInserting) {
      context.missing(_nameEnMeta);
    }
    if (data.containsKey('name_transliteration')) {
      context.handle(
        _nameTransliterationMeta,
        nameTransliteration.isAcceptableOrUnknown(
          data['name_transliteration']!,
          _nameTransliterationMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_nameTransliterationMeta);
    }
    if (data.containsKey('revelation_place_ar')) {
      context.handle(
        _revelationPlaceArMeta,
        revelationPlaceAr.isAcceptableOrUnknown(
          data['revelation_place_ar']!,
          _revelationPlaceArMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_revelationPlaceArMeta);
    }
    if (data.containsKey('revelation_place_en')) {
      context.handle(
        _revelationPlaceEnMeta,
        revelationPlaceEn.isAcceptableOrUnknown(
          data['revelation_place_en']!,
          _revelationPlaceEnMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_revelationPlaceEnMeta);
    }
    if (data.containsKey('verses_count')) {
      context.handle(
        _versesCountMeta,
        versesCount.isAcceptableOrUnknown(
          data['verses_count']!,
          _versesCountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_versesCountMeta);
    }
    if (data.containsKey('page_number')) {
      context.handle(
        _pageNumberMeta,
        pageNumber.isAcceptableOrUnknown(data['page_number']!, _pageNumberMeta),
      );
    } else if (isInserting) {
      context.missing(_pageNumberMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {number};
  @override
  Surah map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Surah(
      number: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}number'],
      )!,
      nameAr: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_ar'],
      )!,
      nameEn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_en'],
      )!,
      nameTransliteration: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_transliteration'],
      )!,
      revelationPlaceAr: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}revelation_place_ar'],
      )!,
      revelationPlaceEn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}revelation_place_en'],
      )!,
      versesCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}verses_count'],
      )!,
      pageNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}page_number'],
      )!,
    );
  }

  @override
  $SurahsTable createAlias(String alias) {
    return $SurahsTable(attachedDatabase, alias);
  }
}

class Surah extends DataClass implements Insertable<Surah> {
  final int number;
  final String nameAr;
  final String nameEn;
  final String nameTransliteration;
  final String revelationPlaceAr;
  final String revelationPlaceEn;
  final int versesCount;
  final int pageNumber;
  const Surah({
    required this.number,
    required this.nameAr,
    required this.nameEn,
    required this.nameTransliteration,
    required this.revelationPlaceAr,
    required this.revelationPlaceEn,
    required this.versesCount,
    required this.pageNumber,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['number'] = Variable<int>(number);
    map['name_ar'] = Variable<String>(nameAr);
    map['name_en'] = Variable<String>(nameEn);
    map['name_transliteration'] = Variable<String>(nameTransliteration);
    map['revelation_place_ar'] = Variable<String>(revelationPlaceAr);
    map['revelation_place_en'] = Variable<String>(revelationPlaceEn);
    map['verses_count'] = Variable<int>(versesCount);
    map['page_number'] = Variable<int>(pageNumber);
    return map;
  }

  SurahsCompanion toCompanion(bool nullToAbsent) {
    return SurahsCompanion(
      number: Value(number),
      nameAr: Value(nameAr),
      nameEn: Value(nameEn),
      nameTransliteration: Value(nameTransliteration),
      revelationPlaceAr: Value(revelationPlaceAr),
      revelationPlaceEn: Value(revelationPlaceEn),
      versesCount: Value(versesCount),
      pageNumber: Value(pageNumber),
    );
  }

  factory Surah.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Surah(
      number: serializer.fromJson<int>(json['number']),
      nameAr: serializer.fromJson<String>(json['nameAr']),
      nameEn: serializer.fromJson<String>(json['nameEn']),
      nameTransliteration: serializer.fromJson<String>(
        json['nameTransliteration'],
      ),
      revelationPlaceAr: serializer.fromJson<String>(json['revelationPlaceAr']),
      revelationPlaceEn: serializer.fromJson<String>(json['revelationPlaceEn']),
      versesCount: serializer.fromJson<int>(json['versesCount']),
      pageNumber: serializer.fromJson<int>(json['pageNumber']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'number': serializer.toJson<int>(number),
      'nameAr': serializer.toJson<String>(nameAr),
      'nameEn': serializer.toJson<String>(nameEn),
      'nameTransliteration': serializer.toJson<String>(nameTransliteration),
      'revelationPlaceAr': serializer.toJson<String>(revelationPlaceAr),
      'revelationPlaceEn': serializer.toJson<String>(revelationPlaceEn),
      'versesCount': serializer.toJson<int>(versesCount),
      'pageNumber': serializer.toJson<int>(pageNumber),
    };
  }

  Surah copyWith({
    int? number,
    String? nameAr,
    String? nameEn,
    String? nameTransliteration,
    String? revelationPlaceAr,
    String? revelationPlaceEn,
    int? versesCount,
    int? pageNumber,
  }) => Surah(
    number: number ?? this.number,
    nameAr: nameAr ?? this.nameAr,
    nameEn: nameEn ?? this.nameEn,
    nameTransliteration: nameTransliteration ?? this.nameTransliteration,
    revelationPlaceAr: revelationPlaceAr ?? this.revelationPlaceAr,
    revelationPlaceEn: revelationPlaceEn ?? this.revelationPlaceEn,
    versesCount: versesCount ?? this.versesCount,
    pageNumber: pageNumber ?? this.pageNumber,
  );
  Surah copyWithCompanion(SurahsCompanion data) {
    return Surah(
      number: data.number.present ? data.number.value : this.number,
      nameAr: data.nameAr.present ? data.nameAr.value : this.nameAr,
      nameEn: data.nameEn.present ? data.nameEn.value : this.nameEn,
      nameTransliteration: data.nameTransliteration.present
          ? data.nameTransliteration.value
          : this.nameTransliteration,
      revelationPlaceAr: data.revelationPlaceAr.present
          ? data.revelationPlaceAr.value
          : this.revelationPlaceAr,
      revelationPlaceEn: data.revelationPlaceEn.present
          ? data.revelationPlaceEn.value
          : this.revelationPlaceEn,
      versesCount: data.versesCount.present
          ? data.versesCount.value
          : this.versesCount,
      pageNumber: data.pageNumber.present
          ? data.pageNumber.value
          : this.pageNumber,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Surah(')
          ..write('number: $number, ')
          ..write('nameAr: $nameAr, ')
          ..write('nameEn: $nameEn, ')
          ..write('nameTransliteration: $nameTransliteration, ')
          ..write('revelationPlaceAr: $revelationPlaceAr, ')
          ..write('revelationPlaceEn: $revelationPlaceEn, ')
          ..write('versesCount: $versesCount, ')
          ..write('pageNumber: $pageNumber')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    number,
    nameAr,
    nameEn,
    nameTransliteration,
    revelationPlaceAr,
    revelationPlaceEn,
    versesCount,
    pageNumber,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Surah &&
          other.number == this.number &&
          other.nameAr == this.nameAr &&
          other.nameEn == this.nameEn &&
          other.nameTransliteration == this.nameTransliteration &&
          other.revelationPlaceAr == this.revelationPlaceAr &&
          other.revelationPlaceEn == this.revelationPlaceEn &&
          other.versesCount == this.versesCount &&
          other.pageNumber == this.pageNumber);
}

class SurahsCompanion extends UpdateCompanion<Surah> {
  final Value<int> number;
  final Value<String> nameAr;
  final Value<String> nameEn;
  final Value<String> nameTransliteration;
  final Value<String> revelationPlaceAr;
  final Value<String> revelationPlaceEn;
  final Value<int> versesCount;
  final Value<int> pageNumber;
  const SurahsCompanion({
    this.number = const Value.absent(),
    this.nameAr = const Value.absent(),
    this.nameEn = const Value.absent(),
    this.nameTransliteration = const Value.absent(),
    this.revelationPlaceAr = const Value.absent(),
    this.revelationPlaceEn = const Value.absent(),
    this.versesCount = const Value.absent(),
    this.pageNumber = const Value.absent(),
  });
  SurahsCompanion.insert({
    this.number = const Value.absent(),
    required String nameAr,
    required String nameEn,
    required String nameTransliteration,
    required String revelationPlaceAr,
    required String revelationPlaceEn,
    required int versesCount,
    required int pageNumber,
  }) : nameAr = Value(nameAr),
       nameEn = Value(nameEn),
       nameTransliteration = Value(nameTransliteration),
       revelationPlaceAr = Value(revelationPlaceAr),
       revelationPlaceEn = Value(revelationPlaceEn),
       versesCount = Value(versesCount),
       pageNumber = Value(pageNumber);
  static Insertable<Surah> custom({
    Expression<int>? number,
    Expression<String>? nameAr,
    Expression<String>? nameEn,
    Expression<String>? nameTransliteration,
    Expression<String>? revelationPlaceAr,
    Expression<String>? revelationPlaceEn,
    Expression<int>? versesCount,
    Expression<int>? pageNumber,
  }) {
    return RawValuesInsertable({
      if (number != null) 'number': number,
      if (nameAr != null) 'name_ar': nameAr,
      if (nameEn != null) 'name_en': nameEn,
      if (nameTransliteration != null)
        'name_transliteration': nameTransliteration,
      if (revelationPlaceAr != null) 'revelation_place_ar': revelationPlaceAr,
      if (revelationPlaceEn != null) 'revelation_place_en': revelationPlaceEn,
      if (versesCount != null) 'verses_count': versesCount,
      if (pageNumber != null) 'page_number': pageNumber,
    });
  }

  SurahsCompanion copyWith({
    Value<int>? number,
    Value<String>? nameAr,
    Value<String>? nameEn,
    Value<String>? nameTransliteration,
    Value<String>? revelationPlaceAr,
    Value<String>? revelationPlaceEn,
    Value<int>? versesCount,
    Value<int>? pageNumber,
  }) {
    return SurahsCompanion(
      number: number ?? this.number,
      nameAr: nameAr ?? this.nameAr,
      nameEn: nameEn ?? this.nameEn,
      nameTransliteration: nameTransliteration ?? this.nameTransliteration,
      revelationPlaceAr: revelationPlaceAr ?? this.revelationPlaceAr,
      revelationPlaceEn: revelationPlaceEn ?? this.revelationPlaceEn,
      versesCount: versesCount ?? this.versesCount,
      pageNumber: pageNumber ?? this.pageNumber,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (number.present) {
      map['number'] = Variable<int>(number.value);
    }
    if (nameAr.present) {
      map['name_ar'] = Variable<String>(nameAr.value);
    }
    if (nameEn.present) {
      map['name_en'] = Variable<String>(nameEn.value);
    }
    if (nameTransliteration.present) {
      map['name_transliteration'] = Variable<String>(nameTransliteration.value);
    }
    if (revelationPlaceAr.present) {
      map['revelation_place_ar'] = Variable<String>(revelationPlaceAr.value);
    }
    if (revelationPlaceEn.present) {
      map['revelation_place_en'] = Variable<String>(revelationPlaceEn.value);
    }
    if (versesCount.present) {
      map['verses_count'] = Variable<int>(versesCount.value);
    }
    if (pageNumber.present) {
      map['page_number'] = Variable<int>(pageNumber.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SurahsCompanion(')
          ..write('number: $number, ')
          ..write('nameAr: $nameAr, ')
          ..write('nameEn: $nameEn, ')
          ..write('nameTransliteration: $nameTransliteration, ')
          ..write('revelationPlaceAr: $revelationPlaceAr, ')
          ..write('revelationPlaceEn: $revelationPlaceEn, ')
          ..write('versesCount: $versesCount, ')
          ..write('pageNumber: $pageNumber')
          ..write(')'))
        .toString();
  }
}

class $VersesTable extends Verses with TableInfo<$VersesTable, Verse> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VersesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _surahNumberMeta = const VerificationMeta(
    'surahNumber',
  );
  @override
  late final GeneratedColumn<int> surahNumber = GeneratedColumn<int>(
    'surah_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _surahNameMeta = const VerificationMeta(
    'surahName',
  );
  @override
  late final GeneratedColumn<String> surahName = GeneratedColumn<String>(
    'surah_name',
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
  static const VerificationMeta _textArMeta = const VerificationMeta('textAr');
  @override
  late final GeneratedColumn<String> textAr = GeneratedColumn<String>(
    'text_ar',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _textEnMeta = const VerificationMeta('textEn');
  @override
  late final GeneratedColumn<String> textEn = GeneratedColumn<String>(
    'text_en',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _juzMeta = const VerificationMeta('juz');
  @override
  late final GeneratedColumn<int> juz = GeneratedColumn<int>(
    'juz',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pageMeta = const VerificationMeta('page');
  @override
  late final GeneratedColumn<int> page = GeneratedColumn<int>(
    'page',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _newJuzMeta = const VerificationMeta('newJuz');
  @override
  late final GeneratedColumn<int> newJuz = GeneratedColumn<int>(
    'new_juz',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    surahNumber,
    surahName,
    number,
    textAr,
    textEn,
    juz,
    page,
    newJuz,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'verses';
  @override
  VerificationContext validateIntegrity(
    Insertable<Verse> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('surah_number')) {
      context.handle(
        _surahNumberMeta,
        surahNumber.isAcceptableOrUnknown(
          data['surah_number']!,
          _surahNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_surahNumberMeta);
    }
    if (data.containsKey('surah_name')) {
      context.handle(
        _surahNameMeta,
        surahName.isAcceptableOrUnknown(data['surah_name']!, _surahNameMeta),
      );
    } else if (isInserting) {
      context.missing(_surahNameMeta);
    }
    if (data.containsKey('number')) {
      context.handle(
        _numberMeta,
        number.isAcceptableOrUnknown(data['number']!, _numberMeta),
      );
    } else if (isInserting) {
      context.missing(_numberMeta);
    }
    if (data.containsKey('text_ar')) {
      context.handle(
        _textArMeta,
        textAr.isAcceptableOrUnknown(data['text_ar']!, _textArMeta),
      );
    } else if (isInserting) {
      context.missing(_textArMeta);
    }
    if (data.containsKey('text_en')) {
      context.handle(
        _textEnMeta,
        textEn.isAcceptableOrUnknown(data['text_en']!, _textEnMeta),
      );
    } else if (isInserting) {
      context.missing(_textEnMeta);
    }
    if (data.containsKey('juz')) {
      context.handle(
        _juzMeta,
        juz.isAcceptableOrUnknown(data['juz']!, _juzMeta),
      );
    } else if (isInserting) {
      context.missing(_juzMeta);
    }
    if (data.containsKey('page')) {
      context.handle(
        _pageMeta,
        page.isAcceptableOrUnknown(data['page']!, _pageMeta),
      );
    } else if (isInserting) {
      context.missing(_pageMeta);
    }
    if (data.containsKey('new_juz')) {
      context.handle(
        _newJuzMeta,
        newJuz.isAcceptableOrUnknown(data['new_juz']!, _newJuzMeta),
      );
    } else if (isInserting) {
      context.missing(_newJuzMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {surahNumber, number};
  @override
  Verse map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Verse(
      surahNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}surah_number'],
      )!,
      surahName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}surah_name'],
      )!,
      number: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}number'],
      )!,
      textAr: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}text_ar'],
      )!,
      textEn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}text_en'],
      )!,
      juz: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}juz'],
      )!,
      page: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}page'],
      )!,
      newJuz: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}new_juz'],
      )!,
    );
  }

  @override
  $VersesTable createAlias(String alias) {
    return $VersesTable(attachedDatabase, alias);
  }
}

class Verse extends DataClass implements Insertable<Verse> {
  final int surahNumber;
  final String surahName;
  final int number;
  final String textAr;
  final String textEn;
  final int juz;
  final int page;
  final int newJuz;
  const Verse({
    required this.surahNumber,
    required this.surahName,
    required this.number,
    required this.textAr,
    required this.textEn,
    required this.juz,
    required this.page,
    required this.newJuz,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['surah_number'] = Variable<int>(surahNumber);
    map['surah_name'] = Variable<String>(surahName);
    map['number'] = Variable<int>(number);
    map['text_ar'] = Variable<String>(textAr);
    map['text_en'] = Variable<String>(textEn);
    map['juz'] = Variable<int>(juz);
    map['page'] = Variable<int>(page);
    map['new_juz'] = Variable<int>(newJuz);
    return map;
  }

  VersesCompanion toCompanion(bool nullToAbsent) {
    return VersesCompanion(
      surahNumber: Value(surahNumber),
      surahName: Value(surahName),
      number: Value(number),
      textAr: Value(textAr),
      textEn: Value(textEn),
      juz: Value(juz),
      page: Value(page),
      newJuz: Value(newJuz),
    );
  }

  factory Verse.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Verse(
      surahNumber: serializer.fromJson<int>(json['surahNumber']),
      surahName: serializer.fromJson<String>(json['surahName']),
      number: serializer.fromJson<int>(json['number']),
      textAr: serializer.fromJson<String>(json['textAr']),
      textEn: serializer.fromJson<String>(json['textEn']),
      juz: serializer.fromJson<int>(json['juz']),
      page: serializer.fromJson<int>(json['page']),
      newJuz: serializer.fromJson<int>(json['newJuz']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'surahNumber': serializer.toJson<int>(surahNumber),
      'surahName': serializer.toJson<String>(surahName),
      'number': serializer.toJson<int>(number),
      'textAr': serializer.toJson<String>(textAr),
      'textEn': serializer.toJson<String>(textEn),
      'juz': serializer.toJson<int>(juz),
      'page': serializer.toJson<int>(page),
      'newJuz': serializer.toJson<int>(newJuz),
    };
  }

  Verse copyWith({
    int? surahNumber,
    String? surahName,
    int? number,
    String? textAr,
    String? textEn,
    int? juz,
    int? page,
    int? newJuz,
  }) => Verse(
    surahNumber: surahNumber ?? this.surahNumber,
    surahName: surahName ?? this.surahName,
    number: number ?? this.number,
    textAr: textAr ?? this.textAr,
    textEn: textEn ?? this.textEn,
    juz: juz ?? this.juz,
    page: page ?? this.page,
    newJuz: newJuz ?? this.newJuz,
  );
  Verse copyWithCompanion(VersesCompanion data) {
    return Verse(
      surahNumber: data.surahNumber.present
          ? data.surahNumber.value
          : this.surahNumber,
      surahName: data.surahName.present ? data.surahName.value : this.surahName,
      number: data.number.present ? data.number.value : this.number,
      textAr: data.textAr.present ? data.textAr.value : this.textAr,
      textEn: data.textEn.present ? data.textEn.value : this.textEn,
      juz: data.juz.present ? data.juz.value : this.juz,
      page: data.page.present ? data.page.value : this.page,
      newJuz: data.newJuz.present ? data.newJuz.value : this.newJuz,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Verse(')
          ..write('surahNumber: $surahNumber, ')
          ..write('surahName: $surahName, ')
          ..write('number: $number, ')
          ..write('textAr: $textAr, ')
          ..write('textEn: $textEn, ')
          ..write('juz: $juz, ')
          ..write('page: $page, ')
          ..write('newJuz: $newJuz')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    surahNumber,
    surahName,
    number,
    textAr,
    textEn,
    juz,
    page,
    newJuz,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Verse &&
          other.surahNumber == this.surahNumber &&
          other.surahName == this.surahName &&
          other.number == this.number &&
          other.textAr == this.textAr &&
          other.textEn == this.textEn &&
          other.juz == this.juz &&
          other.page == this.page &&
          other.newJuz == this.newJuz);
}

class VersesCompanion extends UpdateCompanion<Verse> {
  final Value<int> surahNumber;
  final Value<String> surahName;
  final Value<int> number;
  final Value<String> textAr;
  final Value<String> textEn;
  final Value<int> juz;
  final Value<int> page;
  final Value<int> newJuz;
  final Value<int> rowid;
  const VersesCompanion({
    this.surahNumber = const Value.absent(),
    this.surahName = const Value.absent(),
    this.number = const Value.absent(),
    this.textAr = const Value.absent(),
    this.textEn = const Value.absent(),
    this.juz = const Value.absent(),
    this.page = const Value.absent(),
    this.newJuz = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  VersesCompanion.insert({
    required int surahNumber,
    required String surahName,
    required int number,
    required String textAr,
    required String textEn,
    required int juz,
    required int page,
    required int newJuz,
    this.rowid = const Value.absent(),
  }) : surahNumber = Value(surahNumber),
       surahName = Value(surahName),
       number = Value(number),
       textAr = Value(textAr),
       textEn = Value(textEn),
       juz = Value(juz),
       page = Value(page),
       newJuz = Value(newJuz);
  static Insertable<Verse> custom({
    Expression<int>? surahNumber,
    Expression<String>? surahName,
    Expression<int>? number,
    Expression<String>? textAr,
    Expression<String>? textEn,
    Expression<int>? juz,
    Expression<int>? page,
    Expression<int>? newJuz,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (surahNumber != null) 'surah_number': surahNumber,
      if (surahName != null) 'surah_name': surahName,
      if (number != null) 'number': number,
      if (textAr != null) 'text_ar': textAr,
      if (textEn != null) 'text_en': textEn,
      if (juz != null) 'juz': juz,
      if (page != null) 'page': page,
      if (newJuz != null) 'new_juz': newJuz,
      if (rowid != null) 'rowid': rowid,
    });
  }

  VersesCompanion copyWith({
    Value<int>? surahNumber,
    Value<String>? surahName,
    Value<int>? number,
    Value<String>? textAr,
    Value<String>? textEn,
    Value<int>? juz,
    Value<int>? page,
    Value<int>? newJuz,
    Value<int>? rowid,
  }) {
    return VersesCompanion(
      surahNumber: surahNumber ?? this.surahNumber,
      surahName: surahName ?? this.surahName,
      number: number ?? this.number,
      textAr: textAr ?? this.textAr,
      textEn: textEn ?? this.textEn,
      juz: juz ?? this.juz,
      page: page ?? this.page,
      newJuz: newJuz ?? this.newJuz,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (surahNumber.present) {
      map['surah_number'] = Variable<int>(surahNumber.value);
    }
    if (surahName.present) {
      map['surah_name'] = Variable<String>(surahName.value);
    }
    if (number.present) {
      map['number'] = Variable<int>(number.value);
    }
    if (textAr.present) {
      map['text_ar'] = Variable<String>(textAr.value);
    }
    if (textEn.present) {
      map['text_en'] = Variable<String>(textEn.value);
    }
    if (juz.present) {
      map['juz'] = Variable<int>(juz.value);
    }
    if (page.present) {
      map['page'] = Variable<int>(page.value);
    }
    if (newJuz.present) {
      map['new_juz'] = Variable<int>(newJuz.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VersesCompanion(')
          ..write('surahNumber: $surahNumber, ')
          ..write('surahName: $surahName, ')
          ..write('number: $number, ')
          ..write('textAr: $textAr, ')
          ..write('textEn: $textEn, ')
          ..write('juz: $juz, ')
          ..write('page: $page, ')
          ..write('newJuz: $newJuz, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$QuranDatabase extends GeneratedDatabase {
  _$QuranDatabase(QueryExecutor e) : super(e);
  $QuranDatabaseManager get managers => $QuranDatabaseManager(this);
  late final $SurahsTable surahs = $SurahsTable(this);
  late final $VersesTable verses = $VersesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [surahs, verses];
}

typedef $$SurahsTableCreateCompanionBuilder =
    SurahsCompanion Function({
      Value<int> number,
      required String nameAr,
      required String nameEn,
      required String nameTransliteration,
      required String revelationPlaceAr,
      required String revelationPlaceEn,
      required int versesCount,
      required int pageNumber,
    });
typedef $$SurahsTableUpdateCompanionBuilder =
    SurahsCompanion Function({
      Value<int> number,
      Value<String> nameAr,
      Value<String> nameEn,
      Value<String> nameTransliteration,
      Value<String> revelationPlaceAr,
      Value<String> revelationPlaceEn,
      Value<int> versesCount,
      Value<int> pageNumber,
    });

class $$SurahsTableFilterComposer
    extends Composer<_$QuranDatabase, $SurahsTable> {
  $$SurahsTableFilterComposer({
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

  ColumnFilters<String> get nameAr => $composableBuilder(
    column: $table.nameAr,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameEn => $composableBuilder(
    column: $table.nameEn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameTransliteration => $composableBuilder(
    column: $table.nameTransliteration,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get revelationPlaceAr => $composableBuilder(
    column: $table.revelationPlaceAr,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get revelationPlaceEn => $composableBuilder(
    column: $table.revelationPlaceEn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get versesCount => $composableBuilder(
    column: $table.versesCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pageNumber => $composableBuilder(
    column: $table.pageNumber,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SurahsTableOrderingComposer
    extends Composer<_$QuranDatabase, $SurahsTable> {
  $$SurahsTableOrderingComposer({
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

  ColumnOrderings<String> get nameAr => $composableBuilder(
    column: $table.nameAr,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameEn => $composableBuilder(
    column: $table.nameEn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameTransliteration => $composableBuilder(
    column: $table.nameTransliteration,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get revelationPlaceAr => $composableBuilder(
    column: $table.revelationPlaceAr,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get revelationPlaceEn => $composableBuilder(
    column: $table.revelationPlaceEn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get versesCount => $composableBuilder(
    column: $table.versesCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pageNumber => $composableBuilder(
    column: $table.pageNumber,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SurahsTableAnnotationComposer
    extends Composer<_$QuranDatabase, $SurahsTable> {
  $$SurahsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get number =>
      $composableBuilder(column: $table.number, builder: (column) => column);

  GeneratedColumn<String> get nameAr =>
      $composableBuilder(column: $table.nameAr, builder: (column) => column);

  GeneratedColumn<String> get nameEn =>
      $composableBuilder(column: $table.nameEn, builder: (column) => column);

  GeneratedColumn<String> get nameTransliteration => $composableBuilder(
    column: $table.nameTransliteration,
    builder: (column) => column,
  );

  GeneratedColumn<String> get revelationPlaceAr => $composableBuilder(
    column: $table.revelationPlaceAr,
    builder: (column) => column,
  );

  GeneratedColumn<String> get revelationPlaceEn => $composableBuilder(
    column: $table.revelationPlaceEn,
    builder: (column) => column,
  );

  GeneratedColumn<int> get versesCount => $composableBuilder(
    column: $table.versesCount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get pageNumber => $composableBuilder(
    column: $table.pageNumber,
    builder: (column) => column,
  );
}

class $$SurahsTableTableManager
    extends
        RootTableManager<
          _$QuranDatabase,
          $SurahsTable,
          Surah,
          $$SurahsTableFilterComposer,
          $$SurahsTableOrderingComposer,
          $$SurahsTableAnnotationComposer,
          $$SurahsTableCreateCompanionBuilder,
          $$SurahsTableUpdateCompanionBuilder,
          (Surah, BaseReferences<_$QuranDatabase, $SurahsTable, Surah>),
          Surah,
          PrefetchHooks Function()
        > {
  $$SurahsTableTableManager(_$QuranDatabase db, $SurahsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SurahsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SurahsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SurahsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> number = const Value.absent(),
                Value<String> nameAr = const Value.absent(),
                Value<String> nameEn = const Value.absent(),
                Value<String> nameTransliteration = const Value.absent(),
                Value<String> revelationPlaceAr = const Value.absent(),
                Value<String> revelationPlaceEn = const Value.absent(),
                Value<int> versesCount = const Value.absent(),
                Value<int> pageNumber = const Value.absent(),
              }) => SurahsCompanion(
                number: number,
                nameAr: nameAr,
                nameEn: nameEn,
                nameTransliteration: nameTransliteration,
                revelationPlaceAr: revelationPlaceAr,
                revelationPlaceEn: revelationPlaceEn,
                versesCount: versesCount,
                pageNumber: pageNumber,
              ),
          createCompanionCallback:
              ({
                Value<int> number = const Value.absent(),
                required String nameAr,
                required String nameEn,
                required String nameTransliteration,
                required String revelationPlaceAr,
                required String revelationPlaceEn,
                required int versesCount,
                required int pageNumber,
              }) => SurahsCompanion.insert(
                number: number,
                nameAr: nameAr,
                nameEn: nameEn,
                nameTransliteration: nameTransliteration,
                revelationPlaceAr: revelationPlaceAr,
                revelationPlaceEn: revelationPlaceEn,
                versesCount: versesCount,
                pageNumber: pageNumber,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SurahsTableProcessedTableManager =
    ProcessedTableManager<
      _$QuranDatabase,
      $SurahsTable,
      Surah,
      $$SurahsTableFilterComposer,
      $$SurahsTableOrderingComposer,
      $$SurahsTableAnnotationComposer,
      $$SurahsTableCreateCompanionBuilder,
      $$SurahsTableUpdateCompanionBuilder,
      (Surah, BaseReferences<_$QuranDatabase, $SurahsTable, Surah>),
      Surah,
      PrefetchHooks Function()
    >;
typedef $$VersesTableCreateCompanionBuilder =
    VersesCompanion Function({
      required int surahNumber,
      required String surahName,
      required int number,
      required String textAr,
      required String textEn,
      required int juz,
      required int page,
      required int newJuz,
      Value<int> rowid,
    });
typedef $$VersesTableUpdateCompanionBuilder =
    VersesCompanion Function({
      Value<int> surahNumber,
      Value<String> surahName,
      Value<int> number,
      Value<String> textAr,
      Value<String> textEn,
      Value<int> juz,
      Value<int> page,
      Value<int> newJuz,
      Value<int> rowid,
    });

class $$VersesTableFilterComposer
    extends Composer<_$QuranDatabase, $VersesTable> {
  $$VersesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get surahNumber => $composableBuilder(
    column: $table.surahNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get surahName => $composableBuilder(
    column: $table.surahName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get number => $composableBuilder(
    column: $table.number,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get textAr => $composableBuilder(
    column: $table.textAr,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get textEn => $composableBuilder(
    column: $table.textEn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get juz => $composableBuilder(
    column: $table.juz,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get page => $composableBuilder(
    column: $table.page,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get newJuz => $composableBuilder(
    column: $table.newJuz,
    builder: (column) => ColumnFilters(column),
  );
}

class $$VersesTableOrderingComposer
    extends Composer<_$QuranDatabase, $VersesTable> {
  $$VersesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get surahNumber => $composableBuilder(
    column: $table.surahNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get surahName => $composableBuilder(
    column: $table.surahName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get number => $composableBuilder(
    column: $table.number,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get textAr => $composableBuilder(
    column: $table.textAr,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get textEn => $composableBuilder(
    column: $table.textEn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get juz => $composableBuilder(
    column: $table.juz,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get page => $composableBuilder(
    column: $table.page,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get newJuz => $composableBuilder(
    column: $table.newJuz,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$VersesTableAnnotationComposer
    extends Composer<_$QuranDatabase, $VersesTable> {
  $$VersesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get surahNumber => $composableBuilder(
    column: $table.surahNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get surahName =>
      $composableBuilder(column: $table.surahName, builder: (column) => column);

  GeneratedColumn<int> get number =>
      $composableBuilder(column: $table.number, builder: (column) => column);

  GeneratedColumn<String> get textAr =>
      $composableBuilder(column: $table.textAr, builder: (column) => column);

  GeneratedColumn<String> get textEn =>
      $composableBuilder(column: $table.textEn, builder: (column) => column);

  GeneratedColumn<int> get juz =>
      $composableBuilder(column: $table.juz, builder: (column) => column);

  GeneratedColumn<int> get page =>
      $composableBuilder(column: $table.page, builder: (column) => column);

  GeneratedColumn<int> get newJuz =>
      $composableBuilder(column: $table.newJuz, builder: (column) => column);
}

class $$VersesTableTableManager
    extends
        RootTableManager<
          _$QuranDatabase,
          $VersesTable,
          Verse,
          $$VersesTableFilterComposer,
          $$VersesTableOrderingComposer,
          $$VersesTableAnnotationComposer,
          $$VersesTableCreateCompanionBuilder,
          $$VersesTableUpdateCompanionBuilder,
          (Verse, BaseReferences<_$QuranDatabase, $VersesTable, Verse>),
          Verse,
          PrefetchHooks Function()
        > {
  $$VersesTableTableManager(_$QuranDatabase db, $VersesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VersesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VersesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VersesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> surahNumber = const Value.absent(),
                Value<String> surahName = const Value.absent(),
                Value<int> number = const Value.absent(),
                Value<String> textAr = const Value.absent(),
                Value<String> textEn = const Value.absent(),
                Value<int> juz = const Value.absent(),
                Value<int> page = const Value.absent(),
                Value<int> newJuz = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => VersesCompanion(
                surahNumber: surahNumber,
                surahName: surahName,
                number: number,
                textAr: textAr,
                textEn: textEn,
                juz: juz,
                page: page,
                newJuz: newJuz,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int surahNumber,
                required String surahName,
                required int number,
                required String textAr,
                required String textEn,
                required int juz,
                required int page,
                required int newJuz,
                Value<int> rowid = const Value.absent(),
              }) => VersesCompanion.insert(
                surahNumber: surahNumber,
                surahName: surahName,
                number: number,
                textAr: textAr,
                textEn: textEn,
                juz: juz,
                page: page,
                newJuz: newJuz,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$VersesTableProcessedTableManager =
    ProcessedTableManager<
      _$QuranDatabase,
      $VersesTable,
      Verse,
      $$VersesTableFilterComposer,
      $$VersesTableOrderingComposer,
      $$VersesTableAnnotationComposer,
      $$VersesTableCreateCompanionBuilder,
      $$VersesTableUpdateCompanionBuilder,
      (Verse, BaseReferences<_$QuranDatabase, $VersesTable, Verse>),
      Verse,
      PrefetchHooks Function()
    >;

class $QuranDatabaseManager {
  final _$QuranDatabase _db;
  $QuranDatabaseManager(this._db);
  $$SurahsTableTableManager get surahs =>
      $$SurahsTableTableManager(_db, _db.surahs);
  $$VersesTableTableManager get verses =>
      $$VersesTableTableManager(_db, _db.verses);
}
