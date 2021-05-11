// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class BibleBookName extends DataClass implements Insertable<BibleBookName> {
  final String abbreviation;
  final String name;
  final String keywords;
  final String id;
  BibleBookName(
      {required this.abbreviation,
      required this.name,
      required this.keywords,
      required this.id});
  factory BibleBookName.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return BibleBookName(
      abbreviation: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}abbreviation'])!,
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      keywords: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}keywords'])!,
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['abbreviation'] = Variable<String>(abbreviation);
    map['name'] = Variable<String>(name);
    map['keywords'] = Variable<String>(keywords);
    map['id'] = Variable<String>(id);
    return map;
  }

  BibleBookNamesCompanion toCompanion(bool nullToAbsent) {
    return BibleBookNamesCompanion(
      abbreviation: Value(abbreviation),
      name: Value(name),
      keywords: Value(keywords),
      id: Value(id),
    );
  }

  factory BibleBookName.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return BibleBookName(
      abbreviation: serializer.fromJson<String>(json['abbreviation']),
      name: serializer.fromJson<String>(json['name']),
      keywords: serializer.fromJson<String>(json['keywords']),
      id: serializer.fromJson<String>(json['id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'abbreviation': serializer.toJson<String>(abbreviation),
      'name': serializer.toJson<String>(name),
      'keywords': serializer.toJson<String>(keywords),
      'id': serializer.toJson<String>(id),
    };
  }

  BibleBookName copyWith(
          {String? abbreviation, String? name, String? keywords, String? id}) =>
      BibleBookName(
        abbreviation: abbreviation ?? this.abbreviation,
        name: name ?? this.name,
        keywords: keywords ?? this.keywords,
        id: id ?? this.id,
      );
  @override
  String toString() {
    return (StringBuffer('BibleBookName(')
          ..write('abbreviation: $abbreviation, ')
          ..write('name: $name, ')
          ..write('keywords: $keywords, ')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(abbreviation.hashCode,
      $mrjc(name.hashCode, $mrjc(keywords.hashCode, id.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is BibleBookName &&
          other.abbreviation == this.abbreviation &&
          other.name == this.name &&
          other.keywords == this.keywords &&
          other.id == this.id);
}

class BibleBookNamesCompanion extends UpdateCompanion<BibleBookName> {
  final Value<String> abbreviation;
  final Value<String> name;
  final Value<String> keywords;
  final Value<String> id;
  const BibleBookNamesCompanion({
    this.abbreviation = const Value.absent(),
    this.name = const Value.absent(),
    this.keywords = const Value.absent(),
    this.id = const Value.absent(),
  });
  BibleBookNamesCompanion.insert({
    required String abbreviation,
    required String name,
    required String keywords,
    required String id,
  })   : abbreviation = Value(abbreviation),
        name = Value(name),
        keywords = Value(keywords),
        id = Value(id);
  static Insertable<BibleBookName> custom({
    Expression<String>? abbreviation,
    Expression<String>? name,
    Expression<String>? keywords,
    Expression<String>? id,
  }) {
    return RawValuesInsertable({
      if (abbreviation != null) 'abbreviation': abbreviation,
      if (name != null) 'name': name,
      if (keywords != null) 'keywords': keywords,
      if (id != null) 'id': id,
    });
  }

  BibleBookNamesCompanion copyWith(
      {Value<String>? abbreviation,
      Value<String>? name,
      Value<String>? keywords,
      Value<String>? id}) {
    return BibleBookNamesCompanion(
      abbreviation: abbreviation ?? this.abbreviation,
      name: name ?? this.name,
      keywords: keywords ?? this.keywords,
      id: id ?? this.id,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (abbreviation.present) {
      map['abbreviation'] = Variable<String>(abbreviation.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (keywords.present) {
      map['keywords'] = Variable<String>(keywords.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BibleBookNamesCompanion(')
          ..write('abbreviation: $abbreviation, ')
          ..write('name: $name, ')
          ..write('keywords: $keywords, ')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }
}

class BibleBookNames extends Table
    with
        TableInfo<BibleBookNames, BibleBookName>,
        VirtualTableInfo<BibleBookNames, BibleBookName> {
  final GeneratedDatabase _db;
  final String? _alias;
  BibleBookNames(this._db, [this._alias]);
  final VerificationMeta _abbreviationMeta =
      const VerificationMeta('abbreviation');
  late final GeneratedTextColumn abbreviation = _constructAbbreviation();
  GeneratedTextColumn _constructAbbreviation() {
    return GeneratedTextColumn('abbreviation', $tableName, false,
        $customConstraints: '');
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedTextColumn name = _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        $customConstraints: '');
  }

  final VerificationMeta _keywordsMeta = const VerificationMeta('keywords');
  late final GeneratedTextColumn keywords = _constructKeywords();
  GeneratedTextColumn _constructKeywords() {
    return GeneratedTextColumn('keywords', $tableName, false,
        $customConstraints: '');
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedTextColumn id = _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn('id', $tableName, false, $customConstraints: '');
  }

  @override
  List<GeneratedColumn> get $columns => [abbreviation, name, keywords, id];
  @override
  BibleBookNames get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'bible_book_names';
  @override
  final String actualTableName = 'bible_book_names';
  @override
  VerificationContext validateIntegrity(Insertable<BibleBookName> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('abbreviation')) {
      context.handle(
          _abbreviationMeta,
          abbreviation.isAcceptableOrUnknown(
              data['abbreviation']!, _abbreviationMeta));
    } else if (isInserting) {
      context.missing(_abbreviationMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('keywords')) {
      context.handle(_keywordsMeta,
          keywords.isAcceptableOrUnknown(data['keywords']!, _keywordsMeta));
    } else if (isInserting) {
      context.missing(_keywordsMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  BibleBookName map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return BibleBookName.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  BibleBookNames createAlias(String alias) {
    return BibleBookNames(_db, alias);
  }

  @override
  bool get dontWriteConstraints => true;
  @override
  String get moduleAndArgs =>
      'fts5(abbreviation, name, keywords, id UNINDEXED, content = \'bible_books\', tokenize = \'porter unicode61 remove_diacritics 2\')';
}

class Deed extends DataClass implements Insertable<Deed> {
  final int id;
  final String title;
  final String content;
  final bool archived;
  final DateTime created;
  final DateTime date;
  Deed(
      {required this.id,
      required this.title,
      required this.content,
      required this.archived,
      required this.created,
      required this.date});
  factory Deed.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Deed(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      content:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}text'])!,
      archived:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}archived'])!,
      created: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created'])!,
      date:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}date'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['text'] = Variable<String>(content);
    map['archived'] = Variable<bool>(archived);
    map['created'] = Variable<DateTime>(created);
    map['date'] = Variable<DateTime>(date);
    return map;
  }

  DeedsCompanion toCompanion(bool nullToAbsent) {
    return DeedsCompanion(
      id: Value(id),
      title: Value(title),
      content: Value(content),
      archived: Value(archived),
      created: Value(created),
      date: Value(date),
    );
  }

  factory Deed.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Deed(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      archived: serializer.fromJson<bool>(json['archived']),
      created: serializer.fromJson<DateTime>(json['created']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
      'archived': serializer.toJson<bool>(archived),
      'created': serializer.toJson<DateTime>(created),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  Deed copyWith(
          {int? id,
          String? title,
          String? content,
          bool? archived,
          DateTime? created,
          DateTime? date}) =>
      Deed(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
        archived: archived ?? this.archived,
        created: created ?? this.created,
        date: date ?? this.date,
      );
  @override
  String toString() {
    return (StringBuffer('Deed(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('archived: $archived, ')
          ..write('created: $created, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          title.hashCode,
          $mrjc(
              content.hashCode,
              $mrjc(archived.hashCode,
                  $mrjc(created.hashCode, date.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Deed &&
          other.id == this.id &&
          other.title == this.title &&
          other.content == this.content &&
          other.archived == this.archived &&
          other.created == this.created &&
          other.date == this.date);
}

class DeedsCompanion extends UpdateCompanion<Deed> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> content;
  final Value<bool> archived;
  final Value<DateTime> created;
  final Value<DateTime> date;
  const DeedsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.archived = const Value.absent(),
    this.created = const Value.absent(),
    this.date = const Value.absent(),
  });
  DeedsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.content = const Value.absent(),
    required bool archived,
    this.created = const Value.absent(),
    required DateTime date,
  })   : title = Value(title),
        archived = Value(archived),
        date = Value(date);
  static Insertable<Deed> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? content,
    Expression<bool>? archived,
    Expression<DateTime>? created,
    Expression<DateTime>? date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (content != null) 'text': content,
      if (archived != null) 'archived': archived,
      if (created != null) 'created': created,
      if (date != null) 'date': date,
    });
  }

  DeedsCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? content,
      Value<bool>? archived,
      Value<DateTime>? created,
      Value<DateTime>? date}) {
    return DeedsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      archived: archived ?? this.archived,
      created: created ?? this.created,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['text'] = Variable<String>(content.value);
    }
    if (archived.present) {
      map['archived'] = Variable<bool>(archived.value);
    }
    if (created.present) {
      map['created'] = Variable<DateTime>(created.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DeedsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('archived: $archived, ')
          ..write('created: $created, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

class $DeedsTable extends Deeds with TableInfo<$DeedsTable, Deed> {
  final GeneratedDatabase _db;
  final String? _alias;
  $DeedsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedTextColumn title = _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _contentMeta = const VerificationMeta('content');
  @override
  late final GeneratedTextColumn content = _constructContent();
  GeneratedTextColumn _constructContent() {
    return GeneratedTextColumn(
      'text',
      $tableName,
      false,
    )..clientDefault = () => "";
  }

  final VerificationMeta _archivedMeta = const VerificationMeta('archived');
  @override
  late final GeneratedBoolColumn archived = _constructArchived();
  GeneratedBoolColumn _constructArchived() {
    return GeneratedBoolColumn(
      'archived',
      $tableName,
      false,
    );
  }

  final VerificationMeta _createdMeta = const VerificationMeta('created');
  @override
  late final GeneratedDateTimeColumn created = _constructCreated();
  GeneratedDateTimeColumn _constructCreated() {
    return GeneratedDateTimeColumn('created', $tableName, false,
        defaultValue: currentDateAndTime);
  }

  final VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedDateTimeColumn date = _constructDate();
  GeneratedDateTimeColumn _constructDate() {
    return GeneratedDateTimeColumn(
      'date',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, title, content, archived, created, date];
  @override
  $DeedsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'deeds';
  @override
  final String actualTableName = 'deeds';
  @override
  VerificationContext validateIntegrity(Insertable<Deed> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('text')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['text']!, _contentMeta));
    }
    if (data.containsKey('archived')) {
      context.handle(_archivedMeta,
          archived.isAcceptableOrUnknown(data['archived']!, _archivedMeta));
    } else if (isInserting) {
      context.missing(_archivedMeta);
    }
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created']!, _createdMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Deed map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Deed.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $DeedsTable createAlias(String alias) {
    return $DeedsTable(_db, alias);
  }
}

class Decision extends DataClass implements Insertable<Decision> {
  final int id;
  final String title;
  final String content;
  final bool archived;
  final DateTime created;
  Decision(
      {required this.id,
      required this.title,
      required this.content,
      required this.archived,
      required this.created});
  factory Decision.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Decision(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      content:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}text'])!,
      archived:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}archived'])!,
      created: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['text'] = Variable<String>(content);
    map['archived'] = Variable<bool>(archived);
    map['created'] = Variable<DateTime>(created);
    return map;
  }

  DecisionsCompanion toCompanion(bool nullToAbsent) {
    return DecisionsCompanion(
      id: Value(id),
      title: Value(title),
      content: Value(content),
      archived: Value(archived),
      created: Value(created),
    );
  }

  factory Decision.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Decision(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      archived: serializer.fromJson<bool>(json['archived']),
      created: serializer.fromJson<DateTime>(json['created']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
      'archived': serializer.toJson<bool>(archived),
      'created': serializer.toJson<DateTime>(created),
    };
  }

  Decision copyWith(
          {int? id,
          String? title,
          String? content,
          bool? archived,
          DateTime? created}) =>
      Decision(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
        archived: archived ?? this.archived,
        created: created ?? this.created,
      );
  @override
  String toString() {
    return (StringBuffer('Decision(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('archived: $archived, ')
          ..write('created: $created')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          title.hashCode,
          $mrjc(
              content.hashCode, $mrjc(archived.hashCode, created.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Decision &&
          other.id == this.id &&
          other.title == this.title &&
          other.content == this.content &&
          other.archived == this.archived &&
          other.created == this.created);
}

class DecisionsCompanion extends UpdateCompanion<Decision> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> content;
  final Value<bool> archived;
  final Value<DateTime> created;
  const DecisionsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.archived = const Value.absent(),
    this.created = const Value.absent(),
  });
  DecisionsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.content = const Value.absent(),
    required bool archived,
    this.created = const Value.absent(),
  })  : title = Value(title),
        archived = Value(archived);
  static Insertable<Decision> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? content,
    Expression<bool>? archived,
    Expression<DateTime>? created,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (content != null) 'text': content,
      if (archived != null) 'archived': archived,
      if (created != null) 'created': created,
    });
  }

  DecisionsCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? content,
      Value<bool>? archived,
      Value<DateTime>? created}) {
    return DecisionsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      archived: archived ?? this.archived,
      created: created ?? this.created,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['text'] = Variable<String>(content.value);
    }
    if (archived.present) {
      map['archived'] = Variable<bool>(archived.value);
    }
    if (created.present) {
      map['created'] = Variable<DateTime>(created.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DecisionsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('archived: $archived, ')
          ..write('created: $created')
          ..write(')'))
        .toString();
  }
}

class $DecisionsTable extends Decisions
    with TableInfo<$DecisionsTable, Decision> {
  final GeneratedDatabase _db;
  final String? _alias;
  $DecisionsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedTextColumn title = _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _contentMeta = const VerificationMeta('content');
  @override
  late final GeneratedTextColumn content = _constructContent();
  GeneratedTextColumn _constructContent() {
    return GeneratedTextColumn(
      'text',
      $tableName,
      false,
    )..clientDefault = () => "";
  }

  final VerificationMeta _archivedMeta = const VerificationMeta('archived');
  @override
  late final GeneratedBoolColumn archived = _constructArchived();
  GeneratedBoolColumn _constructArchived() {
    return GeneratedBoolColumn(
      'archived',
      $tableName,
      false,
    );
  }

  final VerificationMeta _createdMeta = const VerificationMeta('created');
  @override
  late final GeneratedDateTimeColumn created = _constructCreated();
  GeneratedDateTimeColumn _constructCreated() {
    return GeneratedDateTimeColumn('created', $tableName, false,
        defaultValue: currentDateAndTime);
  }

  @override
  List<GeneratedColumn> get $columns => [id, title, content, archived, created];
  @override
  $DecisionsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'decisions';
  @override
  final String actualTableName = 'decisions';
  @override
  VerificationContext validateIntegrity(Insertable<Decision> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('text')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['text']!, _contentMeta));
    }
    if (data.containsKey('archived')) {
      context.handle(_archivedMeta,
          archived.isAcceptableOrUnknown(data['archived']!, _archivedMeta));
    } else if (isInserting) {
      context.missing(_archivedMeta);
    }
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created']!, _createdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Decision map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Decision.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $DecisionsTable createAlias(String alias) {
    return $DecisionsTable(_db, alias);
  }
}

