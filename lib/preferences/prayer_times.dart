/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:flutter/material.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

import '../util/constants.dart';
import '../util/helpers.dart';
import 'adapters.dart';
import 'preferences.dart';

class PrayerTimesPreferences {
  final Preference<bool> everydayEnabled;
  final Map<int, Preference<bool>> _enabled;
  final Map<int, Preference<TimeOfDay>> _time;
  final Map<int, Preference<Duration>> _duration;

  PrayerTimesPreferences(StreamingSharedPreferences preferences)
      : everydayEnabled = preferences.getBool(PrayerTimesConstants.everydayEnabled, defaultValue: false),
        _enabled = {
          for (var day in Weekday.values)
            day.index: preferences.getBool(PrayerTimesConstants.plannedEnabled(day), defaultValue: false)
        },
        _time = {
          for (var day in Weekday.values)
            day.index: preferences.getCustomValue(
              PrayerTimesConstants.plannedTime(day),
              defaultValue: PrayerTimesConstants.plannedDefaultTime,
              adapter: TimeOfDayAdapter.instance,
            )
        },
        _duration = {
          for (var day in Weekday.values)
            day.index: preferences.getCustomValue(
              PrayerTimesConstants.plannedDuration(day),
              defaultValue: PrayerTimesConstants.plannedDurations[0],
              adapter: DurationAdapter.instance,
            )
        };

  Preference<bool> plannedEnabled(Weekday weekday) => _enabled[weekday.index]!;

  Preference<TimeOfDay> plannedTime(Weekday weekday) => _time[weekday.index]!;

  Preference<Duration> plannedDuration(Weekday weekday) => _duration[weekday.index]!;

  Map<String, dynamic> get jsonData => {
        for (var day in Weekday.values)
          day.toString(): {
            "enabled": _enabled[day.index]!.getValue(),
            "time": _time[day.index]!.getValue().toJson(),
            "duration": _duration[day.index]!.getValue().toJson(),
          }
      };

  Future<void> readFromJson(Map<String, dynamic> prefsJson) async {
    for (var day in Weekday.values) {
      await _enabled[day.index]!.setOrClearValue(prefsJson["enabled"]);
      await _time[day.index]!
          .setOrClearValue(JsonHelper.readTimeOfDay(prefsJson["time"]) ?? PrayerTimesConstants.plannedDefaultTime);
      await _duration[day.index]!
          .setOrClearValue(JsonHelper.readDuration(prefsJson["title"]) ?? PrayerTimesConstants.plannedDurations[0]);
    }
  }
}
