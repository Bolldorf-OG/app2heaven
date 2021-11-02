/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:moor/moor.dart';

import '../util/helpers.dart';
import 'database.dart';

part 'confessions.g.dart';

class Confessions extends Table {
  DateTimeColumn get date => dateTime()();

  @override
  Set<Column> get primaryKey => {date};
}

class ConfessionTopics extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text()();

  TextColumn get content => text().named("text").clientDefault(() => "")();

  DateTimeColumn get created => dateTime().withDefault(currentDateAndTime)();
}

@UseDao(tables: [Confessions, ConfessionTopics])
class ConfessionsDao extends DatabaseAccessor<AppDatabase>
    with _$ConfessionsDaoMixin {
  ConfessionsDao(AppDatabase db) : super(db);

  Stream<ConfessionTopic> getConfessionTopicStream(int id) {
    return (select(confessionTopics)..where((d) => d.id.equals(id)))
        .watchSingle();
  }

  Stream<List<ConfessionTopic>> getAllConfessionTopicsStream() {
    return (select(confessionTopics)
          ..orderBy([
            (item) => OrderingTerm.desc(item.created),
          ]))
        .watch();
  }

  Future<int> insertConfessionTopic(ConfessionTopicsCompanion confessionTopic) {
    return into(confessionTopics).insert(confessionTopic);
  }

  Future<int> updateConfessionTopic(ConfessionTopic confessionTopic,
      ConfessionTopicsCompanion newConfessionTopic) {
    return (update(confessionTopics)..whereSamePrimaryKey(confessionTopic))
        .write(newConfessionTopic);
  }

  Future<int> deleteConfessionTopic(ConfessionTopic confessionTopic) {
    return delete(confessionTopics).delete(confessionTopic);
  }

  Future<int> clearConfessionTopics() {
    return delete(confessionTopics).go();
  }

  Future<int> insertConfession(DateTime date) {
    return into(confessions).insert(
        ConfessionsCompanion.insert(date: date.startOfDay),
        mode: InsertMode.insertOrReplace);
  }

  Stream<Confession> getLastConfessionStream() {
    return (select(confessions)
          ..orderBy([(confession) => OrderingTerm.desc(confession.date)])
          ..limit(1))
        .watchSingle();
  }

  Stream<List<Confession>> getConfessionsStream() {
    return (select(confessions)
          ..orderBy([(confession) => OrderingTerm.desc(confession.date)]))
        .watch();
  }
}