class DecisionRating extends DataClass implements Insertable<DecisionRating> {
  final DateTime date;
  final int rating;
  final int decisionId;
  DecisionRating(
      {required this.date, required this.rating, required this.decisionId});
  factory DecisionRating.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final intType = db.typeSystem.forDartType<int>();
    return DecisionRating(
      date:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}date'])!,
      rating:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}rating'])!,
      decisionId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}decision_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['date'] = Variable<DateTime>(date);
    map['rating'] = Variable<int>(rating);
    map['decision_id'] = Variable<int>(decisionId);
    return map;
  }

  DecisionRatingsCompanion toCompanion(bool nullToAbsent) {
    return DecisionRatingsCompanion(
      date: Value(date),
      rating: Value(rating),
      decisionId: Value(decisionId),
    );
  }

  factory DecisionRating.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DecisionRating(
      date: serializer.fromJson<DateTime>(json['date']),
      rating: serializer.fromJson<int>(json['rating']),
      decisionId: serializer.fromJson<int>(json['decisionId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'date': serializer.toJson<DateTime>(date),
      'rating': serializer.toJson<int>(rating),
      'decisionId': serializer.toJson<int>(decisionId),
    };
  }

  DecisionRating copyWith({DateTime? date, int? rating, int? decisionId}) =>
      DecisionRating(
        date: date ?? this.date,
        rating: rating ?? this.rating,
        decisionId: decisionId ?? this.decisionId,
      );
  @override
  String toString() {
    return (StringBuffer('DecisionRating(')
          ..write('date: $date, ')
          ..write('rating: $rating, ')
          ..write('decisionId: $decisionId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(date.hashCode, $mrjc(rating.hashCode, decisionId.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is DecisionRating &&
          other.date == this.date &&
          other.rating == this.rating &&
          other.decisionId == this.decisionId);
}

class DecisionRatingsCompanion extends UpdateCompanion<DecisionRating> {
  final Value<DateTime> date;
  final Value<int> rating;
  final Value<int> decisionId;
  const DecisionRatingsCompanion({
    this.date = const Value.absent(),
    this.rating = const Value.absent(),
    this.decisionId = const Value.absent(),
  });
  DecisionRatingsCompanion.insert({
    required DateTime date,
    required int rating,
    required int decisionId,
  })   : date = Value(date),
        rating = Value(rating),
        decisionId = Value(decisionId);
  static Insertable<DecisionRating> custom({
    Expression<DateTime>? date,
    Expression<int>? rating,
    Expression<int>? decisionId,
  }) {
    return RawValuesInsertable({
      if (date != null) 'date': date,
      if (rating != null) 'rating': rating,
      if (decisionId != null) 'decision_id': decisionId,
    });
  }

  DecisionRatingsCompanion copyWith(
      {Value<DateTime>? date, Value<int>? rating, Value<int>? decisionId}) {
    return DecisionRatingsCompanion(
      date: date ?? this.date,
      rating: rating ?? this.rating,
      decisionId: decisionId ?? this.decisionId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (rating.present) {
      map['rating'] = Variable<int>(rating.value);
    }
    if (decisionId.present) {
      map['decision_id'] = Variable<int>(decisionId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DecisionRatingsCompanion(')
          ..write('date: $date, ')
          ..write('rating: $rating, ')
          ..write('decisionId: $decisionId')
          ..write(')'))
        .toString();
  }
}

class $DecisionRatingsTable extends DecisionRatings
    with TableInfo<$DecisionRatingsTable, DecisionRating> {
  final GeneratedDatabase _db;
  final String? _alias;
  $DecisionRatingsTable(this._db, [this._alias]);
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedDateTimeColumn date = _constructDate();
  GeneratedDateTimeColumn _constructDate() {
    return GeneratedDateTimeColumn(
      'date',
      $tableName,
      false,
    );
  }

  final VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedIntColumn rating = _constructRating();
  GeneratedIntColumn _constructRating() {
    return GeneratedIntColumn(
      'rating',
      $tableName,
      false,
    );
  }

  final VerificationMeta _decisionIdMeta = const VerificationMeta('decisionId');
  @override
  late final GeneratedIntColumn decisionId = _constructDecisionId();
  GeneratedIntColumn _constructDecisionId() {
    return GeneratedIntColumn('decision_id', $tableName, false,
        $customConstraints: 'REFERENCES decisions(id)');
  }

  @override
  List<GeneratedColumn> get $columns => [date, rating, decisionId];
  @override
  $DecisionRatingsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'decision_ratings';
  @override
  final String actualTableName = 'decision_ratings';
  @override
  VerificationContext validateIntegrity(Insertable<DecisionRating> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(_ratingMeta,
          rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta));
    } else if (isInserting) {
      context.missing(_ratingMeta);
    }
    if (data.containsKey('decision_id')) {
      context.handle(
          _decisionIdMeta,
          decisionId.isAcceptableOrUnknown(
              data['decision_id']!, _decisionIdMeta));
    } else if (isInserting) {
      context.missing(_decisionIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {date, decisionId};
  @override
  DecisionRating map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return DecisionRating.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $DecisionRatingsTable createAlias(String alias) {
    return $DecisionRatingsTable(_db, alias);
  }
}

class Confession extends DataClass implements Insertable<Confession> {
  final DateTime date;
  Confession({required this.date});
  factory Confession.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Confession(
      date:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}date'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['date'] = Variable<DateTime>(date);
    return map;
  }

  ConfessionsCompanion toCompanion(bool nullToAbsent) {
    return ConfessionsCompanion(
      date: Value(date),
    );
  }

  factory Confession.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Confession(
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'date': serializer.toJson<DateTime>(date),
    };
  }

  Confession copyWith({DateTime? date}) => Confession(
        date: date ?? this.date,
      );
  @override
  String toString() {
    return (StringBuffer('Confession(')..write('date: $date')..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf(date.hashCode);
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Confession && other.date == this.date);
}

class ConfessionsCompanion extends UpdateCompanion<Confession> {
  final Value<DateTime> date;
  const ConfessionsCompanion({
    this.date = const Value.absent(),
  });
  ConfessionsCompanion.insert({
    required DateTime date,
  }) : date = Value(date);
  static Insertable<Confession> custom({
    Expression<DateTime>? date,
  }) {
    return RawValuesInsertable({
      if (date != null) 'date': date,
    });
  }

  ConfessionsCompanion copyWith({Value<DateTime>? date}) {
    return ConfessionsCompanion(
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ConfessionsCompanion(')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

class $ConfessionsTable extends Confessions
    with TableInfo<$ConfessionsTable, Confession> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ConfessionsTable(this._db, [this._alias]);
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedDateTimeColumn date = _constructDate();
  GeneratedDateTimeColumn _constructDate() {
    return GeneratedDateTimeColumn(
      'date',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [date];
  @override
  $ConfessionsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'confessions';
  @override
  final String actualTableName = 'confessions';
  @override
  VerificationContext validateIntegrity(Insertable<Confession> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {date};
  @override
  Confession map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Confession.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ConfessionsTable createAlias(String alias) {
    return $ConfessionsTable(_db, alias);
  }
}

class ConfessionTopic extends DataClass implements Insertable<ConfessionTopic> {
  final int id;
  final String title;
  final String content;
  final DateTime created;
  ConfessionTopic(
      {required this.id,
      required this.title,
      required this.content,
      required this.created});
  factory ConfessionTopic.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return ConfessionTopic(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      content:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}text'])!,
      created: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['text'] = Variable<String>(content);
    map['created'] = Variable<DateTime>(created);
    return map;
  }

  ConfessionTopicsCompanion toCompanion(bool nullToAbsent) {
    return ConfessionTopicsCompanion(
      id: Value(id),
      title: Value(title),
      content: Value(content),
      created: Value(created),
    );
  }

  factory ConfessionTopic.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ConfessionTopic(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      created: serializer.fromJson<DateTime>(json['created']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
      'created': serializer.toJson<DateTime>(created),
    };
  }

  ConfessionTopic copyWith(
          {int? id, String? title, String? content, DateTime? created}) =>
      ConfessionTopic(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
        created: created ?? this.created,
      );
  @override
  String toString() {
    return (StringBuffer('ConfessionTopic(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('created: $created')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(title.hashCode, $mrjc(content.hashCode, created.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ConfessionTopic &&
          other.id == this.id &&
          other.title == this.title &&
          other.content == this.content &&
          other.created == this.created);
}

class ConfessionTopicsCompanion extends UpdateCompanion<ConfessionTopic> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> content;
  final Value<DateTime> created;
  const ConfessionTopicsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.created = const Value.absent(),
  });
  ConfessionTopicsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.content = const Value.absent(),
    this.created = const Value.absent(),
  }) : title = Value(title);
  static Insertable<ConfessionTopic> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? content,
    Expression<DateTime>? created,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (content != null) 'text': content,
      if (created != null) 'created': created,
    });
  }

  ConfessionTopicsCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? content,
      Value<DateTime>? created}) {
    return ConfessionTopicsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      created: created ?? this.created,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['text'] = Variable<String>(content.value);
    }
    if (created.present) {
      map['created'] = Variable<DateTime>(created.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ConfessionTopicsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('created: $created')
          ..write(')'))
        .toString();
  }
}

class $ConfessionTopicsTable extends ConfessionTopics
    with TableInfo<$ConfessionTopicsTable, ConfessionTopic> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ConfessionTopicsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedTextColumn title = _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _contentMeta = const VerificationMeta('content');
  @override
  late final GeneratedTextColumn content = _constructContent();
  GeneratedTextColumn _constructContent() {
    return GeneratedTextColumn(
      'text',
      $tableName,
      false,
    )..clientDefault = () => "";
  }

  final VerificationMeta _createdMeta = const VerificationMeta('created');
  @override
  late final GeneratedDateTimeColumn created = _constructCreated();
  GeneratedDateTimeColumn _constructCreated() {
    return GeneratedDateTimeColumn('created', $tableName, false,
        defaultValue: currentDateAndTime);
  }

  @override
  List<GeneratedColumn> get $columns => [id, title, content, created];
  @override
  $ConfessionTopicsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'confession_topics';
  @override
  final String actualTableName = 'confession_topics';
  @override
  VerificationContext validateIntegrity(Insertable<ConfessionTopic> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('text')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['text']!, _contentMeta));
    }
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created']!, _createdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ConfessionTopic map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ConfessionTopic.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ConfessionTopicsTable createAlias(String alias) {
    return $ConfessionTopicsTable(_db, alias);
  }
}

