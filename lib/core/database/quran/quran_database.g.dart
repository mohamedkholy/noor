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

class $DailyVersesTable extends DailyVerses
    with TableInfo<$DailyVersesTable, DailyVerse> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DailyVersesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _dayMeta = const VerificationMeta('day');
  @override
  late final GeneratedColumn<int> day = GeneratedColumn<int>(
    'day',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
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
  List<GeneratedColumn> get $columns => [day, surahNumber, number];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'daily_verses';
  @override
  VerificationContext validateIntegrity(
    Insertable<DailyVerse> instance, {
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
  Set<GeneratedColumn> get $primaryKey => {day, surahNumber, number};
  @override
  DailyVerse map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DailyVerse(
      day: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}day'],
      )!,
      surahNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}surah_number'],
      )!,
      number: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}number'],
      )!,
    );
  }

  @override
  $DailyVersesTable createAlias(String alias) {
    return $DailyVersesTable(attachedDatabase, alias);
  }
}

class DailyVerse extends DataClass implements Insertable<DailyVerse> {
  final int day;
  final int surahNumber;
  final int number;
  const DailyVerse({
    required this.day,
    required this.surahNumber,
    required this.number,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['day'] = Variable<int>(day);
    map['surah_number'] = Variable<int>(surahNumber);
    map['number'] = Variable<int>(number);
    return map;
  }

  DailyVersesCompanion toCompanion(bool nullToAbsent) {
    return DailyVersesCompanion(
      day: Value(day),
      surahNumber: Value(surahNumber),
      number: Value(number),
    );
  }

  factory DailyVerse.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DailyVerse(
      day: serializer.fromJson<int>(json['day']),
      surahNumber: serializer.fromJson<int>(json['surahNumber']),
      number: serializer.fromJson<int>(json['number']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'day': serializer.toJson<int>(day),
      'surahNumber': serializer.toJson<int>(surahNumber),
      'number': serializer.toJson<int>(number),
    };
  }

  DailyVerse copyWith({int? day, int? surahNumber, int? number}) => DailyVerse(
    day: day ?? this.day,
    surahNumber: surahNumber ?? this.surahNumber,
    number: number ?? this.number,
  );
  DailyVerse copyWithCompanion(DailyVersesCompanion data) {
    return DailyVerse(
      day: data.day.present ? data.day.value : this.day,
      surahNumber: data.surahNumber.present
          ? data.surahNumber.value
          : this.surahNumber,
      number: data.number.present ? data.number.value : this.number,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DailyVerse(')
          ..write('day: $day, ')
          ..write('surahNumber: $surahNumber, ')
          ..write('number: $number')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(day, surahNumber, number);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DailyVerse &&
          other.day == this.day &&
          other.surahNumber == this.surahNumber &&
          other.number == this.number);
}

class DailyVersesCompanion extends UpdateCompanion<DailyVerse> {
  final Value<int> day;
  final Value<int> surahNumber;
  final Value<int> number;
  final Value<int> rowid;
  const DailyVersesCompanion({
    this.day = const Value.absent(),
    this.surahNumber = const Value.absent(),
    this.number = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DailyVersesCompanion.insert({
    required int day,
    required int surahNumber,
    required int number,
    this.rowid = const Value.absent(),
  }) : day = Value(day),
       surahNumber = Value(surahNumber),
       number = Value(number);
  static Insertable<DailyVerse> custom({
    Expression<int>? day,
    Expression<int>? surahNumber,
    Expression<int>? number,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (day != null) 'day': day,
      if (surahNumber != null) 'surah_number': surahNumber,
      if (number != null) 'number': number,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DailyVersesCompanion copyWith({
    Value<int>? day,
    Value<int>? surahNumber,
    Value<int>? number,
    Value<int>? rowid,
  }) {
    return DailyVersesCompanion(
      day: day ?? this.day,
      surahNumber: surahNumber ?? this.surahNumber,
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
    if (surahNumber.present) {
      map['surah_number'] = Variable<int>(surahNumber.value);
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
    return (StringBuffer('DailyVersesCompanion(')
          ..write('day: $day, ')
          ..write('surahNumber: $surahNumber, ')
          ..write('number: $number, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LinesTable extends Lines with TableInfo<$LinesTable, Line> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LinesTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _lineNumberMeta = const VerificationMeta(
    'lineNumber',
  );
  @override
  late final GeneratedColumn<int> lineNumber = GeneratedColumn<int>(
    'line_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lineTypeMeta = const VerificationMeta(
    'lineType',
  );
  @override
  late final GeneratedColumn<String> lineType = GeneratedColumn<String>(
    'line_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isCenteredMeta = const VerificationMeta(
    'isCentered',
  );
  @override
  late final GeneratedColumn<int> isCentered = GeneratedColumn<int>(
    'is_centered',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _firstWordIdMeta = const VerificationMeta(
    'firstWordId',
  );
  @override
  late final GeneratedColumn<int> firstWordId = GeneratedColumn<int>(
    'first_word_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastWordIdMeta = const VerificationMeta(
    'lastWordId',
  );
  @override
  late final GeneratedColumn<int> lastWordId = GeneratedColumn<int>(
    'last_word_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _surahNumberMeta = const VerificationMeta(
    'surahNumber',
  );
  @override
  late final GeneratedColumn<int> surahNumber = GeneratedColumn<int>(
    'surah_number',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    pageNumber,
    lineNumber,
    lineType,
    isCentered,
    firstWordId,
    lastWordId,
    surahNumber,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'lines';
  @override
  VerificationContext validateIntegrity(
    Insertable<Line> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('page_number')) {
      context.handle(
        _pageNumberMeta,
        pageNumber.isAcceptableOrUnknown(data['page_number']!, _pageNumberMeta),
      );
    } else if (isInserting) {
      context.missing(_pageNumberMeta);
    }
    if (data.containsKey('line_number')) {
      context.handle(
        _lineNumberMeta,
        lineNumber.isAcceptableOrUnknown(data['line_number']!, _lineNumberMeta),
      );
    } else if (isInserting) {
      context.missing(_lineNumberMeta);
    }
    if (data.containsKey('line_type')) {
      context.handle(
        _lineTypeMeta,
        lineType.isAcceptableOrUnknown(data['line_type']!, _lineTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_lineTypeMeta);
    }
    if (data.containsKey('is_centered')) {
      context.handle(
        _isCenteredMeta,
        isCentered.isAcceptableOrUnknown(data['is_centered']!, _isCenteredMeta),
      );
    } else if (isInserting) {
      context.missing(_isCenteredMeta);
    }
    if (data.containsKey('first_word_id')) {
      context.handle(
        _firstWordIdMeta,
        firstWordId.isAcceptableOrUnknown(
          data['first_word_id']!,
          _firstWordIdMeta,
        ),
      );
    }
    if (data.containsKey('last_word_id')) {
      context.handle(
        _lastWordIdMeta,
        lastWordId.isAcceptableOrUnknown(
          data['last_word_id']!,
          _lastWordIdMeta,
        ),
      );
    }
    if (data.containsKey('surah_number')) {
      context.handle(
        _surahNumberMeta,
        surahNumber.isAcceptableOrUnknown(
          data['surah_number']!,
          _surahNumberMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {pageNumber, lineNumber};
  @override
  Line map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Line(
      pageNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}page_number'],
      )!,
      lineNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}line_number'],
      )!,
      lineType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}line_type'],
      )!,
      isCentered: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}is_centered'],
      )!,
      firstWordId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}first_word_id'],
      ),
      lastWordId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}last_word_id'],
      ),
      surahNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}surah_number'],
      ),
    );
  }

  @override
  $LinesTable createAlias(String alias) {
    return $LinesTable(attachedDatabase, alias);
  }
}

class Line extends DataClass implements Insertable<Line> {
  final int pageNumber;
  final int lineNumber;
  final String lineType;
  final int isCentered;
  final int? firstWordId;
  final int? lastWordId;
  final int? surahNumber;
  const Line({
    required this.pageNumber,
    required this.lineNumber,
    required this.lineType,
    required this.isCentered,
    this.firstWordId,
    this.lastWordId,
    this.surahNumber,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['page_number'] = Variable<int>(pageNumber);
    map['line_number'] = Variable<int>(lineNumber);
    map['line_type'] = Variable<String>(lineType);
    map['is_centered'] = Variable<int>(isCentered);
    if (!nullToAbsent || firstWordId != null) {
      map['first_word_id'] = Variable<int>(firstWordId);
    }
    if (!nullToAbsent || lastWordId != null) {
      map['last_word_id'] = Variable<int>(lastWordId);
    }
    if (!nullToAbsent || surahNumber != null) {
      map['surah_number'] = Variable<int>(surahNumber);
    }
    return map;
  }

  LinesCompanion toCompanion(bool nullToAbsent) {
    return LinesCompanion(
      pageNumber: Value(pageNumber),
      lineNumber: Value(lineNumber),
      lineType: Value(lineType),
      isCentered: Value(isCentered),
      firstWordId: firstWordId == null && nullToAbsent
          ? const Value.absent()
          : Value(firstWordId),
      lastWordId: lastWordId == null && nullToAbsent
          ? const Value.absent()
          : Value(lastWordId),
      surahNumber: surahNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(surahNumber),
    );
  }

  factory Line.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Line(
      pageNumber: serializer.fromJson<int>(json['pageNumber']),
      lineNumber: serializer.fromJson<int>(json['lineNumber']),
      lineType: serializer.fromJson<String>(json['lineType']),
      isCentered: serializer.fromJson<int>(json['isCentered']),
      firstWordId: serializer.fromJson<int?>(json['firstWordId']),
      lastWordId: serializer.fromJson<int?>(json['lastWordId']),
      surahNumber: serializer.fromJson<int?>(json['surahNumber']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'pageNumber': serializer.toJson<int>(pageNumber),
      'lineNumber': serializer.toJson<int>(lineNumber),
      'lineType': serializer.toJson<String>(lineType),
      'isCentered': serializer.toJson<int>(isCentered),
      'firstWordId': serializer.toJson<int?>(firstWordId),
      'lastWordId': serializer.toJson<int?>(lastWordId),
      'surahNumber': serializer.toJson<int?>(surahNumber),
    };
  }

  Line copyWith({
    int? pageNumber,
    int? lineNumber,
    String? lineType,
    int? isCentered,
    Value<int?> firstWordId = const Value.absent(),
    Value<int?> lastWordId = const Value.absent(),
    Value<int?> surahNumber = const Value.absent(),
  }) => Line(
    pageNumber: pageNumber ?? this.pageNumber,
    lineNumber: lineNumber ?? this.lineNumber,
    lineType: lineType ?? this.lineType,
    isCentered: isCentered ?? this.isCentered,
    firstWordId: firstWordId.present ? firstWordId.value : this.firstWordId,
    lastWordId: lastWordId.present ? lastWordId.value : this.lastWordId,
    surahNumber: surahNumber.present ? surahNumber.value : this.surahNumber,
  );
  Line copyWithCompanion(LinesCompanion data) {
    return Line(
      pageNumber: data.pageNumber.present
          ? data.pageNumber.value
          : this.pageNumber,
      lineNumber: data.lineNumber.present
          ? data.lineNumber.value
          : this.lineNumber,
      lineType: data.lineType.present ? data.lineType.value : this.lineType,
      isCentered: data.isCentered.present
          ? data.isCentered.value
          : this.isCentered,
      firstWordId: data.firstWordId.present
          ? data.firstWordId.value
          : this.firstWordId,
      lastWordId: data.lastWordId.present
          ? data.lastWordId.value
          : this.lastWordId,
      surahNumber: data.surahNumber.present
          ? data.surahNumber.value
          : this.surahNumber,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Line(')
          ..write('pageNumber: $pageNumber, ')
          ..write('lineNumber: $lineNumber, ')
          ..write('lineType: $lineType, ')
          ..write('isCentered: $isCentered, ')
          ..write('firstWordId: $firstWordId, ')
          ..write('lastWordId: $lastWordId, ')
          ..write('surahNumber: $surahNumber')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    pageNumber,
    lineNumber,
    lineType,
    isCentered,
    firstWordId,
    lastWordId,
    surahNumber,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Line &&
          other.pageNumber == this.pageNumber &&
          other.lineNumber == this.lineNumber &&
          other.lineType == this.lineType &&
          other.isCentered == this.isCentered &&
          other.firstWordId == this.firstWordId &&
          other.lastWordId == this.lastWordId &&
          other.surahNumber == this.surahNumber);
}

class LinesCompanion extends UpdateCompanion<Line> {
  final Value<int> pageNumber;
  final Value<int> lineNumber;
  final Value<String> lineType;
  final Value<int> isCentered;
  final Value<int?> firstWordId;
  final Value<int?> lastWordId;
  final Value<int?> surahNumber;
  final Value<int> rowid;
  const LinesCompanion({
    this.pageNumber = const Value.absent(),
    this.lineNumber = const Value.absent(),
    this.lineType = const Value.absent(),
    this.isCentered = const Value.absent(),
    this.firstWordId = const Value.absent(),
    this.lastWordId = const Value.absent(),
    this.surahNumber = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LinesCompanion.insert({
    required int pageNumber,
    required int lineNumber,
    required String lineType,
    required int isCentered,
    this.firstWordId = const Value.absent(),
    this.lastWordId = const Value.absent(),
    this.surahNumber = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : pageNumber = Value(pageNumber),
       lineNumber = Value(lineNumber),
       lineType = Value(lineType),
       isCentered = Value(isCentered);
  static Insertable<Line> custom({
    Expression<int>? pageNumber,
    Expression<int>? lineNumber,
    Expression<String>? lineType,
    Expression<int>? isCentered,
    Expression<int>? firstWordId,
    Expression<int>? lastWordId,
    Expression<int>? surahNumber,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (pageNumber != null) 'page_number': pageNumber,
      if (lineNumber != null) 'line_number': lineNumber,
      if (lineType != null) 'line_type': lineType,
      if (isCentered != null) 'is_centered': isCentered,
      if (firstWordId != null) 'first_word_id': firstWordId,
      if (lastWordId != null) 'last_word_id': lastWordId,
      if (surahNumber != null) 'surah_number': surahNumber,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LinesCompanion copyWith({
    Value<int>? pageNumber,
    Value<int>? lineNumber,
    Value<String>? lineType,
    Value<int>? isCentered,
    Value<int?>? firstWordId,
    Value<int?>? lastWordId,
    Value<int?>? surahNumber,
    Value<int>? rowid,
  }) {
    return LinesCompanion(
      pageNumber: pageNumber ?? this.pageNumber,
      lineNumber: lineNumber ?? this.lineNumber,
      lineType: lineType ?? this.lineType,
      isCentered: isCentered ?? this.isCentered,
      firstWordId: firstWordId ?? this.firstWordId,
      lastWordId: lastWordId ?? this.lastWordId,
      surahNumber: surahNumber ?? this.surahNumber,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (pageNumber.present) {
      map['page_number'] = Variable<int>(pageNumber.value);
    }
    if (lineNumber.present) {
      map['line_number'] = Variable<int>(lineNumber.value);
    }
    if (lineType.present) {
      map['line_type'] = Variable<String>(lineType.value);
    }
    if (isCentered.present) {
      map['is_centered'] = Variable<int>(isCentered.value);
    }
    if (firstWordId.present) {
      map['first_word_id'] = Variable<int>(firstWordId.value);
    }
    if (lastWordId.present) {
      map['last_word_id'] = Variable<int>(lastWordId.value);
    }
    if (surahNumber.present) {
      map['surah_number'] = Variable<int>(surahNumber.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LinesCompanion(')
          ..write('pageNumber: $pageNumber, ')
          ..write('lineNumber: $lineNumber, ')
          ..write('lineType: $lineType, ')
          ..write('isCentered: $isCentered, ')
          ..write('firstWordId: $firstWordId, ')
          ..write('lastWordId: $lastWordId, ')
          ..write('surahNumber: $surahNumber, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WordsTable extends Words with TableInfo<$WordsTable, Word> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _locationMeta = const VerificationMeta(
    'location',
  );
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
    'location',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _surahMeta = const VerificationMeta('surah');
  @override
  late final GeneratedColumn<int> surah = GeneratedColumn<int>(
    'surah',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ayahMeta = const VerificationMeta('ayah');
  @override
  late final GeneratedColumn<int> ayah = GeneratedColumn<int>(
    'ayah',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _wordMeta = const VerificationMeta('word');
  @override
  late final GeneratedColumn<int> word = GeneratedColumn<int>(
    'word',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _wordTextMeta = const VerificationMeta(
    'wordText',
  );
  @override
  late final GeneratedColumn<String> wordText = GeneratedColumn<String>(
    'text',
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
  @override
  List<GeneratedColumn> get $columns => [
    id,
    location,
    surah,
    ayah,
    word,
    wordText,
    juz,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'words';
  @override
  VerificationContext validateIntegrity(
    Insertable<Word> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('location')) {
      context.handle(
        _locationMeta,
        location.isAcceptableOrUnknown(data['location']!, _locationMeta),
      );
    } else if (isInserting) {
      context.missing(_locationMeta);
    }
    if (data.containsKey('surah')) {
      context.handle(
        _surahMeta,
        surah.isAcceptableOrUnknown(data['surah']!, _surahMeta),
      );
    } else if (isInserting) {
      context.missing(_surahMeta);
    }
    if (data.containsKey('ayah')) {
      context.handle(
        _ayahMeta,
        ayah.isAcceptableOrUnknown(data['ayah']!, _ayahMeta),
      );
    } else if (isInserting) {
      context.missing(_ayahMeta);
    }
    if (data.containsKey('word')) {
      context.handle(
        _wordMeta,
        word.isAcceptableOrUnknown(data['word']!, _wordMeta),
      );
    } else if (isInserting) {
      context.missing(_wordMeta);
    }
    if (data.containsKey('text')) {
      context.handle(
        _wordTextMeta,
        wordText.isAcceptableOrUnknown(data['text']!, _wordTextMeta),
      );
    } else if (isInserting) {
      context.missing(_wordTextMeta);
    }
    if (data.containsKey('juz')) {
      context.handle(
        _juzMeta,
        juz.isAcceptableOrUnknown(data['juz']!, _juzMeta),
      );
    } else if (isInserting) {
      context.missing(_juzMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Word map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Word(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      location: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location'],
      )!,
      surah: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}surah'],
      )!,
      ayah: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ayah'],
      )!,
      word: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}word'],
      )!,
      wordText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}text'],
      )!,
      juz: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}juz'],
      )!,
    );
  }

  @override
  $WordsTable createAlias(String alias) {
    return $WordsTable(attachedDatabase, alias);
  }
}

class Word extends DataClass implements Insertable<Word> {
  final int id;
  final String location;
  final int surah;
  final int ayah;
  final int word;
  final String wordText;
  final int juz;
  const Word({
    required this.id,
    required this.location,
    required this.surah,
    required this.ayah,
    required this.word,
    required this.wordText,
    required this.juz,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['location'] = Variable<String>(location);
    map['surah'] = Variable<int>(surah);
    map['ayah'] = Variable<int>(ayah);
    map['word'] = Variable<int>(word);
    map['text'] = Variable<String>(wordText);
    map['juz'] = Variable<int>(juz);
    return map;
  }

  WordsCompanion toCompanion(bool nullToAbsent) {
    return WordsCompanion(
      id: Value(id),
      location: Value(location),
      surah: Value(surah),
      ayah: Value(ayah),
      word: Value(word),
      wordText: Value(wordText),
      juz: Value(juz),
    );
  }

  factory Word.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Word(
      id: serializer.fromJson<int>(json['id']),
      location: serializer.fromJson<String>(json['location']),
      surah: serializer.fromJson<int>(json['surah']),
      ayah: serializer.fromJson<int>(json['ayah']),
      word: serializer.fromJson<int>(json['word']),
      wordText: serializer.fromJson<String>(json['wordText']),
      juz: serializer.fromJson<int>(json['juz']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'location': serializer.toJson<String>(location),
      'surah': serializer.toJson<int>(surah),
      'ayah': serializer.toJson<int>(ayah),
      'word': serializer.toJson<int>(word),
      'wordText': serializer.toJson<String>(wordText),
      'juz': serializer.toJson<int>(juz),
    };
  }

  Word copyWith({
    int? id,
    String? location,
    int? surah,
    int? ayah,
    int? word,
    String? wordText,
    int? juz,
  }) => Word(
    id: id ?? this.id,
    location: location ?? this.location,
    surah: surah ?? this.surah,
    ayah: ayah ?? this.ayah,
    word: word ?? this.word,
    wordText: wordText ?? this.wordText,
    juz: juz ?? this.juz,
  );
  Word copyWithCompanion(WordsCompanion data) {
    return Word(
      id: data.id.present ? data.id.value : this.id,
      location: data.location.present ? data.location.value : this.location,
      surah: data.surah.present ? data.surah.value : this.surah,
      ayah: data.ayah.present ? data.ayah.value : this.ayah,
      word: data.word.present ? data.word.value : this.word,
      wordText: data.wordText.present ? data.wordText.value : this.wordText,
      juz: data.juz.present ? data.juz.value : this.juz,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Word(')
          ..write('id: $id, ')
          ..write('location: $location, ')
          ..write('surah: $surah, ')
          ..write('ayah: $ayah, ')
          ..write('word: $word, ')
          ..write('wordText: $wordText, ')
          ..write('juz: $juz')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, location, surah, ayah, word, wordText, juz);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Word &&
          other.id == this.id &&
          other.location == this.location &&
          other.surah == this.surah &&
          other.ayah == this.ayah &&
          other.word == this.word &&
          other.wordText == this.wordText &&
          other.juz == this.juz);
}

class WordsCompanion extends UpdateCompanion<Word> {
  final Value<int> id;
  final Value<String> location;
  final Value<int> surah;
  final Value<int> ayah;
  final Value<int> word;
  final Value<String> wordText;
  final Value<int> juz;
  const WordsCompanion({
    this.id = const Value.absent(),
    this.location = const Value.absent(),
    this.surah = const Value.absent(),
    this.ayah = const Value.absent(),
    this.word = const Value.absent(),
    this.wordText = const Value.absent(),
    this.juz = const Value.absent(),
  });
  WordsCompanion.insert({
    this.id = const Value.absent(),
    required String location,
    required int surah,
    required int ayah,
    required int word,
    required String wordText,
    required int juz,
  }) : location = Value(location),
       surah = Value(surah),
       ayah = Value(ayah),
       word = Value(word),
       wordText = Value(wordText),
       juz = Value(juz);
  static Insertable<Word> custom({
    Expression<int>? id,
    Expression<String>? location,
    Expression<int>? surah,
    Expression<int>? ayah,
    Expression<int>? word,
    Expression<String>? wordText,
    Expression<int>? juz,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (location != null) 'location': location,
      if (surah != null) 'surah': surah,
      if (ayah != null) 'ayah': ayah,
      if (word != null) 'word': word,
      if (wordText != null) 'text': wordText,
      if (juz != null) 'juz': juz,
    });
  }

  WordsCompanion copyWith({
    Value<int>? id,
    Value<String>? location,
    Value<int>? surah,
    Value<int>? ayah,
    Value<int>? word,
    Value<String>? wordText,
    Value<int>? juz,
  }) {
    return WordsCompanion(
      id: id ?? this.id,
      location: location ?? this.location,
      surah: surah ?? this.surah,
      ayah: ayah ?? this.ayah,
      word: word ?? this.word,
      wordText: wordText ?? this.wordText,
      juz: juz ?? this.juz,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (surah.present) {
      map['surah'] = Variable<int>(surah.value);
    }
    if (ayah.present) {
      map['ayah'] = Variable<int>(ayah.value);
    }
    if (word.present) {
      map['word'] = Variable<int>(word.value);
    }
    if (wordText.present) {
      map['text'] = Variable<String>(wordText.value);
    }
    if (juz.present) {
      map['juz'] = Variable<int>(juz.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WordsCompanion(')
          ..write('id: $id, ')
          ..write('location: $location, ')
          ..write('surah: $surah, ')
          ..write('ayah: $ayah, ')
          ..write('word: $word, ')
          ..write('wordText: $wordText, ')
          ..write('juz: $juz')
          ..write(')'))
        .toString();
  }
}

abstract class _$QuranDatabase extends GeneratedDatabase {
  _$QuranDatabase(QueryExecutor e) : super(e);
  $QuranDatabaseManager get managers => $QuranDatabaseManager(this);
  late final $SurahsTable surahs = $SurahsTable(this);
  late final $VersesTable verses = $VersesTable(this);
  late final $DailyVersesTable dailyVerses = $DailyVersesTable(this);
  late final $LinesTable lines = $LinesTable(this);
  late final $WordsTable words = $WordsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    surahs,
    verses,
    dailyVerses,
    lines,
    words,
  ];
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
typedef $$DailyVersesTableCreateCompanionBuilder =
    DailyVersesCompanion Function({
      required int day,
      required int surahNumber,
      required int number,
      Value<int> rowid,
    });
typedef $$DailyVersesTableUpdateCompanionBuilder =
    DailyVersesCompanion Function({
      Value<int> day,
      Value<int> surahNumber,
      Value<int> number,
      Value<int> rowid,
    });

class $$DailyVersesTableFilterComposer
    extends Composer<_$QuranDatabase, $DailyVersesTable> {
  $$DailyVersesTableFilterComposer({
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

  ColumnFilters<int> get surahNumber => $composableBuilder(
    column: $table.surahNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get number => $composableBuilder(
    column: $table.number,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DailyVersesTableOrderingComposer
    extends Composer<_$QuranDatabase, $DailyVersesTable> {
  $$DailyVersesTableOrderingComposer({
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

  ColumnOrderings<int> get surahNumber => $composableBuilder(
    column: $table.surahNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get number => $composableBuilder(
    column: $table.number,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DailyVersesTableAnnotationComposer
    extends Composer<_$QuranDatabase, $DailyVersesTable> {
  $$DailyVersesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get day =>
      $composableBuilder(column: $table.day, builder: (column) => column);

  GeneratedColumn<int> get surahNumber => $composableBuilder(
    column: $table.surahNumber,
    builder: (column) => column,
  );

  GeneratedColumn<int> get number =>
      $composableBuilder(column: $table.number, builder: (column) => column);
}

class $$DailyVersesTableTableManager
    extends
        RootTableManager<
          _$QuranDatabase,
          $DailyVersesTable,
          DailyVerse,
          $$DailyVersesTableFilterComposer,
          $$DailyVersesTableOrderingComposer,
          $$DailyVersesTableAnnotationComposer,
          $$DailyVersesTableCreateCompanionBuilder,
          $$DailyVersesTableUpdateCompanionBuilder,
          (
            DailyVerse,
            BaseReferences<_$QuranDatabase, $DailyVersesTable, DailyVerse>,
          ),
          DailyVerse,
          PrefetchHooks Function()
        > {
  $$DailyVersesTableTableManager(_$QuranDatabase db, $DailyVersesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DailyVersesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DailyVersesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DailyVersesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> day = const Value.absent(),
                Value<int> surahNumber = const Value.absent(),
                Value<int> number = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DailyVersesCompanion(
                day: day,
                surahNumber: surahNumber,
                number: number,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int day,
                required int surahNumber,
                required int number,
                Value<int> rowid = const Value.absent(),
              }) => DailyVersesCompanion.insert(
                day: day,
                surahNumber: surahNumber,
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

typedef $$DailyVersesTableProcessedTableManager =
    ProcessedTableManager<
      _$QuranDatabase,
      $DailyVersesTable,
      DailyVerse,
      $$DailyVersesTableFilterComposer,
      $$DailyVersesTableOrderingComposer,
      $$DailyVersesTableAnnotationComposer,
      $$DailyVersesTableCreateCompanionBuilder,
      $$DailyVersesTableUpdateCompanionBuilder,
      (
        DailyVerse,
        BaseReferences<_$QuranDatabase, $DailyVersesTable, DailyVerse>,
      ),
      DailyVerse,
      PrefetchHooks Function()
    >;
typedef $$LinesTableCreateCompanionBuilder =
    LinesCompanion Function({
      required int pageNumber,
      required int lineNumber,
      required String lineType,
      required int isCentered,
      Value<int?> firstWordId,
      Value<int?> lastWordId,
      Value<int?> surahNumber,
      Value<int> rowid,
    });
typedef $$LinesTableUpdateCompanionBuilder =
    LinesCompanion Function({
      Value<int> pageNumber,
      Value<int> lineNumber,
      Value<String> lineType,
      Value<int> isCentered,
      Value<int?> firstWordId,
      Value<int?> lastWordId,
      Value<int?> surahNumber,
      Value<int> rowid,
    });

class $$LinesTableFilterComposer
    extends Composer<_$QuranDatabase, $LinesTable> {
  $$LinesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get pageNumber => $composableBuilder(
    column: $table.pageNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lineNumber => $composableBuilder(
    column: $table.lineNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lineType => $composableBuilder(
    column: $table.lineType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get isCentered => $composableBuilder(
    column: $table.isCentered,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get firstWordId => $composableBuilder(
    column: $table.firstWordId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lastWordId => $composableBuilder(
    column: $table.lastWordId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get surahNumber => $composableBuilder(
    column: $table.surahNumber,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LinesTableOrderingComposer
    extends Composer<_$QuranDatabase, $LinesTable> {
  $$LinesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get pageNumber => $composableBuilder(
    column: $table.pageNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lineNumber => $composableBuilder(
    column: $table.lineNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lineType => $composableBuilder(
    column: $table.lineType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get isCentered => $composableBuilder(
    column: $table.isCentered,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get firstWordId => $composableBuilder(
    column: $table.firstWordId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lastWordId => $composableBuilder(
    column: $table.lastWordId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get surahNumber => $composableBuilder(
    column: $table.surahNumber,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LinesTableAnnotationComposer
    extends Composer<_$QuranDatabase, $LinesTable> {
  $$LinesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get pageNumber => $composableBuilder(
    column: $table.pageNumber,
    builder: (column) => column,
  );

  GeneratedColumn<int> get lineNumber => $composableBuilder(
    column: $table.lineNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lineType =>
      $composableBuilder(column: $table.lineType, builder: (column) => column);

  GeneratedColumn<int> get isCentered => $composableBuilder(
    column: $table.isCentered,
    builder: (column) => column,
  );

  GeneratedColumn<int> get firstWordId => $composableBuilder(
    column: $table.firstWordId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get lastWordId => $composableBuilder(
    column: $table.lastWordId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get surahNumber => $composableBuilder(
    column: $table.surahNumber,
    builder: (column) => column,
  );
}

class $$LinesTableTableManager
    extends
        RootTableManager<
          _$QuranDatabase,
          $LinesTable,
          Line,
          $$LinesTableFilterComposer,
          $$LinesTableOrderingComposer,
          $$LinesTableAnnotationComposer,
          $$LinesTableCreateCompanionBuilder,
          $$LinesTableUpdateCompanionBuilder,
          (Line, BaseReferences<_$QuranDatabase, $LinesTable, Line>),
          Line,
          PrefetchHooks Function()
        > {
  $$LinesTableTableManager(_$QuranDatabase db, $LinesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LinesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LinesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LinesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> pageNumber = const Value.absent(),
                Value<int> lineNumber = const Value.absent(),
                Value<String> lineType = const Value.absent(),
                Value<int> isCentered = const Value.absent(),
                Value<int?> firstWordId = const Value.absent(),
                Value<int?> lastWordId = const Value.absent(),
                Value<int?> surahNumber = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LinesCompanion(
                pageNumber: pageNumber,
                lineNumber: lineNumber,
                lineType: lineType,
                isCentered: isCentered,
                firstWordId: firstWordId,
                lastWordId: lastWordId,
                surahNumber: surahNumber,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int pageNumber,
                required int lineNumber,
                required String lineType,
                required int isCentered,
                Value<int?> firstWordId = const Value.absent(),
                Value<int?> lastWordId = const Value.absent(),
                Value<int?> surahNumber = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LinesCompanion.insert(
                pageNumber: pageNumber,
                lineNumber: lineNumber,
                lineType: lineType,
                isCentered: isCentered,
                firstWordId: firstWordId,
                lastWordId: lastWordId,
                surahNumber: surahNumber,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LinesTableProcessedTableManager =
    ProcessedTableManager<
      _$QuranDatabase,
      $LinesTable,
      Line,
      $$LinesTableFilterComposer,
      $$LinesTableOrderingComposer,
      $$LinesTableAnnotationComposer,
      $$LinesTableCreateCompanionBuilder,
      $$LinesTableUpdateCompanionBuilder,
      (Line, BaseReferences<_$QuranDatabase, $LinesTable, Line>),
      Line,
      PrefetchHooks Function()
    >;
typedef $$WordsTableCreateCompanionBuilder =
    WordsCompanion Function({
      Value<int> id,
      required String location,
      required int surah,
      required int ayah,
      required int word,
      required String wordText,
      required int juz,
    });
typedef $$WordsTableUpdateCompanionBuilder =
    WordsCompanion Function({
      Value<int> id,
      Value<String> location,
      Value<int> surah,
      Value<int> ayah,
      Value<int> word,
      Value<String> wordText,
      Value<int> juz,
    });

class $$WordsTableFilterComposer
    extends Composer<_$QuranDatabase, $WordsTable> {
  $$WordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get surah => $composableBuilder(
    column: $table.surah,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get ayah => $composableBuilder(
    column: $table.ayah,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get word => $composableBuilder(
    column: $table.word,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get wordText => $composableBuilder(
    column: $table.wordText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get juz => $composableBuilder(
    column: $table.juz,
    builder: (column) => ColumnFilters(column),
  );
}

class $$WordsTableOrderingComposer
    extends Composer<_$QuranDatabase, $WordsTable> {
  $$WordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get surah => $composableBuilder(
    column: $table.surah,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get ayah => $composableBuilder(
    column: $table.ayah,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get word => $composableBuilder(
    column: $table.word,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get wordText => $composableBuilder(
    column: $table.wordText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get juz => $composableBuilder(
    column: $table.juz,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WordsTableAnnotationComposer
    extends Composer<_$QuranDatabase, $WordsTable> {
  $$WordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<int> get surah =>
      $composableBuilder(column: $table.surah, builder: (column) => column);

  GeneratedColumn<int> get ayah =>
      $composableBuilder(column: $table.ayah, builder: (column) => column);

  GeneratedColumn<int> get word =>
      $composableBuilder(column: $table.word, builder: (column) => column);

  GeneratedColumn<String> get wordText =>
      $composableBuilder(column: $table.wordText, builder: (column) => column);

  GeneratedColumn<int> get juz =>
      $composableBuilder(column: $table.juz, builder: (column) => column);
}

class $$WordsTableTableManager
    extends
        RootTableManager<
          _$QuranDatabase,
          $WordsTable,
          Word,
          $$WordsTableFilterComposer,
          $$WordsTableOrderingComposer,
          $$WordsTableAnnotationComposer,
          $$WordsTableCreateCompanionBuilder,
          $$WordsTableUpdateCompanionBuilder,
          (Word, BaseReferences<_$QuranDatabase, $WordsTable, Word>),
          Word,
          PrefetchHooks Function()
        > {
  $$WordsTableTableManager(_$QuranDatabase db, $WordsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> location = const Value.absent(),
                Value<int> surah = const Value.absent(),
                Value<int> ayah = const Value.absent(),
                Value<int> word = const Value.absent(),
                Value<String> wordText = const Value.absent(),
                Value<int> juz = const Value.absent(),
              }) => WordsCompanion(
                id: id,
                location: location,
                surah: surah,
                ayah: ayah,
                word: word,
                wordText: wordText,
                juz: juz,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String location,
                required int surah,
                required int ayah,
                required int word,
                required String wordText,
                required int juz,
              }) => WordsCompanion.insert(
                id: id,
                location: location,
                surah: surah,
                ayah: ayah,
                word: word,
                wordText: wordText,
                juz: juz,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$WordsTableProcessedTableManager =
    ProcessedTableManager<
      _$QuranDatabase,
      $WordsTable,
      Word,
      $$WordsTableFilterComposer,
      $$WordsTableOrderingComposer,
      $$WordsTableAnnotationComposer,
      $$WordsTableCreateCompanionBuilder,
      $$WordsTableUpdateCompanionBuilder,
      (Word, BaseReferences<_$QuranDatabase, $WordsTable, Word>),
      Word,
      PrefetchHooks Function()
    >;

class $QuranDatabaseManager {
  final _$QuranDatabase _db;
  $QuranDatabaseManager(this._db);
  $$SurahsTableTableManager get surahs =>
      $$SurahsTableTableManager(_db, _db.surahs);
  $$VersesTableTableManager get verses =>
      $$VersesTableTableManager(_db, _db.verses);
  $$DailyVersesTableTableManager get dailyVerses =>
      $$DailyVersesTableTableManager(_db, _db.dailyVerses);
  $$LinesTableTableManager get lines =>
      $$LinesTableTableManager(_db, _db.lines);
  $$WordsTableTableManager get words =>
      $$WordsTableTableManager(_db, _db.words);
}
