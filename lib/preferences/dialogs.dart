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
  final Preference<bool> reset2021;
  final Preference<bool> askForAnalytics;
  final Preference<bool> askForProgrammers;

  DialogsPreferences(StreamingSharedPreferences preferences)
      : reset2021 = preferences.getBool(
          DialogsConstants.keyReset2021,
          defaultValue: false,
        ),
        askForAnalytics = preferences.getBool(
          DialogsConstants.keyAskForAnalytics,
          defaultValue: true,
        ),
        askForProgrammers = preferences.getBool(
          DialogsConstants.keyAskForProgrammers,
          defaultValue: true,
        );

  Map<String, dynamic> get jsonData => {
        "reset2021": reset2021.getValue(),
        "askForAnalytics": askForAnalytics.getValue(),
        "askForProgrammers": askForProgrammers.getValue(),
      };

  Future<void> readFromJson(Map<String, dynamic> prefsJson) async {
    await reset2021.setOrClearValue(prefsJson["reset2021"]);
    await askForAnalytics.setOrClearValue(prefsJson["askForAnalytics"]);
    await askForProgrammers.setOrClearValue(prefsJson["askForProgrammers"]);
  }
}