class Experience extends DataClass implements Insertable<Experience> {
  final int id;
  final String title;
  final String content;
  final String? editKey;
  final String? shareId;
  final String? shareLink;
  final DateTime created;
  Experience(
      {required this.id,
      required this.title,
      required this.content,
      this.editKey,
      this.shareId,
      this.shareLink,
      required this.created});
  factory Experience.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Experience(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      content: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}content'])!,
      editKey: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}edit_key']),
      shareId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}share_id']),
      shareLink: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}share_link']),
      created: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['content'] = Variable<String>(content);
    if (!nullToAbsent || editKey != null) {
      map['edit_key'] = Variable<String?>(editKey);
    }
    if (!nullToAbsent || shareId != null) {
      map['share_id'] = Variable<String?>(shareId);
    }
    if (!nullToAbsent || shareLink != null) {
      map['share_link'] = Variable<String?>(shareLink);
    }
    map['created'] = Variable<DateTime>(created);
    return map;
  }

  ExperiencesCompanion toCompanion(bool nullToAbsent) {
    return ExperiencesCompanion(
      id: Value(id),
      title: Value(title),
      content: Value(content),
      editKey: editKey == null && nullToAbsent
          ? const Value.absent()
          : Value(editKey),
      shareId: shareId == null && nullToAbsent
          ? const Value.absent()
          : Value(shareId),
      shareLink: shareLink == null && nullToAbsent
          ? const Value.absent()
          : Value(shareLink),
      created: Value(created),
    );
  }

  factory Experience.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Experience(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      editKey: serializer.fromJson<String?>(json['editKey']),
      shareId: serializer.fromJson<String?>(json['shareId']),
      shareLink: serializer.fromJson<String?>(json['shareLink']),
      created: serializer.fromJson<DateTime>(json['created']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
      'editKey': serializer.toJson<String?>(editKey),
      'shareId': serializer.toJson<String?>(shareId),
      'shareLink': serializer.toJson<String?>(shareLink),
      'created': serializer.toJson<DateTime>(created),
    };
  }

  Experience copyWith(
          {int? id,
          String? title,
          String? content,
          String? editKey,
          String? shareId,
          String? shareLink,
          DateTime? created}) =>
      Experience(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
        editKey: editKey ?? this.editKey,
        shareId: shareId ?? this.shareId,
        shareLink: shareLink ?? this.shareLink,
        created: created ?? this.created,
      );
  @override
  String toString() {
    return (StringBuffer('Experience(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('editKey: $editKey, ')
          ..write('shareId: $shareId, ')
          ..write('shareLink: $shareLink, ')
          ..write('created: $created')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          title.hashCode,
          $mrjc(
              content.hashCode,
              $mrjc(
                  editKey.hashCode,
                  $mrjc(shareId.hashCode,
                      $mrjc(shareLink.hashCode, created.hashCode)))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Experience &&
          other.id == this.id &&
          other.title == this.title &&
          other.content == this.content &&
          other.editKey == this.editKey &&
          other.shareId == this.shareId &&
          other.shareLink == this.shareLink &&
          other.created == this.created);
}

class ExperiencesCompanion extends UpdateCompanion<Experience> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> content;
  final Value<String?> editKey;
  final Value<String?> shareId;
  final Value<String?> shareLink;
  final Value<DateTime> created;
  const ExperiencesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.editKey = const Value.absent(),
    this.shareId = const Value.absent(),
    this.shareLink = const Value.absent(),
    this.created = const Value.absent(),
  });
  ExperiencesCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.content = const Value.absent(),
    this.editKey = const Value.absent(),
    this.shareId = const Value.absent(),
    this.shareLink = const Value.absent(),
    this.created = const Value.absent(),
  }) : title = Value(title);
  static Insertable<Experience> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? content,
    Expression<String?>? editKey,
    Expression<String?>? shareId,
    Expression<String?>? shareLink,
    Expression<DateTime>? created,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (content != null) 'content': content,
      if (editKey != null) 'edit_key': editKey,
      if (shareId != null) 'share_id': shareId,
      if (shareLink != null) 'share_link': shareLink,
      if (created != null) 'created': created,
    });
  }

  ExperiencesCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? content,
      Value<String?>? editKey,
      Value<String?>? shareId,
      Value<String?>? shareLink,
      Value<DateTime>? created}) {
    return ExperiencesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      editKey: editKey ?? this.editKey,
      shareId: shareId ?? this.shareId,
      shareLink: shareLink ?? this.shareLink,
      created: created ?? this.created,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (editKey.present) {
      map['edit_key'] = Variable<String?>(editKey.value);
    }
    if (shareId.present) {
      map['share_id'] = Variable<String?>(shareId.value);
    }
    if (shareLink.present) {
      map['share_link'] = Variable<String?>(shareLink.value);
    }
    if (created.present) {
      map['created'] = Variable<DateTime>(created.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExperiencesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('editKey: $editKey, ')
          ..write('shareId: $shareId, ')
          ..write('shareLink: $shareLink, ')
          ..write('created: $created')
          ..write(')'))
        .toString();
  }
}

