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

class DashboardSettings {
  final Preference<bool> audioStimulus;
  final Preference<bool> currentWords;
  final Preference<bool> currentPrayerRequests;
  final Preference<bool> prayerTimer;
  final Preference<bool> randomBible;
  final Preference<bool> randomExperience;
  final Preference<bool> randomStimulus;

  DashboardSettings(StreamingSharedPreferences preferences)
      : audioStimulus = preferences.getBool(
          SettingsConstants.keyDashboardAudioStimulus,
          defaultValue: true,
        ),
        currentWords = preferences.getBool(
          SettingsConstants.keyDashboardCurrentWords,
          defaultValue: true,
        ),
        currentPrayerRequests = preferences.getBool(
          SettingsConstants.keyDashboardCurrentPrayerRequests,
          defaultValue: true,
        ),
        prayerTimer = preferences.getBool(
          SettingsConstants.keyDashboardPrayerTimer,
          defaultValue: true,
        ),
        randomBible = preferences.getBool(
          SettingsConstants.keyDashboardRandomBible,
          defaultValue: true,
        ),
        randomExperience = preferences.getBool(
          SettingsConstants.keyDashboardRandomExperience,
          defaultValue: true,
        ),
        randomStimulus = preferences.getBool(
          SettingsConstants.keyDashboardRandomStimulus,
          defaultValue: true,
        );

  Map<String, dynamic> get jsonData => {
        "audioStimulus": audioStimulus.getValue(),
        "currentWords": currentWords.getValue(),
        "currentPrayerRequests": currentPrayerRequests.getValue(),
        "prayerTimer": prayerTimer.getValue(),
        "randomBible": randomBible.getValue(),
        "randomExperience": randomExperience.getValue(),
        "randomStimulus": randomStimulus.getValue(),
      };

  Future<void> readFromJson(Map<String, dynamic> prefsJson) async {
    await audioStimulus.setOrClearValue(prefsJson["audioStimulus"]);
    await currentWords.setOrClearValue(prefsJson["currentWords"]);
    await currentPrayerRequests.setOrClearValue(prefsJson["currentPrayerRequests"]);
    await prayerTimer.setOrClearValue(prefsJson["prayerTimer"]);
    await randomBible.setOrClearValue(prefsJson["randomBible"]);
    await randomExperience.setOrClearValue(prefsJson["randomExperience"]);
    await randomStimulus.setOrClearValue(prefsJson["randomStimulus"]);
  }
}
