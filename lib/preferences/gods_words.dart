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

class GodsWordsPreferences {
  final Map<GodsWordsReminderType, Preference<bool>> _reminderEnabled;
  final Map<GodsWordsReminderType, Preference<TimeOfDay>> _reminderTime;
  final Map<GodsWordsReminderType, Preference<String>> _reminderTitle;

  GodsWordsPreferences(StreamingSharedPreferences preferences)
      : _reminderEnabled = {
          for (var type in GodsWordsReminderType.values)
            type: preferences.getBool(
              GodsWordsConstants.reminderEnabled(type),
              defaultValue: false,
            )
        },
        _reminderTime = {
          for (var type in GodsWordsReminderType.values)
            type: preferences.getCustomValue(
              GodsWordsConstants.reminderTime(type),
              defaultValue: GodsWordsConstants.reminderDefaultTime(type),
              adapter: TimeOfDayAdapter.instance,
            )
        },
        _reminderTitle = {
          for (var type in GodsWordsReminderType.values)
            type: preferences.getString(
              GodsWordsConstants.reminderTitle(type),
              defaultValue: "",
            )
        };

  Preference<bool> reminderEnabled(GodsWordsReminderType type) => _reminderEnabled[type]!;

  Preference<TimeOfDay> reminderTime(GodsWordsReminderType type) => _reminderTime[type]!;

  Preference<String> reminderTitle(GodsWordsReminderType type) => _reminderTitle[type]!;

  Map<String, dynamic> get jsonData => {
        for (var type in GodsWordsReminderType.values)
          type.toString(): {
            "enabled": _reminderEnabled[type]!.getValue(),
            "time": _reminderTime[type]!.getValue().toString(),
            "title": _reminderTitle[type]!.getValue(),
          }
      };

  Future<void> readFromJson(Map<String, dynamic> prefsJson) async {
    for (var type in GodsWordsReminderType.values) {
      await _reminderEnabled[type]!.setOrClearValue(prefsJson["enabled"]);
      await _reminderTime[type]!.setOrClearValue(JsonHelper.readTimeOfDay(prefsJson["time"]));
      await _reminderTitle[type]!.setOrClearValue(prefsJson["title"]);
    }
  }
}
