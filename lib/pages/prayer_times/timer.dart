/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app2heaven.dart';
import '../../db/database.dart';
import '../../generated/l10n.dart';
import '../../util/helpers.dart';
import '../../widgets/navigation_drawer.dart';
import '../../widgets/prayer_time_chart.dart';
import '../../widgets/prayer_timer.dart';

class PrayerTimerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final strings = S.of(context);
    final textTheme = Theme.of(context).textTheme;
    final dao = Provider.of<AppDatabase>(context).prayerItemsDao;
    final a2hText = Provider.of<App2HeavenTextStyle>(context).textStyle;

    return OrientationBuilder(
      builder: (context, orientation) => Scaffold(
        appBar: AppBar(
          title: Text(strings.real_prayertimes),
        ),
        bottomNavigationBar: NavigationBottomAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                child: orientation == Orientation.portrait
                    ? Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(bottom: 16),
                        child: Image.asset(
                          "assets/prayer_times/clock.png",
                          height: 64,
                          width: 64,
                        ),
                      )
                    : null,
              ),
              PrayerTimer(
                builder: (context, active, duration, togglePrayerTime) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      duration?.format() ?? "",
                      style: textTheme.headline4,
                    ),
                    active
                        ? ElevatedButton(
                            onPressed: togglePrayerTime,
                            child: Text(strings.end_prayertime),
                          )
                        : ElevatedButton(
                            onPressed: togglePrayerTime,
                            child: Text(strings.start_prayertime),
                          ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                child: Text(
                  strings.seven_day_review,
                  style: textTheme.headline6,
                ),
              ),
              Row(
                children: <Widget>[
                  Text(
                    strings.avg_per_day,
                    style: a2hText,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: StreamBuilder<Duration?>(
                        stream: dao.getAveragePrayerTimeStream(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Text("Error: ${snapshot.error}");
                          }
                          return Text(
                            (snapshot.data ?? Duration.zero).formatHoursMinutes(context),
                            style: a2hText,
                          );
                        }),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PrayerTimeChart(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
