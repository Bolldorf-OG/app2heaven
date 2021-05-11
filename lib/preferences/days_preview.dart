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

class DaysPreviewSettings {
  final Preference<bool> godsWords;
  final Preference<bool> decisions;
  final Preference<bool> deeds;
  final Preference<bool> prayerTime;

  DaysPreviewSettings(StreamingSharedPreferences preferences)
      : godsWords = preferences.getBool(
          SettingsConstants.keyDaysPreviewGodsWords,
          defaultValue: true,
        ),
        decisions = preferences.getBool(
          SettingsConstants.keyDaysPreviewDecisions,
          defaultValue: true,
        ),
        deeds = preferences.getBool(
          SettingsConstants.keyDaysPreviewDeeds,
          defaultValue: true,
        ),
        prayerTime = preferences.getBool(
          SettingsConstants.keyDaysPreviewPrayerTime,
          defaultValue: true,
        );

  Map<String, dynamic> get jsonData => {
        "godsWords": godsWords.getValue(),
        "decisions": decisions.getValue(),
        "deeds": deeds.getValue(),
        "prayerTime": prayerTime.getValue(),
      };

  Future<void> readFromJson(Map<String, dynamic> prefsJson) async {
    await godsWords.setOrClearValue(prefsJson["godsWords"]);
    await decisions.setOrClearValue(prefsJson["decisions"]);
    await deeds.setOrClearValue(prefsJson["deeds"]);
    await prayerTime.setOrClearValue(prefsJson["prayerTime"]);
  }
}