class $ExperiencesTable extends Experiences
    with TableInfo<$ExperiencesTable, Experience> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ExperiencesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedTextColumn title = _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _contentMeta = const VerificationMeta('content');
  @override
  late final GeneratedTextColumn content = _constructContent();
  GeneratedTextColumn _constructContent() {
    return GeneratedTextColumn(
      'content',
      $tableName,
      false,
    )..clientDefault = () => "";
  }

  final VerificationMeta _editKeyMeta = const VerificationMeta('editKey');
  @override
  late final GeneratedTextColumn editKey = _constructEditKey();
  GeneratedTextColumn _constructEditKey() {
    return GeneratedTextColumn(
      'edit_key',
      $tableName,
      true,
    );
  }

  final VerificationMeta _shareIdMeta = const VerificationMeta('shareId');
  @override
  late final GeneratedTextColumn shareId = _constructShareId();
  GeneratedTextColumn _constructShareId() {
    return GeneratedTextColumn(
      'share_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _shareLinkMeta = const VerificationMeta('shareLink');
  @override
  late final GeneratedTextColumn shareLink = _constructShareLink();
  GeneratedTextColumn _constructShareLink() {
    return GeneratedTextColumn(
      'share_link',
      $tableName,
      true,
    );
  }

  final VerificationMeta _createdMeta = const VerificationMeta('created');
  @override
  late final GeneratedDateTimeColumn created = _constructCreated();
  GeneratedDateTimeColumn _constructCreated() {
    return GeneratedDateTimeColumn('created', $tableName, false,
        defaultValue: currentDateAndTime);
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, title, content, editKey, shareId, shareLink, created];
  @override
  $ExperiencesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'experiences';
  @override
  final String actualTableName = 'experiences';
  @override
  VerificationContext validateIntegrity(Insertable<Experience> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    }
    if (data.containsKey('edit_key')) {
      context.handle(_editKeyMeta,
          editKey.isAcceptableOrUnknown(data['edit_key']!, _editKeyMeta));
    }
    if (data.containsKey('share_id')) {
      context.handle(_shareIdMeta,
          shareId.isAcceptableOrUnknown(data['share_id']!, _shareIdMeta));
    }
    if (data.containsKey('share_link')) {
      context.handle(_shareLinkMeta,
          shareLink.isAcceptableOrUnknown(data['share_link']!, _shareLinkMeta));
    }
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created']!, _createdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Experience map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Experience.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ExperiencesTable createAlias(String alias) {
    return $ExperiencesTable(_db, alias);
  }
}

class GodsWord extends DataClass implements Insertable<GodsWord> {
  final int id;
  final String title;
  final String content;
  final bool archived;
  final bool emphasized;
  final String? editKey;
  final String? shareId;
  final String? shareLink;
  final DateTime created;
  GodsWord(
      {required this.id,
      required this.title,
      required this.content,
      required this.archived,
      required this.emphasized,
      this.editKey,
      this.shareId,
      this.shareLink,
      required this.created});
  factory GodsWord.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return GodsWord(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      content: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}content'])!,
      archived:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}archived'])!,
      emphasized: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}emphasized'])!,
      editKey: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}edit_key']),
      shareId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}share_id']),
      shareLink: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}share_link']),
      created: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['content'] = Variable<String>(content);
    map['archived'] = Variable<bool>(archived);
    map['emphasized'] = Variable<bool>(emphasized);
    if (!nullToAbsent || editKey != null) {
      map['edit_key'] = Variable<String?>(editKey);
    }
    if (!nullToAbsent || shareId != null) {
      map['share_id'] = Variable<String?>(shareId);
    }
    if (!nullToAbsent || shareLink != null) {
      map['share_link'] = Variable<String?>(shareLink);
    }
    map['created'] = Variable<DateTime>(created);
    return map;
  }

  GodsWordsCompanion toCompanion(bool nullToAbsent) {
    return GodsWordsCompanion(
      id: Value(id),
      title: Value(title),
      content: Value(content),
      archived: Value(archived),
      emphasized: Value(emphasized),
      editKey: editKey == null && nullToAbsent
          ? const Value.absent()
          : Value(editKey),
      shareId: shareId == null && nullToAbsent
          ? const Value.absent()
          : Value(shareId),
      shareLink: shareLink == null && nullToAbsent
          ? const Value.absent()
          : Value(shareLink),
      created: Value(created),
    );
  }

  factory GodsWord.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return GodsWord(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      archived: serializer.fromJson<bool>(json['archived']),
      emphasized: serializer.fromJson<bool>(json['emphasized']),
      editKey: serializer.fromJson<String?>(json['editKey']),
      shareId: serializer.fromJson<String?>(json['shareId']),
      shareLink: serializer.fromJson<String?>(json['shareLink']),
      created: serializer.fromJson<DateTime>(json['created']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
      'archived': serializer.toJson<bool>(archived),
      'emphasized': serializer.toJson<bool>(emphasized),
      'editKey': serializer.toJson<String?>(editKey),
      'shareId': serializer.toJson<String?>(shareId),
      'shareLink': serializer.toJson<String?>(shareLink),
      'created': serializer.toJson<DateTime>(created),
    };
  }

  GodsWord copyWith(
          {int? id,
          String? title,
          String? content,
          bool? archived,
          bool? emphasized,
          String? editKey,
          String? shareId,
          String? shareLink,
          DateTime? created}) =>
      GodsWord(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
        archived: archived ?? this.archived,
        emphasized: emphasized ?? this.emphasized,
        editKey: editKey ?? this.editKey,
        shareId: shareId ?? this.shareId,
        shareLink: shareLink ?? this.shareLink,
        created: created ?? this.created,
      );
  @override
  String toString() {
    return (StringBuffer('GodsWord(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('archived: $archived, ')
          ..write('emphasized: $emphasized, ')
          ..write('editKey: $editKey, ')
          ..write('shareId: $shareId, ')
          ..write('shareLink: $shareLink, ')
          ..write('created: $created')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          title.hashCode,
          $mrjc(
              content.hashCode,
              $mrjc(
                  archived.hashCode,
                  $mrjc(
                      emphasized.hashCode,
                      $mrjc(
                          editKey.hashCode,
                          $mrjc(
                              shareId.hashCode,
                              $mrjc(
                                  shareLink.hashCode, created.hashCode)))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is GodsWord &&
          other.id == this.id &&
          other.title == this.title &&
          other.content == this.content &&
          other.archived == this.archived &&
          other.emphasized == this.emphasized &&
          other.editKey == this.editKey &&
          other.shareId == this.shareId &&
          other.shareLink == this.shareLink &&
          other.created == this.created);
}

class GodsWordsCompanion extends UpdateCompanion<GodsWord> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> content;
  final Value<bool> archived;
  final Value<bool> emphasized;
  final Value<String?> editKey;
  final Value<String?> shareId;
  final Value<String?> shareLink;
  final Value<DateTime> created;
  const GodsWordsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.archived = const Value.absent(),
    this.emphasized = const Value.absent(),
    this.editKey = const Value.absent(),
    this.shareId = const Value.absent(),
    this.shareLink = const Value.absent(),
    this.created = const Value.absent(),
  });
  GodsWordsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.content = const Value.absent(),
    required bool archived,
    required bool emphasized,
    this.editKey = const Value.absent(),
    this.shareId = const Value.absent(),
    this.shareLink = const Value.absent(),
    this.created = const Value.absent(),
  })  : title = Value(title),
        archived = Value(archived),
        emphasized = Value(emphasized);
  static Insertable<GodsWord> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? content,
    Expression<bool>? archived,
    Expression<bool>? emphasized,
    Expression<String?>? editKey,
    Expression<String?>? shareId,
    Expression<String?>? shareLink,
    Expression<DateTime>? created,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (content != null) 'content': content,
      if (archived != null) 'archived': archived,
      if (emphasized != null) 'emphasized': emphasized,
      if (editKey != null) 'edit_key': editKey,
      if (shareId != null) 'share_id': shareId,
      if (shareLink != null) 'share_link': shareLink,
      if (created != null) 'created': created,
    });
  }

  GodsWordsCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? content,
      Value<bool>? archived,
      Value<bool>? emphasized,
      Value<String?>? editKey,
      Value<String?>? shareId,
      Value<String?>? shareLink,
      Value<DateTime>? created}) {
    return GodsWordsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      archived: archived ?? this.archived,
      emphasized: emphasized ?? this.emphasized,
      editKey: editKey ?? this.editKey,
      shareId: shareId ?? this.shareId,
      shareLink: shareLink ?? this.shareLink,
      created: created ?? this.created,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (archived.present) {
      map['archived'] = Variable<bool>(archived.value);
    }
    if (emphasized.present) {
      map['emphasized'] = Variable<bool>(emphasized.value);
    }
    if (editKey.present) {
      map['edit_key'] = Variable<String?>(editKey.value);
    }
    if (shareId.present) {
      map['share_id'] = Variable<String?>(shareId.value);
    }
    if (shareLink.present) {
      map['share_link'] = Variable<String?>(shareLink.value);
    }
    if (created.present) {
      map['created'] = Variable<DateTime>(created.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GodsWordsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('archived: $archived, ')
          ..write('emphasized: $emphasized, ')
          ..write('editKey: $editKey, ')
          ..write('shareId: $shareId, ')
          ..write('shareLink: $shareLink, ')
          ..write('created: $created')
          ..write(')'))
        .toString();
  }
}

