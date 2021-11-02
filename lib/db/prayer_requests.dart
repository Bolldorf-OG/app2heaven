/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:moor/moor.dart';

import 'database.dart';

part 'prayer_requests.g.dart';

class PrayerRequests extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text()();

  TextColumn get content => text().clientDefault(() => "")();

  TextColumn get state => text().map(PrayerRequestStateConverter())();

  BoolColumn get emphasized => boolean()();

  TextColumn get editKey => text().nullable()();

  TextColumn get shareId => text().nullable()();

  TextColumn get shareLink => text().nullable()();

  DateTimeColumn get created => dateTime().withDefault(currentDateAndTime)();
}

enum PrayerRequestState { active, done, archived }

class PrayerRequestStateConverter
    extends TypeConverter<PrayerRequestState, String> {
  static const _mapping = ["active", "done", "archived"];

  @override
  PrayerRequestState? mapToDart(String? fromDb) => fromDb == null
      ? null
      : PrayerRequestState.values[_mapping.indexOf(fromDb)];

  @override
  String? mapToSql(PrayerRequestState? value) =>
      value == null ? null : _mapping[value.index];
}

@UseDao(tables: [PrayerRequests])
class PrayerRequestsDao extends DatabaseAccessor<AppDatabase>
    with _$PrayerRequestsDaoMixin {
  PrayerRequestsDao(AppDatabase db) : super(db);

  Stream<PrayerRequest> getPrayerRequestStream(int id) {
    return (select(prayerRequests)..where((d) => d.id.equals(id)))
        .watchSingle();
  }

  Stream<List<PrayerRequest>> getActivePrayerRequestsStream() {
    return (select(prayerRequests)
          ..where((d) => d.state.equals("active"))
          ..orderBy([
            (item) => OrderingTerm.desc(item.emphasized),
            (item) => OrderingTerm.desc(item.created),
          ]))
        .watch();
  }

  Stream<List<PrayerRequest>> getDonePrayerRequestsStream() {
    return (select(prayerRequests)
          ..where((d) => d.state.equals("done"))
          ..orderBy([
            (item) => OrderingTerm.desc(item.emphasized),
            (item) => OrderingTerm.desc(item.created),
          ]))
        .watch();
  }

  Stream<List<PrayerRequest>> getArchivedPrayerRequestStream() {
    return (select(prayerRequests)
          ..where((d) => d.state.equals("archived"))
          ..orderBy([
            (item) => OrderingTerm.desc(item.emphasized),
            (item) => OrderingTerm.desc(item.created),
          ]))
        .watch();
  }

  Future<int> insertPrayerRequest(PrayerRequestsCompanion prayerRequest) {
    return into(prayerRequests).insert(prayerRequest);
  }

  Future<int> updatePrayerRequest(
      PrayerRequest prayerRequest, PrayerRequestsCompanion newPrayerRequest) {
    return (update(prayerRequests)..whereSamePrimaryKey(prayerRequest))
        .write(newPrayerRequest);
  }

  Future<int> deletePrayerRequest(PrayerRequest prayerRequest) {
    return delete(prayerRequests).delete(prayerRequest);
  }

  Future<int> deletePrayerRequests(List<PrayerRequest> items) {
    return (delete(prayerRequests)
          ..where((item) => item.id.isIn(items.map((e) => e.id))))
        .go();
  }

  Future<int?> getIdForShareId(String shareId) {
    return (selectOnly(prayerRequests)
          ..addColumns([prayerRequests.id])
          ..where(prayerRequests.shareId.equals(shareId))
          ..limit(1))
        .map((result) => result.read(prayerRequests.id))
        .getSingle();
  }
}
