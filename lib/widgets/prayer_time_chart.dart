/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../db/database.dart';
import '../db/prayer_items.dart';
import '../util/helpers.dart';

class PrayerTimeChart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PrayerTimeChartState();
}

class _PrayerTimeChartState extends State<PrayerTimeChart> {
  final _todayLocal = DateTime.now().startOfDay;

  DateTime get _todayUtc => DateTime.utc(_todayLocal.year, _todayLocal.month, _todayLocal.day);

  List<DateTime> get _days => List.generate(7, (index) => _todayUtc.subtract(Duration(days: index))).reversed.toList();

  List<PrayerDuration> _intendedPrayerTimes = [];

  void _loadIntendedPrayerTimes() async {
    final durations = [
      for (final day in _days)
        PrayerDuration(
          date: day,
          duration: await getIntendedPrayerTime(day.getWeekday()),
        )
    ];

    setState(() {
      _intendedPrayerTimes = durations;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadIntendedPrayerTimes();
  }

  @override
  Widget build(BuildContext context) {
    final dao = Provider.of<AppDatabase>(context).prayerItemsDao;
    final locale = Localizations.localeOf(context);
    final textTheme = Theme.of(context).textTheme;

    return StreamBuilder<Map<DateTime, PrayerDuration>>(
      stream: dao
          .getTotalPrayerDurationsForDateRange(
            _days.first,
            _days.last.endOfDay,
          )
          .map((list) => {
                for (final item in list) DateTime.utc(item.date.year, item.date.month, item.date.day): item,
              }),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        }

        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );
          case ConnectionState.active:
          case ConnectionState.done:
            var maxDuration = max(
              _intendedPrayerTimes.isEmpty ? 0.0 : _intendedPrayerTimes.map((e) => e.duration.inMinutes).reduce(max),
              snapshot.data!.values.isEmpty ? 0.0 : snapshot.data!.values.map((e) => e.duration.inMinutes).reduce(max),
            );
            maxDuration = (maxDuration / 10.0).ceil() * 10;

            final verticalInterval = _findInterval(maxDuration.toDouble());

            return BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: maxDuration.toDouble() * Duration.millisecondsPerMinute,
                gridData: FlGridData(
                  show: true,
                  horizontalInterval: max(
                    1,
                    verticalInterval / 2 * Duration.millisecondsPerMinute,
                  ),
                ),
                barGroups: [
                  for (var i = 0; i < 7; ++i)
                    BarChartGroupData(
                      x: i,
                      barRods: [
                        BarChartRodData(
                          y: max(
                            _intendedPrayerTimes[i].duration.inMilliseconds.toDouble(),
                            snapshot.data![_days[i]]?.duration.inMilliseconds.toDouble() ?? 0,
                          ),
                          colors: [Colors.red],
                          rodStackItems: [
                            BarChartRodStackItem(
                              0,
                              snapshot.data![_days[i]]?.duration.inMilliseconds.toDouble() ?? 0,
                              Colors.blue,
                            ),
                          ],
                          width: 16,
                          borderRadius: BorderRadius.zero,
                        ),
                      ],
                    ),
                ],
                barTouchData: BarTouchData(
                  enabled: true,
                  touchTooltipData: BarTouchTooltipData(
                    getTooltipItem: (group, i, rod, j) => BarTooltipItem(
                      "${snapshot.data![_days[i]]?.duration.inMinutes ?? 0} / ${_intendedPrayerTimes[i].duration.inMinutes} min",
                      textTheme.subtitle2!,
                    ),
                  ),
                ),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: SideTitles(
                    showTitles: true,
                    getTitles: (value) {
                      return DateFormat(DateFormat.ABBR_WEEKDAY, locale.toLanguageTag()).format(_days[value.toInt()]);
                    },
                  ),
                  leftTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 32,
                    interval: max(1, verticalInterval * Duration.millisecondsPerMinute),
                    getTitles: (value) {
                      return Duration(milliseconds: value.toInt()).formatHoursMinutesShort();
                    },
                  ),
                ),
              ),
            );
        }
      },
    );
  }

  double _findInterval(double range) {
    const baseIntervals = [
      0.01,
      0.02,
      0.025,
      0.03,
      0.04,
      0.05,
      0.06,
      0.07,
      0.08,
      0.09,
      0.1,
      0.2,
      0.25,
      0.3,
      0.4,
      0.5,
      0.6,
      0.7,
      0.8,
      0.9,
      1.0,
      2.0,
      2.50,
      3.0,
      4.0,
      5.0,
      6.0,
      7.0,
      8.0,
      9.0,
    ];

    var candidates = <double>{};
    for (var power = 0; pow(10, power) < range; power++) {
      for (final baseInterval in baseIntervals) {
        final interval = baseInterval * pow(10, power);
        final steps = (range / interval).ceil();
        if (4 <= steps && steps <= 10) {
          candidates.add(interval);
        }
      }
    }

    if (candidates.isEmpty) {
      return range / 5;
    }

    final pow10 = candidates.where((c) => log(c).remainder(log(10)) == 0).toList();
    if (pow10.isNotEmpty) {
      return pow10.last;
    }

    final pow10Half = candidates.where((c) => log(2 * c).remainder(log(10)) == 0).toList();
    if (pow10Half.isNotEmpty) {
      return pow10Half.last;
    }

    return candidates.last;
  }
}
