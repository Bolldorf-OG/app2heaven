/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

import '../generated/l10n.dart';
import '../preferences/preferences.dart';

extension DurationExtensions on Duration {
  String formatHoursMinutesShort() {
    final num minutes = inMinutes.remainder(Duration.minutesPerHour);
    final hours = inHours;
    if (hours == 0) {
      return "$minutes\u2009min";
    } else if (minutes == 0) {
      return "$hours\u2009h";
    } else {
      return "$hours:$minutes\u2009h";
    }
  }

  String formatHoursMinutes(BuildContext context) {
    return formatHoursMinutesStrings(S.of(context));
  }

  String formatHoursMinutesStrings(S strings) {
    final num minutes = inMinutes.remainder(Duration.minutesPerHour);
    final hours = inHours;
    if (hours == 0) {
      return strings.x_minutes(minutes);
    } else if (minutes == 0) {
      return strings.x_hours(hours);
    } else {
      return strings.x_h_y_min(hours, minutes);
    }
  }

  String format() {
    String twoDigits(int n) {
      assert(n >= 0 && n < 100);
      if (n >= 10) return "$n";
      return "0$n";
    }

    final num minutes = inMinutes.remainder(Duration.minutesPerHour);
    final num seconds = inSeconds.remainder(Duration.secondsPerMinute);
    return "$inHours:${twoDigits(minutes as int)}:${twoDigits(seconds as int)}";
  }

  String toJson() {
    String sixDigits(int n) {
      assert(n >= 0 && n < 1000000);
      if (n >= 100000) return "$n";
      if (n >= 10000) return "0$n";
      if (n >= 1000) return "00$n";
      if (n >= 100) return "000$n";
      if (n >= 10) return "0000$n";
      return "00000$n";
    }

    final minutes = inMinutes.remainder(Duration.minutesPerHour);
    final seconds = inSeconds.remainder(Duration.secondsPerMinute);
    final microseconds =
        inMicroseconds.remainder(Duration.microsecondsPerSecond);
    return "PT${inHours}H${minutes}M$seconds.${sixDigits(microseconds)}S";
  }
}

TimeOfDay timeOfDayFromMinutes(int minutes) {
  return TimeOfDay.fromDateTime(DateTime(1).add(Duration(minutes: minutes)));
}

extension StringExtensions on String {
  String ellipsize(int maxLength) {
    if (length < maxLength) {
      return this;
    } else {
      return substring(0, maxLength - 1) + "…";
    }
  }
}

extension DateTimeExtensions on DateTime {
  DateTime get startOfDay =>
      isUtc ? DateTime.utc(year, month, day) : DateTime(year, month, day);

  DateTime get endOfDay =>
      startOfDay.add(Duration(days: 1) - Duration(microseconds: 1));

  Weekday getWeekday() => Weekday.values[weekday - 1];

  TimeOfDay get timeOfDay => TimeOfDay(hour: hour, minute: minute);
}

extension TimeOfDayExtensions on TimeOfDay {
  String toJson() {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    return "$hour:${twoDigits(minute)}";
  }
}

String? readLocalizedString(
    DocumentSnapshot document, String field, Locale locale) {
  Map<String, dynamic>? localizedString = document.get(field);
  final actualLocale = Intl.verifiedLocale(
    locale.toLanguageTag(),
    (locale) => localizedString!.containsKey(locale),
    onFailure: (_) => null,
  );
  return actualLocale == null
      ? localizedString!["(default)"]
      : localizedString![actualLocale];
}

extension ListExtensions<T> on List<T> {
  T? random() {
    return isEmpty ? null : this[Random().nextInt(length)];
  }
}

/// [weekday] is 0 - 6 for Monday - Sunday
Future<Duration> getIntendedPrayerTime(Weekday weekday) async {
  final prefs =
      AppPreferences(await StreamingSharedPreferences.instance).prayerTimes;
  if (prefs.plannedEnabled(weekday).getValue() != true) {
    return Duration.zero;
  }
  return prefs.plannedDuration(weekday).getValue();
}

extension LocaleExtensions on Locale {
  DateFormat get shortDateFormat => DateFormat.yMd(toLanguageTag());

  DateFormat get mediumDateFormat => DateFormat.yMMMd(toLanguageTag());

  DateFormat get fullDateFormat => DateFormat.yMMMMEEEEd(toLanguageTag());

  String toJson() {
    return toLanguageTag();
  }
}

enum Weekday {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}

extension WeekdayExtensions on Weekday {
  int get intValue => index + 1;

  Day get day => Day.values[(index + 1) % 7];

  static final _knownMonday = DateTime.utc(2021, 2, 1);

  String format(Locale locale) {
    final date = _knownMonday.add(Duration(days: index));
    return DateFormat(DateFormat.ABBR_WEEKDAY, locale.toLanguageTag())
        .format(date);
  }
}

class JsonHelper {
  static Locale? readLocale(String? jsonValue) {
    if (jsonValue == null) {
      return null;
    }

    return Locale(Intl.shortLocale(jsonValue));
  }

  static TimeOfDay? readTimeOfDay(String? jsonValue) {
    if (jsonValue == null) {
      return null;
    }

    final match = RegExp(r'^([0-9]{2}):([0-9]{2})$').firstMatch(jsonValue);
    if (match == null) {
      return null;
    }

    final group1 = match.group(1);
    final group2 = match.group(2);

    if (group1 == null || group2 == null) {
      return null;
    }

    final hour = int.tryParse(group1);
    final minute = int.tryParse(group2);

    if (hour == null || minute == null) {
      return null;
    }

    try {
      return TimeOfDay(hour: hour, minute: minute);
    } catch (_) {
      return null;
    }
  }

  static Duration? readDuration(String? jsonValue) {
    if (jsonValue == null) {
      return null;
    }

    final match = RegExp(r'^PT([0-9]+)H([0-9]+)M([0-9]+).([0-9]{0,6})S$')
        .firstMatch(jsonValue);
    if (match == null) {
      return null;
    }

    final group1 = match.group(1);
    final group2 = match.group(2);
    final group3 = match.group(3);
    final group4 = match.group(4);

    if (group1 == null || group2 == null || group3 == null || group4 == null) {
      return null;
    }

    final hours = int.tryParse(group1);
    final minutes = int.tryParse(group2);
    final seconds = int.tryParse(group3);
    final secondsFraction = int.tryParse(group4);

    if (hours == null ||
        minutes == null ||
        seconds == null ||
        secondsFraction == null) {
      return null;
    }

    final microseconds = secondsFraction * pow(10, 6 - group4.length) as int;

    try {
      return Duration(
          hours: hours,
          minutes: minutes,
          seconds: seconds,
          microseconds: microseconds);
    } catch (_) {
      return null;
    }
  }
}
