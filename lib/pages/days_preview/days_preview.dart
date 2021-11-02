/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:provider/provider.dart';

import '../../generated/l10n.dart';
import '../../preferences/preferences.dart';
import '../../util/helpers.dart';
import '../../widgets/navigation_drawer.dart';
import 'decisions.dart';
import 'deeds.dart';
import 'gods_words.dart';
import 'prayer_time.dart';

class DayPreviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final strings = S.of(context);
    final pageNotifier = ValueNotifier(0);
    final settings = Provider.of<AppPreferences>(context).settings.daysPreview;
    final locale = Localizations.localeOf(context);

    final pages = [
      if (settings.godsWords.getValue() == true) DayPreviewWords(),
      if (settings.decisions.getValue() == true) DayPreviewDecisions(),
      if (settings.deeds.getValue() == true) DayPreviewDeeds(),
      if (settings.prayerTime.getValue() == true) DayPreviewPrayerTime(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(strings
            .dayspreview_date(locale.shortDateFormat.format(DateTime.now()))),
      ),
      bottomNavigationBar: NavigationBottomAppBar(),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: pages.isNotEmpty
                ? PageView(
                    onPageChanged: (value) {
                      try {
                        FirebaseAnalytics().setCurrentScreen(
                            screenName: "/day-preview/$value");
                      } catch (e) {
                        // ignored
                      }
                      pageNotifier.value = value;
                    },
                    children: pages,
                  )
                : _NoElementsSelectedPage(),
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

class _NoElementsSelectedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final strings = S.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          strings.dayspreview_no_elements_enabled_title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline6,
        ),
        Text(
          strings.dayspreview_no_elements_enabled_description,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
