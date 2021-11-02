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

part 'prayer_items.g.dart';

class PrayerItems extends Table {
  IntColumn get id => integer().autoIncrement()();

  DateTimeColumn get date => dateTime()();

  IntColumn get duration =>
      integer().nullable().map(const DurationConverter())();
}

@UseDao(
  tables: [PrayerItems],
  include: {"prayer_items.moor"},
)
class PrayerItemsDao extends DatabaseAccessor<AppDatabase>
    with _$PrayerItemsDaoMixin {
  PrayerItemsDao(AppDatabase db) : super(db);

  Stream<Duration> getTotalPrayerDurationForDateStream(DateTime date) {
    final totalDuration = prayerItems.duration.sum();

    return (selectOnly(prayerItems)
          ..addColumns([totalDuration])
          ..where(
              prayerItems.date.isBetweenValues(date.startOfDay, date.endOfDay)))
        .map((result) =>
            const DurationConverter().mapToDart(result.read(totalDuration)) ??
            Duration.zero)
        .watchSingle();
  }

  Stream<List<PrayerDuration>> getTotalPrayerDurationsForDateRange(
      DateTime from, DateTime to) {
    return totalPrayerDurationsForDateRange(Constant(from), Constant(to))
        .watch();
  }

  Stream<PrayerItem?> getCurrentPrayerItemStream() {
    return (select(prayerItems)
          ..where((item) => prayerItems.duration.isNull())
          ..orderBy([
            (item) => OrderingTerm.desc(item.date),
          ])
          ..limit(1))
        .watchSingleOrNull();
  }

  Future<void> startPrayerTime(DateTime startTime) {
    return insertPrayerItem(PrayerItemsCompanion.insert(date: startTime));
  }

  Future<void> endPrayerTime(DateTime endTime) async {
    return transaction(() async {
      final prayerItem = await getCurrentPrayerItemStream().first;

      if (prayerItem == null) {
        return;
      }

      final newItem = prayerItem.copyWith(
        duration: endTime.difference(prayerItem.date),
      );
      await update(prayerItems).replace(newItem);
    });
  }

  Future<void> insertPrayerItem(PrayerItemsCompanion item) {
    return into(prayerItems).insert(item);
  }

  Stream<Duration> getAveragePrayerTimeStream() {
    return prayerTimeAvergePerDayLastWeek()
        .map((value) =>
            const DurationConverter().mapToDart(value) ?? Duration.zero)
        .watchSingle();
  }
}