class $GodsWordsTable extends GodsWords
    with TableInfo<$GodsWordsTable, GodsWord> {
  final GeneratedDatabase _db;
  final String? _alias;
  $GodsWordsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedTextColumn title = _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _contentMeta = const VerificationMeta('content');
  @override
  late final GeneratedTextColumn content = _constructContent();
  GeneratedTextColumn _constructContent() {
    return GeneratedTextColumn(
      'content',
      $tableName,
      false,
    )..clientDefault = () => "";
  }

  final VerificationMeta _archivedMeta = const VerificationMeta('archived');
  @override
  late final GeneratedBoolColumn archived = _constructArchived();
  GeneratedBoolColumn _constructArchived() {
    return GeneratedBoolColumn(
      'archived',
      $tableName,
      false,
    );
  }

  final VerificationMeta _emphasizedMeta = const VerificationMeta('emphasized');
  @override
  late final GeneratedBoolColumn emphasized = _constructEmphasized();
  GeneratedBoolColumn _constructEmphasized() {
    return GeneratedBoolColumn(
      'emphasized',
      $tableName,
      false,
    );
  }

  final VerificationMeta _editKeyMeta = const VerificationMeta('editKey');
  @override
  late final GeneratedTextColumn editKey = _constructEditKey();
  GeneratedTextColumn _constructEditKey() {
    return GeneratedTextColumn(
      'edit_key',
      $tableName,
      true,
    );
  }

  final VerificationMeta _shareIdMeta = const VerificationMeta('shareId');
  @override
  late final GeneratedTextColumn shareId = _constructShareId();
  GeneratedTextColumn _constructShareId() {
    return GeneratedTextColumn(
      'share_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _shareLinkMeta = const VerificationMeta('shareLink');
  @override
  late final GeneratedTextColumn shareLink = _constructShareLink();
  GeneratedTextColumn _constructShareLink() {
    return GeneratedTextColumn(
      'share_link',
      $tableName,
      true,
    );
  }

  final VerificationMeta _createdMeta = const VerificationMeta('created');
  @override
  late final GeneratedDateTimeColumn created = _constructCreated();
  GeneratedDateTimeColumn _constructCreated() {
    return GeneratedDateTimeColumn('created', $tableName, false,
        defaultValue: currentDateAndTime);
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        content,
        archived,
        emphasized,
        editKey,
        shareId,
        shareLink,
        created
      ];
  @override
  $GodsWordsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'gods_words';
  @override
  final String actualTableName = 'gods_words';
  @override
  VerificationContext validateIntegrity(Insertable<GodsWord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    }
    if (data.containsKey('archived')) {
      context.handle(_archivedMeta,
          archived.isAcceptableOrUnknown(data['archived']!, _archivedMeta));
    } else if (isInserting) {
      context.missing(_archivedMeta);
    }
    if (data.containsKey('emphasized')) {
      context.handle(
          _emphasizedMeta,
          emphasized.isAcceptableOrUnknown(
              data['emphasized']!, _emphasizedMeta));
    } else if (isInserting) {
      context.missing(_emphasizedMeta);
    }
    if (data.containsKey('edit_key')) {
      context.handle(_editKeyMeta,
          editKey.isAcceptableOrUnknown(data['edit_key']!, _editKeyMeta));
    }
    if (data.containsKey('share_id')) {
      context.handle(_shareIdMeta,
          shareId.isAcceptableOrUnknown(data['share_id']!, _shareIdMeta));
    }
    if (data.containsKey('share_link')) {
      context.handle(_shareLinkMeta,
          shareLink.isAcceptableOrUnknown(data['share_link']!, _shareLinkMeta));
    }
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created']!, _createdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GodsWord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return GodsWord.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $GodsWordsTable createAlias(String alias) {
    return $GodsWordsTable(_db, alias);
  }
}

class PrayerNote extends DataClass implements Insertable<PrayerNote> {
  final int id;
  final String title;
  final String content;
  final String? editKey;
  final String? shareId;
  final String? shareLink;
  final DateTime created;
  PrayerNote(
      {required this.id,
      required this.title,
      required this.content,
      this.editKey,
      this.shareId,
      this.shareLink,
      required this.created});
  factory PrayerNote.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return PrayerNote(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      content: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}content'])!,
      editKey: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}edit_key']),
      shareId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}share_id']),
      shareLink: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}share_link']),
      created: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['content'] = Variable<String>(content);
    if (!nullToAbsent || editKey != null) {
      map['edit_key'] = Variable<String?>(editKey);
    }
    if (!nullToAbsent || shareId != null) {
      map['share_id'] = Variable<String?>(shareId);
    }
    if (!nullToAbsent || shareLink != null) {
      map['share_link'] = Variable<String?>(shareLink);
    }
    map['created'] = Variable<DateTime>(created);
    return map;
  }

  PrayerNotesCompanion toCompanion(bool nullToAbsent) {
    return PrayerNotesCompanion(
      id: Value(id),
      title: Value(title),
      content: Value(content),
      editKey: editKey == null && nullToAbsent
          ? const Value.absent()
          : Value(editKey),
      shareId: shareId == null && nullToAbsent
          ? const Value.absent()
          : Value(shareId),
      shareLink: shareLink == null && nullToAbsent
          ? const Value.absent()
          : Value(shareLink),
      created: Value(created),
    );
  }

  factory PrayerNote.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return PrayerNote(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      editKey: serializer.fromJson<String?>(json['editKey']),
      shareId: serializer.fromJson<String?>(json['shareId']),
      shareLink: serializer.fromJson<String?>(json['shareLink']),
      created: serializer.fromJson<DateTime>(json['created']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
      'editKey': serializer.toJson<String?>(editKey),
      'shareId': serializer.toJson<String?>(shareId),
      'shareLink': serializer.toJson<String?>(shareLink),
      'created': serializer.toJson<DateTime>(created),
    };
  }

  PrayerNote copyWith(
          {int? id,
          String? title,
          String? content,
          String? editKey,
          String? shareId,
          String? shareLink,
          DateTime? created}) =>
      PrayerNote(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
        editKey: editKey ?? this.editKey,
        shareId: shareId ?? this.shareId,
        shareLink: shareLink ?? this.shareLink,
        created: created ?? this.created,
      );
  @override
  String toString() {
    return (StringBuffer('PrayerNote(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('editKey: $editKey, ')
          ..write('shareId: $shareId, ')
          ..write('shareLink: $shareLink, ')
          ..write('created: $created')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          title.hashCode,
          $mrjc(
              content.hashCode,
              $mrjc(
                  editKey.hashCode,
                  $mrjc(shareId.hashCode,
                      $mrjc(shareLink.hashCode, created.hashCode)))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is PrayerNote &&
          other.id == this.id &&
          other.title == this.title &&
          other.content == this.content &&
          other.editKey == this.editKey &&
          other.shareId == this.shareId &&
          other.shareLink == this.shareLink &&
          other.created == this.created);
}

class PrayerNotesCompanion extends UpdateCompanion<PrayerNote> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> content;
  final Value<String?> editKey;
  final Value<String?> shareId;
  final Value<String?> shareLink;
  final Value<DateTime> created;
  const PrayerNotesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.editKey = const Value.absent(),
    this.shareId = const Value.absent(),
    this.shareLink = const Value.absent(),
    this.created = const Value.absent(),
  });
  PrayerNotesCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.content = const Value.absent(),
    this.editKey = const Value.absent(),
    this.shareId = const Value.absent(),
    this.shareLink = const Value.absent(),
    this.created = const Value.absent(),
  }) : title = Value(title);
  static Insertable<PrayerNote> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? content,
    Expression<String?>? editKey,
    Expression<String?>? shareId,
    Expression<String?>? shareLink,
    Expression<DateTime>? created,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (content != null) 'content': content,
      if (editKey != null) 'edit_key': editKey,
      if (shareId != null) 'share_id': shareId,
      if (shareLink != null) 'share_link': shareLink,
      if (created != null) 'created': created,
    });
  }

  PrayerNotesCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? content,
      Value<String?>? editKey,
      Value<String?>? shareId,
      Value<String?>? shareLink,
      Value<DateTime>? created}) {
    return PrayerNotesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      editKey: editKey ?? this.editKey,
      shareId: shareId ?? this.shareId,
      shareLink: shareLink ?? this.shareLink,
      created: created ?? this.created,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (editKey.present) {
      map['edit_key'] = Variable<String?>(editKey.value);
    }
    if (shareId.present) {
      map['share_id'] = Variable<String?>(shareId.value);
    }
    if (shareLink.present) {
      map['share_link'] = Variable<String?>(shareLink.value);
    }
    if (created.present) {
      map['created'] = Variable<DateTime>(created.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PrayerNotesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('editKey: $editKey, ')
          ..write('shareId: $shareId, ')
          ..write('shareLink: $shareLink, ')
          ..write('created: $created')
          ..write(')'))
        .toString();
  }
}

