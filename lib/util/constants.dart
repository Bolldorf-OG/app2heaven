/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import './helpers.dart';

Future<String> cloudFunctionsHost({String region = "us-central1"}) async {
  final options = Firebase.app().options;
  return "$region-${options.projectId}.cloudfunctions.net";
}

class ConfessionConstants {
  static const keyPasswordHash = "confession_password_hash";
  static const keyPasswordSalt = "confession_password_salt";
  static const keyIv = "confession_iv";
  static const keySalt = "confession_salt";

  static const keyReminderDate = "confession_reminder_date";
}

class AnalyticsConstants {
  static const keyLocale = "locale";

  static const eventDashboardWidget = "dashboard_widget_toggled";
  static const eventDaysPreviewWidget = "days_preview_widget_toggled";
  static const eventDaysReviewWidget = "days_review_widget_toggled";
  static const eventDonate = "clicked_donate_link";
  static const eventGodsWordsReminder = "set_gods_words_reminder";
  static const eventConfessionReminder = "set_confession_reminder";
  static const eventPrayerTimePlanned = "set_planned_prayer_time";
  static const eventUseSystemLocale = "set_use_system_locale";
  static const eventViewBible = "view_bible";
  static const eventViewBibleRandom = "view_bible_random";
  static const eventRateDecision = "rate_decision";
}

class SettingsConstants {
  static const keyUseSystemLocale = "pref_use_system_locale";
  static const keyLocale = "pref_locale";
  static const keyDashboardAudioStimulus = "pref_dashboard_audio_stimulus";
  static const keyDashboardCurrentWords = "pref_dashboard_current_words";
  static const keyDashboardCurrentPrayerRequests = "pref_dashboard_current_prayer_requests";
  static const keyDashboardPrayerTimer = "pref_dashboard_prayer_timer";
  static const keyDashboardRandomBible = "pref_dashboard_random_bible";
  static const keyDashboardRandomExperience = "pref_dashboard_random_experience";
  static const keyDashboardRandomStimulus = "pref_dashboard_random_stimulus";
  static const keyDaysPreviewGodsWords = "pref_days_preview_gods_words";
  static const keyDaysPreviewDecisions = "pref_days_preview_decisions";
  static const keyDaysPreviewDeeds = "pref_days_preview_deeds";
  static const keyDaysPreviewPrayerTime = "pref_days_preview_prayer_time";
  static const keyDaysReviewPrayerTime = "pref_days_review_prayer_time";
  static const keyDaysReviewDecisions = "pref_days_review_decisions";
  static const keyDaysReviewDeeds = "pref_days_review_deeds";
  static const keyAnalyticsEnabled = "pref_dashboard_analytics";
}

class BackupConstants {
  static const keyDirectory = "backup_directory";
}

class DialogsConstants {
  static const keyAskForAnalytics = "dialogs_ask_for_analytics";
  static const keyAskForProgrammers = "dialogs_ask_for_programmers";
  static const keyAskForDonationsDate = "dialogs_asked_for_donations_on";
  static const emailProgrammers = "info@app2heaven.org";
}

class DonationsConstants {
  static const link = "https://www.app2heaven.com/#comp-jgkv57g5";
  static const timeoutNormal = Duration(days: 30);
  static const timeoutExtended = Duration(days: 90);
}

enum GodsWordsReminderType {
  morning,
  noon,
  afternoon,
  evening,
}

class GodsWordsConstants {
  static const _prefixReminder = "gods_words_reminder";

  static const _suffixReminderEnabled = "_enabled";
  static const _suffixReminderTitle = "_gods_word_title";
  static const _suffixReminderTime = "_time";

  static const _prefixesReminder = {
    GodsWordsReminderType.morning: "${_prefixReminder}_morning",
    GodsWordsReminderType.noon: "${_prefixReminder}_noon",
    GodsWordsReminderType.afternoon: "${_prefixReminder}_afternoon",
    GodsWordsReminderType.evening: "${_prefixReminder}_evening",
  };

