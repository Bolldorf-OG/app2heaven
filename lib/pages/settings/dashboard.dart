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

class DashboardSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final strings = S.of(context);
    final settings = Provider.of<AppPreferences>(context).settings.dashboard;
    final analytics = FirebaseAnalytics();

    return Scaffold(
      appBar: AppBar(
        title: Text(strings.dashboard_settings),
      ),
      bottomNavigationBar: NavigationBottomAppBar(),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          PreferenceBuilder<bool>(
            preference: settings.audioStimulus,
            builder: (context, value) => SwitchListTile(
              value: value,
              title: Text(strings.audio_stimulus),
              onChanged: (value) {
                analytics.logEvent(
                  name: AnalyticsConstants.eventDashboardWidget,
                  parameters: {
                    "audio_stimulus": value,
                  },
                );

                settings.audioStimulus.setValue(value);
              },
            ),
          ),
          PreferenceBuilder<bool>(
            preference: settings.currentWords,
            builder: (context, value) => SwitchListTile(
              value: value,
              title: Text(strings.current_words),
              onChanged: (value) {
                analytics.logEvent(
                  name: AnalyticsConstants.eventDashboardWidget,
                  parameters: {
                    "current_words": value,
                  },
                );

                settings.currentWords.setValue(value);
              },
            ),
          ),
          PreferenceBuilder<bool>(
            preference: settings.currentPrayerRequests,
            builder: (context, value) => SwitchListTile(
              value: value,
              title: Text(strings.current_prayerrequests),
              onChanged: (value) {
                analytics.logEvent(
                  name: AnalyticsConstants.eventDashboardWidget,
                  parameters: {
                    "current_prayer_requests": value,
                  },
                );

                settings.currentPrayerRequests.setValue(value);
              },
            ),
          ),
          PreferenceBuilder<bool>(
            preference: settings.prayerTimer,
            builder: (context, value) => SwitchListTile(
              value: value,
              title: Text(strings.prayer_clock),
              onChanged: (value) {
                analytics.logEvent(
                  name: AnalyticsConstants.eventDashboardWidget,
                  parameters: {
                    "prayer_times": value,
                  },
                );

                settings.prayerTimer.setValue(value);
              },
            ),
          ),
          PreferenceBuilder<bool>(
            preference: settings.randomBible,
            builder: (context, value) => SwitchListTile(
              value: value,
              title: Text(strings.random_word_of_god),
              onChanged: (value) {
                analytics.logEvent(
                  name: AnalyticsConstants.eventDashboardWidget,
                  parameters: {
                    "random_bible": value,
                  },
                );

                settings.randomBible.setValue(value);
              },
            ),
          ),
          PreferenceBuilder<bool>(
            preference: settings.randomExperience,
            builder: (context, value) => SwitchListTile(
              value: value,
              title: Text(strings.random_experience),
              onChanged: (value) {
                analytics.logEvent(
                  name: AnalyticsConstants.eventDashboardWidget,
                  parameters: {
                    "random_experience": value,
                  },
                );

                settings.randomExperience.setValue(value);
              },
            ),
          ),
          PreferenceBuilder<bool>(
            preference: settings.randomStimulus,
            builder: (context, value) => SwitchListTile(
              value: value,
              title: Text(strings.random_stimulus),
              onChanged: (value) {
                analytics.logEvent(
                  name: AnalyticsConstants.eventDashboardWidget,
                  parameters: {
                    "random_stimulus": value,
                  },
                );

                settings.randomStimulus.setValue(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
