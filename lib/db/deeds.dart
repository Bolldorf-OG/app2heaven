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

part 'deeds.g.dart';

class Deeds extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text()();

  TextColumn get content => text().named("text").clientDefault(() => "")();

  BoolColumn get archived => boolean()();

  DateTimeColumn get created => dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get date => dateTime()();
}

@UseDao(tables: [Deeds])
class DeedsDao extends DatabaseAccessor<AppDatabase> with _$DeedsDaoMixin {
  DeedsDao(AppDatabase db) : super(db);

  Stream<Deed> getDeedStream(int id) {
    return (select(deeds)..where((d) => d.id.equals(id))).watchSingle();
  }

  Stream<List<Deed>> getCurrentDeedsStream() {
    return (select(deeds)
          ..where((d) => d.archived.equals(false))
          ..orderBy([
            (item) => OrderingTerm.desc(item.created),
          ]))
        .watch();
  }

  Stream<List<Deed>> getArchivedDeedStream() {
    return (select(deeds)
          ..where((d) => d.archived.equals(true))
          ..orderBy([
            (item) => OrderingTerm.desc(item.created),
          ]))
        .watch();
  }

  Stream<List<Deed>> getCurrentDeedsStreamForDate(DateTime date) {
    return (select(deeds)
          ..where((d) => d.archived.equals(false) & d.date.startOfDay.equals(date.startOfDay))
          ..orderBy([
            (item) => OrderingTerm.desc(item.created),
          ]))
        .watch();
  }

  Stream<List<Deed>> getDeedsStreamForDate(DateTime date) {
    return (select(deeds)
          ..where((d) => d.date.startOfDay.equals(date.startOfDay))
          ..orderBy([
            (item) => OrderingTerm.asc(item.archived),
            (item) => OrderingTerm.desc(item.created),
          ]))
        .watch();
  }

  Future<int> insertDeed(DeedsCompanion deed) {
    return into(deeds).insert(deed);
  }

  Future<int> updateDeed(Deed deed, DeedsCompanion newDeed) {
    return (update(deeds)..whereSamePrimaryKey(deed)).write(newDeed);
  }

  Future<int> deleteDeed(Deed deed) {
    return delete(deeds).delete(deed);
  }

  Future<int> deleteDeeds(List<Deed> items) {
    return (delete(deeds)..where((item) => item.id.isIn(items.map((e) => e.id)))).go();
  }
}
