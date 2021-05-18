/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:provider/provider.dart';

import '../../generated/l10n.dart';
import '../../preferences/preferences.dart';
import '../../util/helpers.dart';
import '../../widgets/navigation_drawer.dart';
import 'calm_down.dart';
import 'confession.dart';
import 'decisions.dart';
import 'deeds.dart';
import 'evening_prayer.dart';
import 'forgiveness.dart';
import 'prayer_time.dart';

class DayReviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final strings = S.of(context);
    final pageNotifier = ValueNotifier(0);
    final settings = Provider.of<AppPreferences>(context).settings.daysReview;
    final locale = Localizations.localeOf(context);

    final now = DateTime.now();
    final date = now.hour < 4 ? now.add(Duration(hours: -12)).startOfDay : now.startOfDay;

    final pages = [
      if (settings.prayerTime.getValue() == true) DayReviewPrayerTime(date: date),
      if (settings.decisions.getValue() == true) DayReviewDecisions(date: date),
      if (settings.deeds.getValue() == true) DayReviewDeeds(date: date),
      DayReviewCalmDown(),
      DayReviewConfession(),
      DayReviewForgiveness(),
      DayReviewEveningPrayer(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(strings.daysreview_date(locale.shortDateFormat.format(date))),
      ),
      bottomNavigationBar: NavigationBottomAppBar(),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: PageView(
              onPageChanged: (value) {
                FirebaseAnalytics().setCurrentScreen(screenName: "/day-review/$value");
                pageNotifier.value = value;
              },
              children: pages,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: CirclePageIndicator(
                itemCount: pages.length,
                currentPageNotifier: pageNotifier,
              ),
            ),
          )
        ],
      ),
    );
  }
}
