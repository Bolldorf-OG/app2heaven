// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer_items.dart';

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$PrayerItemsDaoMixin on DatabaseAccessor<AppDatabase> {
  $PrayerItemsTable get prayerItems => attachedDatabase.prayerItems;
  Selectable<int> prayerTimeAvergePerDayLastWeek() {
    return customSelect(
        'WITH RECURSIVE generate_series(value) AS (\n        SELECT CAST(strftime(\'%s\', CURRENT_DATE) AS INTEGER) - 86400 * 6\n        UNION ALL\n            SELECT value + 86400\n                FROM generate_series\n                WHERE value + 86400 <= CAST(strftime(\'%s\', CURRENT_DATE) AS INTEGER)\n    ), sums AS (\n        SELECT g.value as date, sum(coalesce(p.duration, 0)) as duration\n            FROM generate_series g\n                LEFT JOIN prayer_items p ON g.value = CAST(strftime(\'%s\', date(p.date, \'unixepoch\', \'localtime\')) AS INTEGER)\n            GROUP BY g.value\n    ) SELECT CAST(avg(duration) AS INTEGER) as avg_duration FROM sums',
        variables: [],
        readsFrom: {
          prayerItems,
        }).map((QueryRow row) => row.read<int>('avg_duration'));
  }

  Selectable<PrayerDuration> totalPrayerDurationsForDateRange(
      Expression<DateTime?> from, Expression<DateTime?> to) {
    final generatedfrom = $write(from);
    final generatedto = $write(to);
    return customSelect(
        'SELECT CAST (day AS DATETIME) as date, duration as duration FROM (\n        SELECT strftime(\'%s\', p.date, \'unixepoch\', \'localtime\',\'start of day\') as day, sum(coalesce(p.duration, 0)) as duration\n            FROM prayer_items p\n            WHERE p.date BETWEEN ${generatedfrom.sql} AND ${generatedto.sql}\n            GROUP BY day\n    )',
        variables: [
          ...generatedfrom.introducedVariables,
          ...generatedto.introducedVariables
        ],
        readsFrom: {
          prayerItems,
          ...generatedfrom.watchedTables,
          ...generatedto.watchedTables,
        }).map((QueryRow row) {
      return PrayerDuration(
        date: row.read<DateTime>('date'),
        duration:
            $PrayerItemsTable.$converter0.mapToDart(row.read<int>('duration'))!,
      );
    });
  }
}

class PrayerDuration {
  final DateTime date;
  final Duration duration;
  PrayerDuration({
    required this.date,
    required this.duration,
  });
}
