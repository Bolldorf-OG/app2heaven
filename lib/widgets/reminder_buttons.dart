/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:provider/provider.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';
import 'package:timezone/timezone.dart';

import '../app2heaven.dart';
import '../db/database.dart';
import '../generated/l10n.dart';
import '../preferences/preferences.dart';
import '../util/constants.dart';
import '../util/helpers.dart';

class ReminderButtonGrid extends StatefulWidget {
  final Orientation? orientation;

  const ReminderButtonGrid({Key? key, this.orientation}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ReminderButtonGridState();
}

class _ReminderButtonGridState extends State<ReminderButtonGrid> {
  List<GodsWord> _godsWords = [];
  StreamSubscription<List<GodsWord>>? _daoSubscription;

  void _askEnableReminder({
    required BuildContext context,
    required TimeOfDay? initialTime,
    required FutureOr<void> Function(GodsWord godsWord, TimeOfDay time) enable,
  }) async {
    if (_godsWords.isEmpty == true) {
      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text(S.of(context).words_reminder_no_current_words),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(S.of(context).ok),
            )
          ],
        ),
      );
      return;
    }

    final godsWord = await showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        children: _godsWords
            .map(
              (word) => SimpleDialogOption(
                onPressed: () => Navigator.pop(context, word),
                child: Text(
                  word.title,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
            )
            .toList(growable: false),
      ),
    );
    if (godsWord != null) {
      final time = await showTimePicker(
        context: context,
        initialTime: initialTime!,
      );

      if (time != null) {
        enable(godsWord, time);
      }
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _daoSubscription?.cancel();

    final dao = Provider.of<AppDatabase>(context).godsWordsDao;
    _daoSubscription = dao.getCurrentGodsWordsStream().listen((event) {
      _godsWords = event;
    });
  }

  @override
  void dispose() {
    _daoSubscription?.cancel();
    super.dispose();
  }

  Widget _reminderButton(GodsWordsReminderType type, BuildContext context) {
    final strings = S.of(context);
    final prefs = Provider.of<AppPreferences>(context).godsWords;
    final a2hText = Provider.of<App2HeavenTextStyle>(context).textStyle;

    final notificationPlugin = FlutterLocalNotificationsPlugin();
    final notificationId = GodsWordsConstants.reminderNotificationId(type);

    return PreferenceBuilder<bool>(
      preference: prefs.reminderEnabled(type),
      builder: (context, enabled) => Column(
        children: <Widget>[
          _ReminderButton(
              type: type,
              enabled: enabled,
              onTap: () async {
                final result = await notificationPlugin
                    .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
                    ?.requestPermissions(
                      sound: true,
                      alert: true,
                      badge: true,
                    );
                if (result == false) {
                  return;
                }

                if (enabled) {
                  await prefs.reminderEnabled(type).setValue(false);
                  await notificationPlugin.cancel(notificationId);
                } else {
                  _askEnableReminder(
                    context: context,
                    initialTime: GodsWordsConstants.reminderDefaultTime(type),
                    enable: (godsWord, time) async {
                      await FirebaseAnalytics().logEvent(
                        name: AnalyticsConstants.eventGodsWordsReminder,
                        parameters: {
                          "type": type.index,
                          "hour": time.hour,
                        },
                      );

                      await prefs.reminderEnabled(type).setValue(true);
                      await prefs.reminderTime(type).setValue(time);
                      await prefs.reminderTitle(type).setValue(godsWord.title);

                      final localTimeZone = await FlutterNativeTimezone.getLocalTimezone();
                      final now = TZDateTime.now(getLocation(localTimeZone));
                      var scheduledDate =
                          TZDateTime(now.location, now.year, now.month, now.day, time.hour, time.minute);
                      if (scheduledDate.isBefore(now)) {
                        scheduledDate = scheduledDate.add(Duration(days: 1));
                      }

                      await notificationPlugin.zonedSchedule(
                        notificationId,
                        strings.gods_word_reminder,
                        strings.word_reminder(godsWord.title, godsWord.content),
                        scheduledDate,
                        NotificationChannels.main(strings.word_reminder(godsWord.title, godsWord.content)),
                        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.wallClockTime,
                        androidAllowWhileIdle: true,
                        matchDateTimeComponents: DateTimeComponents.time,
                      );
                    },
                  );
                }
              }),
          Container(
            child: enabled
                ? PreferenceBuilder<String>(
                    preference: prefs.reminderTitle(type),
                    builder: (context, title) => PreferenceBuilder<TimeOfDay>(
                      preference: prefs.reminderTime(type),
                      builder: (context, time) => Text(
                        strings.words_reminder_enabled(
                          title.ellipsize(20),
                          time.format(context),
                        ),
                        style: a2hText,
                      ),
                    ),
                  )
                : null,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.orientation == Orientation.landscape ? _landscapeLayout(context) : _portraitLayout(context);
  }

  Widget _portraitLayout(BuildContext context) {
    return Table(
      children: [
        TableRow(
          children: [
            TableCell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: _reminderButton(GodsWordsReminderType.morning, context),
              ),
            ),
            TableCell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: _reminderButton(GodsWordsReminderType.noon, context),
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: _reminderButton(GodsWordsReminderType.afternoon, context),
              ),
            ),
            TableCell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: _reminderButton(GodsWordsReminderType.evening, context),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _landscapeLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: _reminderButton(GodsWordsReminderType.morning, context),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: _reminderButton(GodsWordsReminderType.noon, context),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: _reminderButton(GodsWordsReminderType.afternoon, context),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: _reminderButton(GodsWordsReminderType.evening, context),
          ),
        ),
      ],
    );
  }
}

class _ReminderButton extends StatelessWidget {
  final GodsWordsReminderType type;
  final bool? enabled;
  final void Function()? onTap;

  const _ReminderButton({Key? key, required this.type, this.enabled, this.onTap}) : super(key: key);

  String _enabledIconForType(GodsWordsReminderType type) {
    switch (type) {
      case GodsWordsReminderType.morning:
        return "assets/gods_words/reminders/morning.png";
      case GodsWordsReminderType.noon:
        return "assets/gods_words/reminders/noon.png";
      case GodsWordsReminderType.afternoon:
        return "assets/gods_words/reminders/afternoon.png";
      case GodsWordsReminderType.evening:
        return "assets/gods_words/reminders/evening.png";
    }
  }

  String _disabledIconForType(GodsWordsReminderType type) {
    switch (type) {
      case GodsWordsReminderType.morning:
        return "assets/gods_words/reminders/morning_disabled.png";
      case GodsWordsReminderType.noon:
        return "assets/gods_words/reminders/noon_disabled.png";
      case GodsWordsReminderType.afternoon:
        return "assets/gods_words/reminders/afternoon_disabled.png";
      case GodsWordsReminderType.evening:
        return "assets/gods_words/reminders/evening_disabled.png";
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: CircleBorder(),
      onTap: onTap,
      child: enabled! ? Image.asset(_enabledIconForType(type)) : Image.asset(_disabledIconForType(type)),
    );
  }
}
