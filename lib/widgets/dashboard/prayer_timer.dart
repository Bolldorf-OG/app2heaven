/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:flutter/material.dart';

import '../../util/helpers.dart';
import '../prayer_timer.dart';

class DashboardPrayerTimer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return PrayerTimer(
      builder: (context, active, duration, togglePrayerTime) => Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
        ),
        color: Color.fromRGBO(0, 0, 0, 0.60),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Image.asset(
                "assets/prayer_times/icon.png",
                height: 96,
                width: 96,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            duration?.format() ?? "",
                            style: textTheme.headline6!
                                .copyWith(color: Colors.white),
                          ),
                          Text(
                            "/",
                            style: textTheme.headline6!
                                .copyWith(color: Colors.grey),
                          ),
                          FutureBuilder<Duration>(
                            future: getIntendedPrayerTime(
                                DateTime.now().getWeekday()),
                            initialData: Duration.zero,
                            builder: (context, snapshot) => Text(
                              snapshot.data?.format() ?? "",
                              style: textTheme.headline6!
                                  .copyWith(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Switch(
                        inactiveTrackColor: Colors.grey,
                        value: active,
                        onChanged: (value) {
                          if (value) {
                            togglePrayerTime();
                          } else {
                            togglePrayerTime();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
