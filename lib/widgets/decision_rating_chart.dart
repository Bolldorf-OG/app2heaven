/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../db/database.dart';
import '../util/helpers.dart';

class DecisionRatingChart extends StatelessWidget {
  final int decisionId;

  final _today = DateTime.now().startOfDay;

  List<DateTime> get _days => List.generate(7, (index) => _today.add(Duration(days: -6 + index)));

  DecisionRatingChart({
    Key? key,
    required this.decisionId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dao = Provider.of<AppDatabase>(context).decisionsDao;
    final locale = Localizations.localeOf(context);

    return StreamBuilder<List<DecisionRating>>(
      stream: dao.getDecisionRatingsForDateRangeStream(
        decisionId,
        _days.first,
        _days.last.endOfDay,
      ),
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
            const ratingColors = [
              Color.fromARGB(220, 240, 83, 0),
              Color.fromARGB(227, 252, 158, 0),
              Color.fromARGB(233, 234, 209, 0),
              Color.fromARGB(222, 211, 212, 0),
              Color.fromARGB(198, 0, 156, 21),
            ];

            return LineChart(
              LineChartData(
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
                    getTitles: (value) {
                      return value == 0 ? "" : String.fromCharCode(0xe800 + value.toInt() - 1);
                    },
                    getTextStyles: (value) {
                      if (value == 0) {
                        return TextStyle();
                      }

                      return TextStyle(
                        fontFamily: "RatingsIcons",
                        color: ratingColors[value.toInt() - 1],
                      );
                    },
                  ),
                ),
                minX: 0,
                minY: 1,
                maxY: 5,
                maxX: 6,
                lineBarsData: [
                  LineChartBarData(
                    spots: snapshot.data!
                        .map(
                          (e) => FlSpot(
                            ((e.date.weekday.toDouble() - 1) - (_days.first.weekday - 1)) % 7,
                            e.rating.toDouble(),
                          ),
                        )
                        .toList(),
                    isCurved: false,
                    colors: [Colors.lightGreen],
                    dotData: FlDotData(
                      show: true,
                    ),
                    belowBarData: BarAreaData(
                      show: true,
                      colors: [Colors.lightGreen.withOpacity(0.3)],
                    ),
                  ),
                ],
                lineTouchData: LineTouchData(
                  enabled: false,
                ),
                borderData: FlBorderData(
                  show: true,
                ),
              ),
            );
        }
      },
    );
  }
}
