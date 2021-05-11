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

class DialogsPreferences {
  final Preference<bool> askForAnalytics;
  final Preference<bool> askForProgrammers;
  final Preference<DateTime> askForDonationsDate;

  DialogsPreferences(StreamingSharedPreferences preferences)
      : askForAnalytics = preferences.getBool(
          DialogsConstants.keyAskForAnalytics,
          defaultValue: true,
        ),
        askForProgrammers = preferences.getBool(
          DialogsConstants.keyAskForProgrammers,
          defaultValue: true,
        ),
        askForDonationsDate = preferences.getCustomValue(
          DialogsConstants.keyAskForDonationsDate,
          defaultValue: DateTime(1),
          adapter: DateTimeAdapter.instance,
        );

  Map<String, dynamic> get jsonData => {
        "askForAnalytics": askForAnalytics.getValue(),
        "askForProgrammers": askForProgrammers.getValue(),
        "askForDonationsDate": askForDonationsDate.getValue().toIso8601String(),
      };

  Future<void> readFromJson(Map<String, dynamic> prefsJson) async {
    await askForAnalytics.setOrClearValue(prefsJson["askForAnalytics"]);
    await askForProgrammers.setOrClearValue(prefsJson["askForProgrammers"]);
    await askForDonationsDate.setOrClearValue(DateTime.parse(prefsJson["askForDonationsDate"]));
  }
}
