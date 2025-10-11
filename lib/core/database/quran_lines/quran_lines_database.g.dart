// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_lines_database.dart';

// ignore_for_file: type=lint
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
  @override
  List<GeneratedColumn> get $columns => [
    id,
    location,
    surah,
    ayah,
    word,
    wordText,
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
  const Word({
    required this.id,
    required this.location,
    required this.surah,
    required this.ayah,
    required this.word,
    required this.wordText,
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
    };
  }

  Word copyWith({
    int? id,
    String? location,
    int? surah,
    int? ayah,
    int? word,
    String? wordText,
  }) => Word(
    id: id ?? this.id,
    location: location ?? this.location,
    surah: surah ?? this.surah,
    ayah: ayah ?? this.ayah,
    word: word ?? this.word,
    wordText: wordText ?? this.wordText,
  );
  Word copyWithCompanion(WordsCompanion data) {
    return Word(
      id: data.id.present ? data.id.value : this.id,
      location: data.location.present ? data.location.value : this.location,
      surah: data.surah.present ? data.surah.value : this.surah,
      ayah: data.ayah.present ? data.ayah.value : this.ayah,
      word: data.word.present ? data.word.value : this.word,
      wordText: data.wordText.present ? data.wordText.value : this.wordText,
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
          ..write('wordText: $wordText')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, location, surah, ayah, word, wordText);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Word &&
          other.id == this.id &&
          other.location == this.location &&
          other.surah == this.surah &&
          other.ayah == this.ayah &&
          other.word == this.word &&
          other.wordText == this.wordText);
}

class WordsCompanion extends UpdateCompanion<Word> {
  final Value<int> id;
  final Value<String> location;
  final Value<int> surah;
  final Value<int> ayah;
  final Value<int> word;
  final Value<String> wordText;
  const WordsCompanion({
    this.id = const Value.absent(),
    this.location = const Value.absent(),
    this.surah = const Value.absent(),
    this.ayah = const Value.absent(),
    this.word = const Value.absent(),
    this.wordText = const Value.absent(),
  });
  WordsCompanion.insert({
    this.id = const Value.absent(),
    required String location,
    required int surah,
    required int ayah,
    required int word,
    required String wordText,
  }) : location = Value(location),
       surah = Value(surah),
       ayah = Value(ayah),
       word = Value(word),
       wordText = Value(wordText);
  static Insertable<Word> custom({
    Expression<int>? id,
    Expression<String>? location,
    Expression<int>? surah,
    Expression<int>? ayah,
    Expression<int>? word,
    Expression<String>? wordText,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (location != null) 'location': location,
      if (surah != null) 'surah': surah,
      if (ayah != null) 'ayah': ayah,
      if (word != null) 'word': word,
      if (wordText != null) 'text': wordText,
    });
  }

  WordsCompanion copyWith({
    Value<int>? id,
    Value<String>? location,
    Value<int>? surah,
    Value<int>? ayah,
    Value<int>? word,
    Value<String>? wordText,
  }) {
    return WordsCompanion(
      id: id ?? this.id,
      location: location ?? this.location,
      surah: surah ?? this.surah,
      ayah: ayah ?? this.ayah,
      word: word ?? this.word,
      wordText: wordText ?? this.wordText,
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
          ..write('wordText: $wordText')
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

abstract class _$QuranLinesDatabase extends GeneratedDatabase {
  _$QuranLinesDatabase(QueryExecutor e) : super(e);
  $QuranLinesDatabaseManager get managers => $QuranLinesDatabaseManager(this);
  late final $WordsTable words = $WordsTable(this);
  late final $LinesTable lines = $LinesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [words, lines];
}

typedef $$WordsTableCreateCompanionBuilder =
    WordsCompanion Function({
      Value<int> id,
      required String location,
      required int surah,
      required int ayah,
      required int word,
      required String wordText,
    });
typedef $$WordsTableUpdateCompanionBuilder =
    WordsCompanion Function({
      Value<int> id,
      Value<String> location,
      Value<int> surah,
      Value<int> ayah,
      Value<int> word,
      Value<String> wordText,
    });

class $$WordsTableFilterComposer
    extends Composer<_$QuranLinesDatabase, $WordsTable> {
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
}

class $$WordsTableOrderingComposer
    extends Composer<_$QuranLinesDatabase, $WordsTable> {
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
}

class $$WordsTableAnnotationComposer
    extends Composer<_$QuranLinesDatabase, $WordsTable> {
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
}

class $$WordsTableTableManager
    extends
        RootTableManager<
          _$QuranLinesDatabase,
          $WordsTable,
          Word,
          $$WordsTableFilterComposer,
          $$WordsTableOrderingComposer,
          $$WordsTableAnnotationComposer,
          $$WordsTableCreateCompanionBuilder,
          $$WordsTableUpdateCompanionBuilder,
          (Word, BaseReferences<_$QuranLinesDatabase, $WordsTable, Word>),
          Word,
          PrefetchHooks Function()
        > {
  $$WordsTableTableManager(_$QuranLinesDatabase db, $WordsTable table)
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
              }) => WordsCompanion(
                id: id,
                location: location,
                surah: surah,
                ayah: ayah,
                word: word,
                wordText: wordText,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String location,
                required int surah,
                required int ayah,
                required int word,
                required String wordText,
              }) => WordsCompanion.insert(
                id: id,
                location: location,
                surah: surah,
                ayah: ayah,
                word: word,
                wordText: wordText,
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
      _$QuranLinesDatabase,
      $WordsTable,
      Word,
      $$WordsTableFilterComposer,
      $$WordsTableOrderingComposer,
      $$WordsTableAnnotationComposer,
      $$WordsTableCreateCompanionBuilder,
      $$WordsTableUpdateCompanionBuilder,
      (Word, BaseReferences<_$QuranLinesDatabase, $WordsTable, Word>),
      Word,
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
    extends Composer<_$QuranLinesDatabase, $LinesTable> {
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
    extends Composer<_$QuranLinesDatabase, $LinesTable> {
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
    extends Composer<_$QuranLinesDatabase, $LinesTable> {
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
          _$QuranLinesDatabase,
          $LinesTable,
          Line,
          $$LinesTableFilterComposer,
          $$LinesTableOrderingComposer,
          $$LinesTableAnnotationComposer,
          $$LinesTableCreateCompanionBuilder,
          $$LinesTableUpdateCompanionBuilder,
          (Line, BaseReferences<_$QuranLinesDatabase, $LinesTable, Line>),
          Line,
          PrefetchHooks Function()
        > {
  $$LinesTableTableManager(_$QuranLinesDatabase db, $LinesTable table)
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
      _$QuranLinesDatabase,
      $LinesTable,
      Line,
      $$LinesTableFilterComposer,
      $$LinesTableOrderingComposer,
      $$LinesTableAnnotationComposer,
      $$LinesTableCreateCompanionBuilder,
      $$LinesTableUpdateCompanionBuilder,
      (Line, BaseReferences<_$QuranLinesDatabase, $LinesTable, Line>),
      Line,
      PrefetchHooks Function()
    >;

class $QuranLinesDatabaseManager {
  final _$QuranLinesDatabase _db;
  $QuranLinesDatabaseManager(this._db);
  $$WordsTableTableManager get words =>
      $$WordsTableTableManager(_db, _db.words);
  $$LinesTableTableManager get lines =>
      $$LinesTableTableManager(_db, _db.lines);
}
