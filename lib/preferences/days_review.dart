/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

import '../util/constants.dart';
import 'preferences.dart';

class DaysReviewSettings {
  final Preference<bool> prayerTime;
  final Preference<bool> decisions;
  final Preference<bool> deeds;

  DaysReviewSettings(StreamingSharedPreferences preferences)
      : prayerTime = preferences.getBool(
          SettingsConstants.keyDaysReviewPrayerTime,
          defaultValue: true,
        ),
        decisions = preferences.getBool(
          SettingsConstants.keyDaysReviewDecisions,
          defaultValue: true,
        ),
        deeds = preferences.getBool(
          SettingsConstants.keyDaysReviewDeeds,
          defaultValue: true,
        );

  Map<String, dynamic> get jsonData => {
        "prayerTime": prayerTime.getValue(),
        "decisions": decisions.getValue(),
        "deeds": deeds.getValue(),
      };

  Future<void> readFromJson(Map<String, dynamic> prefsJson) async {
    await prayerTime.setOrClearValue(prefsJson["prayerTime"]);
    await decisions.setOrClearValue(prefsJson["decisions"]);
    await deeds.setOrClearValue(prefsJson["deeds"]);
  }
}
