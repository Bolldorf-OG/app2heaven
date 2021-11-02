/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../../util/helpers.dart';

class DayPreviewPrayerTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final strings = S.of(context);
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 16),
            child: Image.asset(
              "assets/day_preview.png",
              height: 64,
              width: 64,
            ),
          ),
          Text(
            strings.dayspreview_prayertime_head,
            style: textTheme.headline6,
          ),
          Text(
            strings.dayspreview_prayertime_sub,
            style: textTheme.subtitle1,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(64),
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.asset("assets/prayer_times/icon.png"),
                  FutureBuilder<Duration>(
                    future: getIntendedPrayerTime(DateTime.now().getWeekday()),
                    builder: (context, snapshot) =>
                        Text(snapshot.data?.formatHoursMinutes(context) ?? ""),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
