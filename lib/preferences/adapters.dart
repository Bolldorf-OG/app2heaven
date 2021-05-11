/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

import '../util/constants.dart';
import '../util/helpers.dart';

class LocaleAdapter implements PreferenceAdapter<Locale> {
  static const instance = LocaleAdapter._();

  const LocaleAdapter._();

  @override
  Locale? getValue(SharedPreferences preferences, String key) {
    final value = preferences.getString(key);
    if (value == null) {
      return null;
    }

    if (value.isEmpty || preferences.getBool(SettingsConstants.keyUseSystemLocale) != false) {
      return null;
    }

    return Locale(Intl.shortLocale(value));
  }

  @override
  Future<bool> setValue(SharedPreferences preferences, String key, Locale? value) {
    return preferences.setString(key, value!.toLanguageTag());
  }
}

class TimeOfDayAdapter implements PreferenceAdapter<TimeOfDay> {
  static const instance = TimeOfDayAdapter._();

  const TimeOfDayAdapter._();

  @override
  TimeOfDay? getValue(SharedPreferences preferences, String key) {
    final value = preferences.getInt(key);
    if (value == null) {
      return null;
    }

    return timeOfDayFromMinutes(value);
  }

  @override
  Future<bool> setValue(SharedPreferences preferences, String key, TimeOfDay value) {
    return preferences.setInt(key, value.hour * TimeOfDay.minutesPerHour + value.minute);
  }
}

class DurationAdapter implements PreferenceAdapter<Duration> {
  static const instance = DurationAdapter._();

  const DurationAdapter._();

  @override
  Duration? getValue(SharedPreferences preferences, String key) {
    final value = preferences.getInt(key);
    if (value == null) {
      return null;
    }

    return Duration(microseconds: value);
  }

  @override
  Future<bool> setValue(SharedPreferences preferences, String key, Duration value) {
    return preferences.setInt(key, value.inMicroseconds);
  }
}
