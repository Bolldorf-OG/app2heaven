/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:moor/moor.dart';

import 'database.dart';

part 'gods_words.g.dart';

class GodsWords extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text()();

  TextColumn get content => text().clientDefault(() => "")();

  BoolColumn get archived => boolean()();

  BoolColumn get emphasized => boolean()();

  TextColumn get editKey => text().nullable()();

  TextColumn get shareId => text().nullable()();

  TextColumn get shareLink => text().nullable()();

  DateTimeColumn get created => dateTime().withDefault(currentDateAndTime)();
}

@UseDao(tables: [GodsWords])
class GodsWordsDao extends DatabaseAccessor<AppDatabase> with _$GodsWordsDaoMixin {
  GodsWordsDao(AppDatabase db) : super(db);

  Stream<GodsWord> getGodsWordStream(int id) {
    return (select(godsWords)..where((d) => d.id.equals(id))).watchSingle();
  }

  Stream<List<GodsWord>> getCurrentGodsWordsStream() {
    return (select(godsWords)
          ..where((d) => d.archived.equals(false))
          ..orderBy([
            (item) => OrderingTerm.desc(item.emphasized),
            (item) => OrderingTerm.desc(item.created),
          ]))
        .watch();
  }

  Stream<List<GodsWord>> getArchivedGodsWordStream() {
    return (select(godsWords)
          ..where((d) => d.archived.equals(true))
          ..orderBy([
            (item) => OrderingTerm.desc(item.emphasized),
            (item) => OrderingTerm.desc(item.created),
          ]))
        .watch();
  }

  Future<int> insertGodsWord(GodsWordsCompanion godsWord) {
    return into(godsWords).insert(godsWord);
  }

  Future<int> updateGodsWord(GodsWord godsWord, GodsWordsCompanion newGodsWord) {
    return (update(godsWords)..whereSamePrimaryKey(godsWord)).write(newGodsWord);
  }

  Future<int> deleteGodsWord(GodsWord godsWord) {
    return delete(godsWords).delete(godsWord);
  }

  Future<int> deleteGodsWords(List<GodsWord> items) {
    return (delete(godsWords)..where((item) => item.id.isIn(items.map((e) => e.id)))).go();
  }

  Future<int?> getIdForShareId(String shareId) {
    return (selectOnly(godsWords)
          ..addColumns([godsWords.id])
          ..where(godsWords.shareId.equals(shareId))
          ..limit(1))
        .map((result) => result.read(godsWords.id))
        .getSingle();
  }
}