class $PrayerNotesTable extends PrayerNotes
    with TableInfo<$PrayerNotesTable, PrayerNote> {
  final GeneratedDatabase _db;
  final String? _alias;
  $PrayerNotesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedTextColumn title = _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _contentMeta = const VerificationMeta('content');
  @override
  late final GeneratedTextColumn content = _constructContent();
  GeneratedTextColumn _constructContent() {
    return GeneratedTextColumn(
      'content',
      $tableName,
      false,
    )..clientDefault = () => "";
  }

  final VerificationMeta _editKeyMeta = const VerificationMeta('editKey');
  @override
  late final GeneratedTextColumn editKey = _constructEditKey();
  GeneratedTextColumn _constructEditKey() {
    return GeneratedTextColumn(
      'edit_key',
      $tableName,
      true,
    );
  }

  final VerificationMeta _shareIdMeta = const VerificationMeta('shareId');
  @override
  late final GeneratedTextColumn shareId = _constructShareId();
  GeneratedTextColumn _constructShareId() {
    return GeneratedTextColumn(
      'share_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _shareLinkMeta = const VerificationMeta('shareLink');
  @override
  late final GeneratedTextColumn shareLink = _constructShareLink();
  GeneratedTextColumn _constructShareLink() {
    return GeneratedTextColumn(
      'share_link',
      $tableName,
      true,
    );
  }

  final VerificationMeta _createdMeta = const VerificationMeta('created');
  @override
  late final GeneratedDateTimeColumn created = _constructCreated();
  GeneratedDateTimeColumn _constructCreated() {
    return GeneratedDateTimeColumn('created', $tableName, false,
        defaultValue: currentDateAndTime);
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, title, content, editKey, shareId, shareLink, created];
  @override
  $PrayerNotesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'prayer_notes';
  @override
  final String actualTableName = 'prayer_notes';
  @override
  VerificationContext validateIntegrity(Insertable<PrayerNote> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    }
    if (data.containsKey('edit_key')) {
      context.handle(_editKeyMeta,
          editKey.isAcceptableOrUnknown(data['edit_key']!, _editKeyMeta));
    }
    if (data.containsKey('share_id')) {
      context.handle(_shareIdMeta,
          shareId.isAcceptableOrUnknown(data['share_id']!, _shareIdMeta));
    }
    if (data.containsKey('share_link')) {
      context.handle(_shareLinkMeta,
          shareLink.isAcceptableOrUnknown(data['share_link']!, _shareLinkMeta));
    }
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created']!, _createdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PrayerNote map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return PrayerNote.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $PrayerNotesTable createAlias(String alias) {
    return $PrayerNotesTable(_db, alias);
  }
}

class PrayerRequest extends DataClass implements Insertable<PrayerRequest> {
  final int id;
  final String title;
  final String content;
  final PrayerRequestState state;
  final bool emphasized;
  final String? editKey;
  final String? shareId;
  final String? shareLink;
  final DateTime created;
  PrayerRequest(
      {required this.id,
      required this.title,
      required this.content,
      required this.state,
      required this.emphasized,
      this.editKey,
      this.shareId,
      this.shareLink,
      required this.created});
  factory PrayerRequest.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return PrayerRequest(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      content: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}content'])!,
      state: $PrayerRequestsTable.$converter0.mapToDart(
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}state']))!,
      emphasized: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}emphasized'])!,
      editKey: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}edit_key']),
      shareId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}share_id']),
      shareLink: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}share_link']),
      created: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['content'] = Variable<String>(content);
    {
      final converter = $PrayerRequestsTable.$converter0;
      map['state'] = Variable<String>(converter.mapToSql(state)!);
    }
    map['emphasized'] = Variable<bool>(emphasized);
    if (!nullToAbsent || editKey != null) {
      map['edit_key'] = Variable<String?>(editKey);
    }
    if (!nullToAbsent || shareId != null) {
      map['share_id'] = Variable<String?>(shareId);
    }
    if (!nullToAbsent || shareLink != null) {
      map['share_link'] = Variable<String?>(shareLink);
    }
    map['created'] = Variable<DateTime>(created);
    return map;
  }

  PrayerRequestsCompanion toCompanion(bool nullToAbsent) {
    return PrayerRequestsCompanion(
      id: Value(id),
      title: Value(title),
      content: Value(content),
      state: Value(state),
      emphasized: Value(emphasized),
      editKey: editKey == null && nullToAbsent
          ? const Value.absent()
          : Value(editKey),
      shareId: shareId == null && nullToAbsent
          ? const Value.absent()
          : Value(shareId),
      shareLink: shareLink == null && nullToAbsent
          ? const Value.absent()
          : Value(shareLink),
      created: Value(created),
    );
  }

  factory PrayerRequest.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return PrayerRequest(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      state: serializer.fromJson<PrayerRequestState>(json['state']),
      emphasized: serializer.fromJson<bool>(json['emphasized']),
      editKey: serializer.fromJson<String?>(json['editKey']),
      shareId: serializer.fromJson<String?>(json['shareId']),
      shareLink: serializer.fromJson<String?>(json['shareLink']),
      created: serializer.fromJson<DateTime>(json['created']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
      'state': serializer.toJson<PrayerRequestState>(state),
      'emphasized': serializer.toJson<bool>(emphasized),
      'editKey': serializer.toJson<String?>(editKey),
      'shareId': serializer.toJson<String?>(shareId),
      'shareLink': serializer.toJson<String?>(shareLink),
      'created': serializer.toJson<DateTime>(created),
    };
  }

  PrayerRequest copyWith(
          {int? id,
          String? title,
          String? content,
          PrayerRequestState? state,
          bool? emphasized,
          String? editKey,
          String? shareId,
          String? shareLink,
          DateTime? created}) =>
      PrayerRequest(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
        state: state ?? this.state,
        emphasized: emphasized ?? this.emphasized,
        editKey: editKey ?? this.editKey,
        shareId: shareId ?? this.shareId,
        shareLink: shareLink ?? this.shareLink,
        created: created ?? this.created,
      );
  @override
  String toString() {
    return (StringBuffer('PrayerRequest(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('state: $state, ')
          ..write('emphasized: $emphasized, ')
          ..write('editKey: $editKey, ')
          ..write('shareId: $shareId, ')
          ..write('shareLink: $shareLink, ')
          ..write('created: $created')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          title.hashCode,
          $mrjc(
              content.hashCode,
              $mrjc(
                  state.hashCode,
                  $mrjc(
                      emphasized.hashCode,
                      $mrjc(
                          editKey.hashCode,
                          $mrjc(
                              shareId.hashCode,
                              $mrjc(
                                  shareLink.hashCode, created.hashCode)))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is PrayerRequest &&
          other.id == this.id &&
          other.title == this.title &&
          other.content == this.content &&
          other.state == this.state &&
          other.emphasized == this.emphasized &&
          other.editKey == this.editKey &&
          other.shareId == this.shareId &&
          other.shareLink == this.shareLink &&
          other.created == this.created);
}

class PrayerRequestsCompanion extends UpdateCompanion<PrayerRequest> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> content;
  final Value<PrayerRequestState> state;
  final Value<bool> emphasized;
  final Value<String?> editKey;
  final Value<String?> shareId;
  final Value<String?> shareLink;
  final Value<DateTime> created;
  const PrayerRequestsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.state = const Value.absent(),
    this.emphasized = const Value.absent(),
    this.editKey = const Value.absent(),
    this.shareId = const Value.absent(),
    this.shareLink = const Value.absent(),
    this.created = const Value.absent(),
  });
  PrayerRequestsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.content = const Value.absent(),
    required PrayerRequestState state,
    required bool emphasized,
    this.editKey = const Value.absent(),
    this.shareId = const Value.absent(),
    this.shareLink = const Value.absent(),
    this.created = const Value.absent(),
  })  : title = Value(title),
        state = Value(state),
        emphasized = Value(emphasized);
  static Insertable<PrayerRequest> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? content,
    Expression<PrayerRequestState>? state,
    Expression<bool>? emphasized,
    Expression<String?>? editKey,
    Expression<String?>? shareId,
    Expression<String?>? shareLink,
    Expression<DateTime>? created,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (content != null) 'content': content,
      if (state != null) 'state': state,
      if (emphasized != null) 'emphasized': emphasized,
      if (editKey != null) 'edit_key': editKey,
      if (shareId != null) 'share_id': shareId,
      if (shareLink != null) 'share_link': shareLink,
      if (created != null) 'created': created,
    });
  }

  PrayerRequestsCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? content,
      Value<PrayerRequestState>? state,
      Value<bool>? emphasized,
      Value<String?>? editKey,
      Value<String?>? shareId,
      Value<String?>? shareLink,
      Value<DateTime>? created}) {
    return PrayerRequestsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      state: state ?? this.state,
      emphasized: emphasized ?? this.emphasized,
      editKey: editKey ?? this.editKey,
      shareId: shareId ?? this.shareId,
      shareLink: shareLink ?? this.shareLink,
      created: created ?? this.created,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (state.present) {
      final converter = $PrayerRequestsTable.$converter0;
      map['state'] = Variable<String>(converter.mapToSql(state.value)!);
    }
    if (emphasized.present) {
      map['emphasized'] = Variable<bool>(emphasized.value);
    }
    if (editKey.present) {
      map['edit_key'] = Variable<String?>(editKey.value);
    }
    if (shareId.present) {
      map['share_id'] = Variable<String?>(shareId.value);
    }
    if (shareLink.present) {
      map['share_link'] = Variable<String?>(shareLink.value);
    }
    if (created.present) {
      map['created'] = Variable<DateTime>(created.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PrayerRequestsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('state: $state, ')
          ..write('emphasized: $emphasized, ')
          ..write('editKey: $editKey, ')
          ..write('shareId: $shareId, ')
          ..write('shareLink: $shareLink, ')
          ..write('created: $created')
          ..write(')'))
        .toString();
  }
}

