/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'dart:convert';
import 'dart:io';

import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

import 'confession.dart';
import 'dialogs.dart';
import 'gods_words.dart';
import 'prayer_times.dart';
import 'settings.dart';

class AppPreferences {
  final AppSettings settings;
  final ConfessionPreferences confession;
  final PrayerTimesPreferences prayerTimes;
  final GodsWordsPreferences godsWords;
  final DialogsPreferences dialogs;

  AppPreferences(StreamingSharedPreferences preferences)
      : settings = AppSettings(preferences),
        confession = ConfessionPreferences(preferences),
        prayerTimes = PrayerTimesPreferences(preferences),
        godsWords = GodsWordsPreferences(preferences),
        dialogs = DialogsPreferences(preferences);

  Future<void> writeToJsonFile(File file) async {
    final data = JsonUtf8Encoder().convert({
      "settings": settings.jsonData,
      "confession": confession.jsonData,
      "prayerTimes": prayerTimes.jsonData,
      "godsWords": godsWords.jsonData,
      "dialogs": dialogs.jsonData,
    });
    await file.writeAsBytes(data);
  }

  Future<void> readFromJson(Map<String, dynamic> prefsJson) async {
    await settings.readFromJson(prefsJson["settings"]);
    await confession.readFromJson(prefsJson["confession"]);
    await prayerTimes.readFromJson(prefsJson["prayerTimes"]);
    await godsWords.readFromJson(prefsJson["godsWords"]);
    await dialogs.readFromJson(prefsJson["dialogs"]);
  }
}

extension PreferenceExtensions<T extends Object> on Preference<T> {
  Future<bool> setOrClearValue(T? value) {
    if (value == null) {
      return clear();
    }
    return setValue(value);
  }
}
