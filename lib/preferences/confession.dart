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

class ConfessionPreferences {
  final Preference<DateTime> reminderDate;

  ConfessionPreferences(StreamingSharedPreferences preferences)
      : reminderDate = preferences.getCustomValue(
          ConfessionConstants.keyReminderDate,
          defaultValue: DateTime(-1),
          adapter: DateTimeAdapter.instance,
        );

  Map<String, dynamic> get jsonData => {
        "reminderDate": reminderDate.getValue().toIso8601String(),
      };

  Future<void> readFromJson(Map<String, dynamic> prefsJson) async {
    await reminderDate.setOrClearValue(DateTime.parse(prefsJson["reminderDate"]));
  }
}