  static const _reminderDefaultTimes = {
    GodsWordsReminderType.morning: TimeOfDay(hour: 9, minute: 0),
    GodsWordsReminderType.noon: TimeOfDay(hour: 12, minute: 0),
    GodsWordsReminderType.afternoon: TimeOfDay(hour: 15, minute: 0),
    GodsWordsReminderType.evening: TimeOfDay(hour: 21, minute: 0),
  };

  static const _reminderNotificationIds = {
    GodsWordsReminderType.morning: NotificationIds.godsWordMorning,
    GodsWordsReminderType.noon: NotificationIds.godsWordNoon,
    GodsWordsReminderType.afternoon: NotificationIds.godsWordAfternoon,
    GodsWordsReminderType.evening: NotificationIds.godsWordEvening,
  };

  static String reminderEnabled(GodsWordsReminderType type) {
    return _prefixesReminder[type]! + _suffixReminderEnabled;
  }

  static String reminderTime(GodsWordsReminderType type) {
    return _prefixesReminder[type]! + _suffixReminderTime;
  }

  static String reminderTitle(GodsWordsReminderType type) {
    return _prefixesReminder[type]! + _suffixReminderTitle;
  }

  static TimeOfDay reminderDefaultTime(GodsWordsReminderType type) {
    return _reminderDefaultTimes[type]!;
  }

  static int reminderNotificationId(GodsWordsReminderType type) {
    return _reminderNotificationIds[type]!;
  }
}

class PrayerTimesConstants {
  static const _prefixPlanned = "planned_prayer_times_";

  static const _suffixPlannedEnabled = "_enabled";
  static const _suffixPlannedTime = "_time";
  static const _suffixPlannedDuration = "_duration";

  static const Map<Weekday, String> _prefixesPlanned = {
    Weekday.monday: "${_prefixPlanned}_monday",
    Weekday.tuesday: "${_prefixPlanned}_tuesday",
    Weekday.wednesday: "${_prefixPlanned}_wednesday",
    Weekday.thursday: "${_prefixPlanned}_thursday",
    Weekday.friday: "${_prefixPlanned}_friday",
    Weekday.saturday: "${_prefixPlanned}_saturday",
    Weekday.sunday: "${_prefixPlanned}_sunday",
  };

  static const plannedDurations = [
    Duration(minutes: 10),
    Duration(minutes: 20),
    Duration(minutes: 30),
    Duration(minutes: 40),
    Duration(minutes: 50),
    Duration(hours: 1),
  ];

  static const plannedDefaultTime = TimeOfDay(hour: 12, minute: 0);

  static String everydayEnabled = _prefixPlanned + "same_everyday";

  static String plannedEnabled(Weekday weekday) {
    return _prefixesPlanned[weekday]! + _suffixPlannedEnabled;
  }

  static String plannedTime(Weekday weekday) {
    return _prefixesPlanned[weekday]! + _suffixPlannedTime;
  }

  static String plannedDuration(Weekday weekday) {
    return _prefixesPlanned[weekday]! + _suffixPlannedDuration;
  }
}

class NotificationChannels {
  const NotificationChannels._();

  static NotificationDetails main(String bigText) => NotificationDetails(
        android: AndroidNotificationDetails(
          "app2heaven",
          "App2Heaven",
          "",
          importance: Importance.high,
          priority: Priority.high,
          styleInformation: BigTextStyleInformation(bigText),
        ),
        iOS: IOSNotificationDetails(),
      );
}

class NotificationIds {
  const NotificationIds._();

  static const confession = 112233;

  static const godsWordMorning = 990011;
  static const godsWordNoon = 990022;
  static const godsWordAfternoon = 990033;
  static const godsWordEvening = 990044;

  static const Map<Weekday, int> prayerTimes = {
    Weekday.monday: 887711,
    Weekday.tuesday: 887722,
    Weekday.wednesday: 887733,
    Weekday.thursday: 887744,
    Weekday.friday: 887755,
    Weekday.saturday: 887766,
    Weekday.sunday: 887777,
  };
}
