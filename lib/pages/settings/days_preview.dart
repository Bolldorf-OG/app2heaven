/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

import '../../generated/l10n.dart';
import '../../preferences/preferences.dart';
import '../../util/constants.dart';
import '../../widgets/navigation_drawer.dart';

class DaysPreviewSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final strings = S.of(context);
    final settings = Provider.of<AppPreferences>(context).settings.daysPreview;
    final analytics = FirebaseAnalytics();

    return Scaffold(
      appBar: AppBar(
        title: Text(strings.dayspreview_settings),
      ),
      bottomNavigationBar: NavigationBottomAppBar(),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          PreferenceBuilder<bool>(
            preference: settings.godsWords,
            builder: (context, value) => SwitchListTile(
              value: value,
              title: Text(strings.word_of_god),
              onChanged: (value) {
                analytics.logEvent(
                  name: AnalyticsConstants.eventDaysPreviewWidget,
                  parameters: {
                    "gods_words": value,
                  },
                );

                settings.godsWords.setValue(value);
              },
            ),
          ),
          PreferenceBuilder<bool>(
            preference: settings.decisions,
            builder: (context, value) => SwitchListTile(
              value: value,
              title: Text(strings.decisions),
              onChanged: (value) {
                analytics.logEvent(
                  name: AnalyticsConstants.eventDaysPreviewWidget,
                  parameters: {
                    "decisions": value,
                  },
                );

                settings.decisions.setValue(value);
              },
            ),
          ),
          PreferenceBuilder<bool>(
            preference: settings.deeds,
            builder: (context, value) => SwitchListTile(
              value: value,
              title: Text(strings.deeds),
              onChanged: (value) {
                analytics.logEvent(
                  name: AnalyticsConstants.eventDaysPreviewWidget,
                  parameters: {
                    "deeds": value,
                  },
                );

                settings.deeds.setValue(value);
              },
            ),
          ),
          PreferenceBuilder<bool>(
            preference: settings.prayerTime,
            builder: (context, value) => SwitchListTile(
              value: value,
              title: Text(strings.prayer_time),
              onChanged: (value) {
                analytics.logEvent(
                  name: AnalyticsConstants.eventDaysPreviewWidget,
                  parameters: {
                    "prayer_time": value,
                  },
                );

                settings.prayerTime.setValue(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
