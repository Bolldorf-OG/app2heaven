/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:moor/moor.dart';

import 'database.dart';

part 'prayer_notes.g.dart';

class PrayerNotes extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text()();

  TextColumn get content => text().clientDefault(() => "")();

  TextColumn get editKey => text().nullable()();

  TextColumn get shareId => text().nullable()();

  TextColumn get shareLink => text().nullable()();

  DateTimeColumn get created => dateTime().withDefault(currentDateAndTime)();
}

@UseDao(tables: [PrayerNotes])
class PrayerNotesDao extends DatabaseAccessor<AppDatabase> with _$PrayerNotesDaoMixin {
  PrayerNotesDao(AppDatabase db) : super(db);

  Stream<PrayerNote> getPrayerNoteStream(int id) {
    return (select(prayerNotes)..where((d) => d.id.equals(id))).watchSingle();
  }

  Stream<List<PrayerNote>> getAllPrayerNotesStream() {
    return (select(prayerNotes)
          ..orderBy([
            (item) => OrderingTerm.desc(item.created),
          ]))
        .watch();
  }

  Future<int> insertPrayerNote(PrayerNotesCompanion prayerNote) {
    return into(prayerNotes).insert(prayerNote);
  }

  Future<int> updatePrayerNote(PrayerNote prayerNote, PrayerNotesCompanion newPrayerNote) {
    return (update(prayerNotes)..whereSamePrimaryKey(prayerNote)).write(newPrayerNote);
  }

  Future<int> deletePrayerNote(PrayerNote prayerNote) {
    return delete(prayerNotes).delete(prayerNote);
  }

  Future<int> deletePrayerNotes(List<PrayerNote> items) {
    return (delete(prayerNotes)..where((item) => item.id.isIn(items.map((e) => e.id)))).go();
  }

  Future<int?> getIdForShareId(String shareId) {
    return (selectOnly(prayerNotes)
          ..addColumns([prayerNotes.id])
          ..where(prayerNotes.shareId.equals(shareId))
          ..limit(1))
        .map((result) => result.read(prayerNotes.id))
        .getSingle();
  }
}