class $PrayerRequestsTable extends PrayerRequests
    with TableInfo<$PrayerRequestsTable, PrayerRequest> {
  final GeneratedDatabase _db;
  final String? _alias;
  $PrayerRequestsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedTextColumn title = _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _contentMeta = const VerificationMeta('content');
  @override
  late final GeneratedTextColumn content = _constructContent();
  GeneratedTextColumn _constructContent() {
    return GeneratedTextColumn(
      'content',
      $tableName,
      false,
    )..clientDefault = () => "";
  }

  final VerificationMeta _stateMeta = const VerificationMeta('state');
  @override
  late final GeneratedTextColumn state = _constructState();
  GeneratedTextColumn _constructState() {
    return GeneratedTextColumn(
      'state',
      $tableName,
      false,
    );
  }

  final VerificationMeta _emphasizedMeta = const VerificationMeta('emphasized');
  @override
  late final GeneratedBoolColumn emphasized = _constructEmphasized();
  GeneratedBoolColumn _constructEmphasized() {
    return GeneratedBoolColumn(
      'emphasized',
      $tableName,
      false,
    );
  }

  final VerificationMeta _editKeyMeta = const VerificationMeta('editKey');
  @override
  late final GeneratedTextColumn editKey = _constructEditKey();
  GeneratedTextColumn _constructEditKey() {
    return GeneratedTextColumn(
      'edit_key',
      $tableName,
      true,
    );
  }

  final VerificationMeta _shareIdMeta = const VerificationMeta('shareId');
  @override
  late final GeneratedTextColumn shareId = _constructShareId();
  GeneratedTextColumn _constructShareId() {
    return GeneratedTextColumn(
      'share_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _shareLinkMeta = const VerificationMeta('shareLink');
  @override
  late final GeneratedTextColumn shareLink = _constructShareLink();
  GeneratedTextColumn _constructShareLink() {
    return GeneratedTextColumn(
      'share_link',
      $tableName,
      true,
    );
  }

  final VerificationMeta _createdMeta = const VerificationMeta('created');
  @override
  late final GeneratedDateTimeColumn created = _constructCreated();
  GeneratedDateTimeColumn _constructCreated() {
    return GeneratedDateTimeColumn('created', $tableName, false,
        defaultValue: currentDateAndTime);
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        content,
        state,
        emphasized,
        editKey,
        shareId,
        shareLink,
        created
      ];
  @override
  $PrayerRequestsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'prayer_requests';
  @override
  final String actualTableName = 'prayer_requests';
  @override
  VerificationContext validateIntegrity(Insertable<PrayerRequest> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    }
    context.handle(_stateMeta, const VerificationResult.success());
    if (data.containsKey('emphasized')) {
      context.handle(
          _emphasizedMeta,
          emphasized.isAcceptableOrUnknown(
              data['emphasized']!, _emphasizedMeta));
    } else if (isInserting) {
      context.missing(_emphasizedMeta);
    }
    if (data.containsKey('edit_key')) {
      context.handle(_editKeyMeta,
          editKey.isAcceptableOrUnknown(data['edit_key']!, _editKeyMeta));
    }
    if (data.containsKey('share_id')) {
      context.handle(_shareIdMeta,
          shareId.isAcceptableOrUnknown(data['share_id']!, _shareIdMeta));
    }
    if (data.containsKey('share_link')) {
      context.handle(_shareLinkMeta,
          shareLink.isAcceptableOrUnknown(data['share_link']!, _shareLinkMeta));
    }
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created']!, _createdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PrayerRequest map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return PrayerRequest.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $PrayerRequestsTable createAlias(String alias) {
    return $PrayerRequestsTable(_db, alias);
  }

  static TypeConverter<PrayerRequestState, String> $converter0 =
      PrayerRequestStateConverter();
}

class PrayerItem extends DataClass implements Insertable<PrayerItem> {
  final int id;
  final DateTime date;
  final Duration? duration;
  PrayerItem({required this.id, required this.date, this.duration});
  factory PrayerItem.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return PrayerItem(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      date:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}date'])!,
      duration: $PrayerItemsTable.$converter0.mapToDart(
          intType.mapFromDatabaseResponse(data['${effectivePrefix}duration'])),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || duration != null) {
      final converter = $PrayerItemsTable.$converter0;
      map['duration'] = Variable<int?>(converter.mapToSql(duration));
    }
    return map;
  }

  PrayerItemsCompanion toCompanion(bool nullToAbsent) {
    return PrayerItemsCompanion(
      id: Value(id),
      date: Value(date),
      duration: duration == null && nullToAbsent
          ? const Value.absent()
          : Value(duration),
    );
  }

  factory PrayerItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return PrayerItem(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      duration: serializer.fromJson<Duration?>(json['duration']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'duration': serializer.toJson<Duration?>(duration),
    };
  }

  PrayerItem copyWith({int? id, DateTime? date, Duration? duration}) =>
      PrayerItem(
        id: id ?? this.id,
        date: date ?? this.date,
        duration: duration ?? this.duration,
      );
  @override
  String toString() {
    return (StringBuffer('PrayerItem(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('duration: $duration')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(date.hashCode, duration.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is PrayerItem &&
          other.id == this.id &&
          other.date == this.date &&
          other.duration == this.duration);
}

class PrayerItemsCompanion extends UpdateCompanion<PrayerItem> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<Duration?> duration;
  const PrayerItemsCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.duration = const Value.absent(),
  });
  PrayerItemsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
    this.duration = const Value.absent(),
  }) : date = Value(date);
  static Insertable<PrayerItem> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<Duration?>? duration,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (duration != null) 'duration': duration,
    });
  }

  PrayerItemsCompanion copyWith(
      {Value<int>? id, Value<DateTime>? date, Value<Duration?>? duration}) {
    return PrayerItemsCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      duration: duration ?? this.duration,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (duration.present) {
      final converter = $PrayerItemsTable.$converter0;
      map['duration'] = Variable<int?>(converter.mapToSql(duration.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PrayerItemsCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('duration: $duration')
          ..write(')'))
        .toString();
  }
}

class $PrayerItemsTable extends PrayerItems
    with TableInfo<$PrayerItemsTable, PrayerItem> {
  final GeneratedDatabase _db;
  final String? _alias;
  $PrayerItemsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedDateTimeColumn date = _constructDate();
  GeneratedDateTimeColumn _constructDate() {
    return GeneratedDateTimeColumn(
      'date',
      $tableName,
      false,
    );
  }

  final VerificationMeta _durationMeta = const VerificationMeta('duration');
  @override
  late final GeneratedIntColumn duration = _constructDuration();
  GeneratedIntColumn _constructDuration() {
    return GeneratedIntColumn(
      'duration',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, date, duration];
  @override
  $PrayerItemsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'prayer_items';
  @override
  final String actualTableName = 'prayer_items';
  @override
  VerificationContext validateIntegrity(Insertable<PrayerItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    context.handle(_durationMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PrayerItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return PrayerItem.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $PrayerItemsTable createAlias(String alias) {
    return $PrayerItemsTable(_db, alias);
  }

  static TypeConverter<Duration, int> $converter0 = const DurationConverter();
}

class Favorite extends DataClass implements Insertable<Favorite> {
  final DocumentReference firestoreRef;
  final bool favorite;
  Favorite({required this.firestoreRef, required this.favorite});
  factory Favorite.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return Favorite(
      firestoreRef: $FavoritesTable.$converter0.mapToDart(stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}firestore_ref']))!,
      favorite:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}favorite'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    {
      final converter = $FavoritesTable.$converter0;
      map['firestore_ref'] =
          Variable<String>(converter.mapToSql(firestoreRef)!);
    }
    map['favorite'] = Variable<bool>(favorite);
    return map;
  }

  FavoritesCompanion toCompanion(bool nullToAbsent) {
    return FavoritesCompanion(
      firestoreRef: Value(firestoreRef),
      favorite: Value(favorite),
    );
  }

  factory Favorite.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Favorite(
      firestoreRef:
          serializer.fromJson<DocumentReference>(json['firestoreRef']),
      favorite: serializer.fromJson<bool>(json['favorite']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'firestoreRef': serializer.toJson<DocumentReference>(firestoreRef),
      'favorite': serializer.toJson<bool>(favorite),
    };
  }

  Favorite copyWith({DocumentReference? firestoreRef, bool? favorite}) =>
      Favorite(
        firestoreRef: firestoreRef ?? this.firestoreRef,
        favorite: favorite ?? this.favorite,
      );
  @override
  String toString() {
    return (StringBuffer('Favorite(')
          ..write('firestoreRef: $firestoreRef, ')
          ..write('favorite: $favorite')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(firestoreRef.hashCode, favorite.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Favorite &&
          other.firestoreRef == this.firestoreRef &&
          other.favorite == this.favorite);
}

class FavoritesCompanion extends UpdateCompanion<Favorite> {
  final Value<DocumentReference> firestoreRef;
  final Value<bool> favorite;
  const FavoritesCompanion({
    this.firestoreRef = const Value.absent(),
    this.favorite = const Value.absent(),
  });
  FavoritesCompanion.insert({
    required DocumentReference firestoreRef,
    this.favorite = const Value.absent(),
  }) : firestoreRef = Value(firestoreRef);
  static Insertable<Favorite> custom({
    Expression<DocumentReference>? firestoreRef,
    Expression<bool>? favorite,
  }) {
    return RawValuesInsertable({
      if (firestoreRef != null) 'firestore_ref': firestoreRef,
      if (favorite != null) 'favorite': favorite,
    });
  }

  FavoritesCompanion copyWith(
      {Value<DocumentReference>? firestoreRef, Value<bool>? favorite}) {
    return FavoritesCompanion(
      firestoreRef: firestoreRef ?? this.firestoreRef,
      favorite: favorite ?? this.favorite,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (firestoreRef.present) {
      final converter = $FavoritesTable.$converter0;
      map['firestore_ref'] =
          Variable<String>(converter.mapToSql(firestoreRef.value)!);
    }
    if (favorite.present) {
      map['favorite'] = Variable<bool>(favorite.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoritesCompanion(')
          ..write('firestoreRef: $firestoreRef, ')
          ..write('favorite: $favorite')
          ..write(')'))
        .toString();
  }
}

class $FavoritesTable extends Favorites
    with TableInfo<$FavoritesTable, Favorite> {
  final GeneratedDatabase _db;
  final String? _alias;
  $FavoritesTable(this._db, [this._alias]);
  final VerificationMeta _firestoreRefMeta =
      const VerificationMeta('firestoreRef');
  @override
  late final GeneratedTextColumn firestoreRef = _constructFirestoreRef();
  GeneratedTextColumn _constructFirestoreRef() {
    return GeneratedTextColumn(
      'firestore_ref',
      $tableName,
      false,
    );
  }

  final VerificationMeta _favoriteMeta = const VerificationMeta('favorite');
  @override
  late final GeneratedBoolColumn favorite = _constructFavorite();
  GeneratedBoolColumn _constructFavorite() {
    return GeneratedBoolColumn('favorite', $tableName, false,
        defaultValue: Constant(false));
  }

  @override
  List<GeneratedColumn> get $columns => [firestoreRef, favorite];
  @override
  $FavoritesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'favorites';
  @override
  final String actualTableName = 'favorites';
  @override
  VerificationContext validateIntegrity(Insertable<Favorite> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    context.handle(_firestoreRefMeta, const VerificationResult.success());
    if (data.containsKey('favorite')) {
      context.handle(_favoriteMeta,
          favorite.isAcceptableOrUnknown(data['favorite']!, _favoriteMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {firestoreRef};
  @override
  Favorite map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Favorite.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $FavoritesTable createAlias(String alias) {
    return $FavoritesTable(_db, alias);
  }

  static TypeConverter<DocumentReference, String> $converter0 =
      DocumentReferenceConverter();
}

class BibleBook extends DataClass implements Insertable<BibleBook> {
  final int id;
  final String name;
  final String abbreviation;
  final String keywords;
  BibleBook(
      {required this.id,
      required this.name,
      required this.abbreviation,
      required this.keywords});
  factory BibleBook.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return BibleBook(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      abbreviation: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}abbreviation'])!,
      keywords: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}keywords'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['abbreviation'] = Variable<String>(abbreviation);
    map['keywords'] = Variable<String>(keywords);
    return map;
  }

  BibleBooksCompanion toCompanion(bool nullToAbsent) {
    return BibleBooksCompanion(
      id: Value(id),
      name: Value(name),
      abbreviation: Value(abbreviation),
      keywords: Value(keywords),
    );
  }

  factory BibleBook.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return BibleBook(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      abbreviation: serializer.fromJson<String>(json['abbreviation']),
      keywords: serializer.fromJson<String>(json['keywords']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'abbreviation': serializer.toJson<String>(abbreviation),
      'keywords': serializer.toJson<String>(keywords),
    };
  }

  BibleBook copyWith(
          {int? id, String? name, String? abbreviation, String? keywords}) =>
      BibleBook(
        id: id ?? this.id,
        name: name ?? this.name,
        abbreviation: abbreviation ?? this.abbreviation,
        keywords: keywords ?? this.keywords,
      );
  @override
  String toString() {
    return (StringBuffer('BibleBook(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('abbreviation: $abbreviation, ')
          ..write('keywords: $keywords')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(name.hashCode, $mrjc(abbreviation.hashCode, keywords.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is BibleBook &&
          other.id == this.id &&
          other.name == this.name &&
          other.abbreviation == this.abbreviation &&
          other.keywords == this.keywords);
}

class BibleBooksCompanion extends UpdateCompanion<BibleBook> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> abbreviation;
  final Value<String> keywords;
  const BibleBooksCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.abbreviation = const Value.absent(),
    this.keywords = const Value.absent(),
  });
  BibleBooksCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String abbreviation,
    required String keywords,
  })   : name = Value(name),
        abbreviation = Value(abbreviation),
        keywords = Value(keywords);
  static Insertable<BibleBook> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? abbreviation,
    Expression<String>? keywords,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (abbreviation != null) 'abbreviation': abbreviation,
      if (keywords != null) 'keywords': keywords,
    });
  }

  BibleBooksCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? abbreviation,
      Value<String>? keywords}) {
    return BibleBooksCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      abbreviation: abbreviation ?? this.abbreviation,
      keywords: keywords ?? this.keywords,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (abbreviation.present) {
      map['abbreviation'] = Variable<String>(abbreviation.value);
    }
    if (keywords.present) {
      map['keywords'] = Variable<String>(keywords.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BibleBooksCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('abbreviation: $abbreviation, ')
          ..write('keywords: $keywords')
          ..write(')'))
        .toString();
  }
}

class $BibleBooksTable extends BibleBooks
    with TableInfo<$BibleBooksTable, BibleBook> {
  final GeneratedDatabase _db;
  final String? _alias;
  $BibleBooksTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedTextColumn name = _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _abbreviationMeta =
      const VerificationMeta('abbreviation');
  @override
  late final GeneratedTextColumn abbreviation = _constructAbbreviation();
  GeneratedTextColumn _constructAbbreviation() {
    return GeneratedTextColumn(
      'abbreviation',
      $tableName,
      false,
    );
  }

  final VerificationMeta _keywordsMeta = const VerificationMeta('keywords');
  @override
  late final GeneratedTextColumn keywords = _constructKeywords();
  GeneratedTextColumn _constructKeywords() {
    return GeneratedTextColumn(
      'keywords',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, name, abbreviation, keywords];
  @override
  $BibleBooksTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'bible_books';
  @override
  final String actualTableName = 'bible_books';
  @override
  VerificationContext validateIntegrity(Insertable<BibleBook> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('abbreviation')) {
      context.handle(
          _abbreviationMeta,
          abbreviation.isAcceptableOrUnknown(
              data['abbreviation']!, _abbreviationMeta));
    } else if (isInserting) {
      context.missing(_abbreviationMeta);
    }
    if (data.containsKey('keywords')) {
      context.handle(_keywordsMeta,
          keywords.isAcceptableOrUnknown(data['keywords']!, _keywordsMeta));
    } else if (isInserting) {
      context.missing(_keywordsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BibleBook map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return BibleBook.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $BibleBooksTable createAlias(String alias) {
    return $BibleBooksTable(_db, alias);
  }
}

class BibleVerse extends DataClass implements Insertable<BibleVerse> {
  final int id;
  final int book;
  final int chapter;
  final int verse;
  final String content;
  BibleVerse(
      {required this.id,
      required this.book,
      required this.chapter,
      required this.verse,
      required this.content});
  factory BibleVerse.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return BibleVerse(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      book: intType.mapFromDatabaseResponse(data['${effectivePrefix}book'])!,
      chapter:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}chapter'])!,
      verse: intType.mapFromDatabaseResponse(data['${effectivePrefix}verse'])!,
      content:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}text'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['book'] = Variable<int>(book);
    map['chapter'] = Variable<int>(chapter);
    map['verse'] = Variable<int>(verse);
    map['text'] = Variable<String>(content);
    return map;
  }

  BibleVersesCompanion toCompanion(bool nullToAbsent) {
    return BibleVersesCompanion(
      id: Value(id),
      book: Value(book),
      chapter: Value(chapter),
      verse: Value(verse),
      content: Value(content),
    );
  }

  factory BibleVerse.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return BibleVerse(
      id: serializer.fromJson<int>(json['id']),
      book: serializer.fromJson<int>(json['book']),
      chapter: serializer.fromJson<int>(json['chapter']),
      verse: serializer.fromJson<int>(json['verse']),
      content: serializer.fromJson<String>(json['content']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'book': serializer.toJson<int>(book),
      'chapter': serializer.toJson<int>(chapter),
      'verse': serializer.toJson<int>(verse),
      'content': serializer.toJson<String>(content),
    };
  }

  BibleVerse copyWith(
          {int? id, int? book, int? chapter, int? verse, String? content}) =>
      BibleVerse(
        id: id ?? this.id,
        book: book ?? this.book,
        chapter: chapter ?? this.chapter,
        verse: verse ?? this.verse,
        content: content ?? this.content,
      );
  @override
  String toString() {
    return (StringBuffer('BibleVerse(')
          ..write('id: $id, ')
          ..write('book: $book, ')
          ..write('chapter: $chapter, ')
          ..write('verse: $verse, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(book.hashCode,
          $mrjc(chapter.hashCode, $mrjc(verse.hashCode, content.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is BibleVerse &&
          other.id == this.id &&
          other.book == this.book &&
          other.chapter == this.chapter &&
          other.verse == this.verse &&
          other.content == this.content);
}

class BibleVersesCompanion extends UpdateCompanion<BibleVerse> {
  final Value<int> id;
  final Value<int> book;
  final Value<int> chapter;
  final Value<int> verse;
  final Value<String> content;
  const BibleVersesCompanion({
    this.id = const Value.absent(),
    this.book = const Value.absent(),
    this.chapter = const Value.absent(),
    this.verse = const Value.absent(),
    this.content = const Value.absent(),
  });
  BibleVersesCompanion.insert({
    this.id = const Value.absent(),
    required int book,
    required int chapter,
    required int verse,
    required String content,
  })   : book = Value(book),
        chapter = Value(chapter),
        verse = Value(verse),
        content = Value(content);
  static Insertable<BibleVerse> custom({
    Expression<int>? id,
    Expression<int>? book,
    Expression<int>? chapter,
    Expression<int>? verse,
    Expression<String>? content,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (book != null) 'book': book,
      if (chapter != null) 'chapter': chapter,
      if (verse != null) 'verse': verse,
      if (content != null) 'text': content,
    });
  }

  BibleVersesCompanion copyWith(
      {Value<int>? id,
      Value<int>? book,
      Value<int>? chapter,
      Value<int>? verse,
      Value<String>? content}) {
    return BibleVersesCompanion(
      id: id ?? this.id,
      book: book ?? this.book,
      chapter: chapter ?? this.chapter,
      verse: verse ?? this.verse,
      content: content ?? this.content,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (book.present) {
      map['book'] = Variable<int>(book.value);
    }
    if (chapter.present) {
      map['chapter'] = Variable<int>(chapter.value);
    }
    if (verse.present) {
      map['verse'] = Variable<int>(verse.value);
    }
    if (content.present) {
      map['text'] = Variable<String>(content.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BibleVersesCompanion(')
          ..write('id: $id, ')
          ..write('book: $book, ')
          ..write('chapter: $chapter, ')
          ..write('verse: $verse, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }
}

class $BibleVersesTable extends BibleVerses
    with TableInfo<$BibleVersesTable, BibleVerse> {
  final GeneratedDatabase _db;
  final String? _alias;
  $BibleVersesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _bookMeta = const VerificationMeta('book');
  @override
  late final GeneratedIntColumn book = _constructBook();
  GeneratedIntColumn _constructBook() {
    return GeneratedIntColumn('book', $tableName, false,
        $customConstraints: 'REFERENCES bible_books(id)');
  }

  final VerificationMeta _chapterMeta = const VerificationMeta('chapter');
  @override
  late final GeneratedIntColumn chapter = _constructChapter();
  GeneratedIntColumn _constructChapter() {
    return GeneratedIntColumn(
      'chapter',
      $tableName,
      false,
    );
  }

  final VerificationMeta _verseMeta = const VerificationMeta('verse');
  @override
  late final GeneratedIntColumn verse = _constructVerse();
  GeneratedIntColumn _constructVerse() {
    return GeneratedIntColumn(
      'verse',
      $tableName,
      false,
    );
  }

  final VerificationMeta _contentMeta = const VerificationMeta('content');
  @override
  late final GeneratedTextColumn content = _constructContent();
  GeneratedTextColumn _constructContent() {
    return GeneratedTextColumn(
      'text',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, book, chapter, verse, content];
  @override
  $BibleVersesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'bible_verses';
  @override
  final String actualTableName = 'bible_verses';
  @override
  VerificationContext validateIntegrity(Insertable<BibleVerse> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('book')) {
      context.handle(
          _bookMeta, book.isAcceptableOrUnknown(data['book']!, _bookMeta));
    } else if (isInserting) {
      context.missing(_bookMeta);
    }
    if (data.containsKey('chapter')) {
      context.handle(_chapterMeta,
          chapter.isAcceptableOrUnknown(data['chapter']!, _chapterMeta));
    } else if (isInserting) {
      context.missing(_chapterMeta);
    }
    if (data.containsKey('verse')) {
      context.handle(
          _verseMeta, verse.isAcceptableOrUnknown(data['verse']!, _verseMeta));
    } else if (isInserting) {
      context.missing(_verseMeta);
    }
    if (data.containsKey('text')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['text']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BibleVerse map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return BibleVerse.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $BibleVersesTable createAlias(String alias) {
    return $BibleVersesTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  _$AppDatabase.connect(DatabaseConnection c) : super.connect(c);
  late final BibleBookNames bibleBookNames = BibleBookNames(this);
  late final $DeedsTable deeds = $DeedsTable(this);
  late final $DecisionsTable decisions = $DecisionsTable(this);
  late final $DecisionRatingsTable decisionRatings =
      $DecisionRatingsTable(this);
  late final $ConfessionsTable confessions = $ConfessionsTable(this);
  late final $ConfessionTopicsTable confessionTopics =
      $ConfessionTopicsTable(this);
  late final $ExperiencesTable experiences = $ExperiencesTable(this);
  late final $GodsWordsTable godsWords = $GodsWordsTable(this);
  late final $PrayerNotesTable prayerNotes = $PrayerNotesTable(this);
  late final $PrayerRequestsTable prayerRequests = $PrayerRequestsTable(this);
  late final $PrayerItemsTable prayerItems = $PrayerItemsTable(this);
  late final $FavoritesTable favorites = $FavoritesTable(this);
  late final $BibleBooksTable bibleBooks = $BibleBooksTable(this);
  late final $BibleVersesTable bibleVerses = $BibleVersesTable(this);
  late final DeedsDao deedsDao = DeedsDao(this as AppDatabase);
  late final DecisionsDao decisionsDao = DecisionsDao(this as AppDatabase);
  late final ConfessionsDao confessionsDao =
      ConfessionsDao(this as AppDatabase);
  late final ExperiencesDao experiencesDao =
      ExperiencesDao(this as AppDatabase);
  late final GodsWordsDao godsWordsDao = GodsWordsDao(this as AppDatabase);
  late final PrayerNotesDao prayerNotesDao =
      PrayerNotesDao(this as AppDatabase);
  late final PrayerRequestsDao prayerRequestsDao =
      PrayerRequestsDao(this as AppDatabase);
  late final PrayerItemsDao prayerItemsDao =
      PrayerItemsDao(this as AppDatabase);
  late final FavoritesDao favoritesDao = FavoritesDao(this as AppDatabase);
  late final BibleDao bibleDao = BibleDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        bibleBookNames,
        deeds,
        decisions,
        decisionRatings,
        confessions,
        confessionTopics,
        experiences,
        godsWords,
        prayerNotes,
        prayerRequests,
        prayerItems,
        favorites,
        bibleBooks,
        bibleVerses
      ];
}
