/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'dart:async';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';
import 'package:timezone/timezone.dart';

import '../../generated/l10n.dart';
import '../../preferences/prayer_times.dart';
import '../../preferences/preferences.dart';
import '../../util/constants.dart';
import '../../util/helpers.dart';
import '../../widgets/navigation_drawer.dart';

class PrayerTimePlanningPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PrayerTimePlanningPageState();
}

class _PrayerTimePlanningPageState extends State<PrayerTimePlanningPage> {
  final Map<Weekday, TextEditingController> _durationControllers =
      Weekday.values.asMap().map((_, day) => MapEntry(day, TextEditingController()));

  List<StreamSubscription<dynamic>>? _streamSubscriptions;

  void _updateNotification(Weekday weekday, PrayerTimesPreferences prefs) async {
    final strings = S.of(context);
    final notificationsPlugin = FlutterLocalNotificationsPlugin();

    final result = await notificationsPlugin
        .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          sound: true,
          alert: true,
          badge: true,
        );
    if (result == false) {
      return;
    }

    final timeOfDay = prefs.plannedTime(weekday).getValue();
    final duration = prefs.plannedDuration(weekday).getValue();

    if (prefs.plannedEnabled(weekday).getValue()) {
      await FirebaseAnalytics().logEvent(
        name: AnalyticsConstants.eventPrayerTimePlanned,
        parameters: {"weekday": weekday.format(Locale("en")), "duration": duration.inMinutes},
      );

      final localTimeZone = await FlutterNativeTimezone.getLocalTimezone();
      final now = TZDateTime.now(getLocation(localTimeZone));
      var scheduledDate = TZDateTime(now.location, now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
      while (scheduledDate.getWeekday() != weekday) {
        scheduledDate = scheduledDate.add(Duration(days: 1));
      }
      scheduledDate = TZDateTime(
        scheduledDate.location,
        scheduledDate.year,
        scheduledDate.month,
        scheduledDate.day,
        timeOfDay.hour,
        timeOfDay.minute,
      ).subtract(Duration(minutes: 10));
      if (scheduledDate.isBefore(now)) {
        scheduledDate = scheduledDate.add(Duration(days: 7));
      }

      await notificationsPlugin.zonedSchedule(
        NotificationIds.prayerTimes[weekday]!,
        strings.prayer_time,
        strings.prayertime_reminder(timeOfDay.format(context), duration.formatHoursMinutes(context)),
        scheduledDate,
        NotificationChannels.main(
            strings.prayertime_reminder(timeOfDay.format(context), duration.formatHoursMinutes(context))),
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.wallClockTime,
        androidAllowWhileIdle: true,
        matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
      );
    } else {
      await notificationsPlugin.cancel(NotificationIds.prayerTimes[weekday]!);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final prefs = Provider.of<AppPreferences>(context).prayerTimes;
    _streamSubscriptions?.forEach((element) {
      element.cancel();
    });
    _streamSubscriptions = <StreamSubscription<dynamic>>[
          for (final day in Weekday.values)
            prefs.plannedEnabled(day).listen((value) {
              _updateNotification(day, prefs);
            })
        ] +
        [
          for (final day in Weekday.values)
            prefs.plannedTime(day).listen((value) {
              _updateNotification(day, prefs);
            })
        ] +
        [
          for (final day in Weekday.values)
            prefs.plannedDuration(day).listen((value) {
              _durationControllers[day]!.text = value.formatHoursMinutes(context);
              _updateNotification(day, prefs);
            })
        ];
  }

  @override
  void dispose() {
    _streamSubscriptions?.forEach((element) {
      element.cancel();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const days = Weekday.values;

    final strings = S.of(context);
    final textTheme = Theme.of(context).textTheme;
    final prefs = Provider.of<AppPreferences>(context).prayerTimes;

    return Scaffold(
      appBar: AppBar(
        title: Text(strings.planning),
      ),
      bottomNavigationBar: NavigationBottomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: PreferenceBuilder<bool>(
            preference: prefs.everydayEnabled,
            builder: (context, everydayEnabled) => Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(bottom: 16),
                  child: Image.asset(
                    "assets/prayer_times/planning.png",
                    height: 64,
                    width: 64,
                  ),
                ),
                Text(
                  strings.planning_head,
                  style: textTheme.bodyText1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    strings.planning_sub,
                    style: textTheme.bodyText1,
                  ),
                ),
                _everydayRow(everydayEnabled, prefs.everydayEnabled.setValue),
                if (!everydayEnabled) ...days.map((weekday) => _plannedRow(weekday)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<Duration?> _showCustomDurationDialog() async {
    final strings = S.of(context);

    final durationController = TextEditingController();

    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          decoration: InputDecoration(
            hintText: strings.minutes,
          ),
          controller: durationController,
          keyboardType: TextInputType.number,
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              final minutes = int.tryParse(durationController.text);
              Navigator.pop(
                context,
                minutes == null ? null : Duration(minutes: minutes),
              );
            },
            child: Text(strings.ok),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(strings.cancel),
          )
        ],
      ),
    );
  }

  Widget _everydayRow(bool everydayEnabled, Function(bool) setValue) {
    final strings = S.of(context);
    final textTheme = Theme.of(context).textTheme;

    final prefs = Provider.of<AppPreferences>(context).prayerTimes;
    final locale = Localizations.localeOf(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        children: [
          Row(
            children: [
              Switch(
                value: everydayEnabled,
                onChanged: setValue,
              ),
              Expanded(
                flex: 1,
                child: Text(
                  strings.same_time_every_day,
                  style: textTheme.subtitle1,
                ),
              ),
            ],
          ),
          if (everydayEnabled)
            PreferenceBuilder<bool>(
              preference: prefs.plannedEnabled(Weekday.monday),
              builder: (context, enabled) => Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Switch(
                    value: enabled,
                    onChanged: (value) async {
                      for (final weekday in Weekday.values) {
                        await prefs.plannedEnabled(weekday).setValue(value);
                      }
                    },
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: PreferenceBuilder<TimeOfDay>(
                        preference: prefs.plannedTime(Weekday.monday),
                        builder: (context, timeOfDay) => DateTimeField(
                          controller: TextEditingController(
                              text: DateFormat(DateFormat.HOUR_MINUTE, locale.toLanguageTag())
                                  .format(DateTimeField.convert(timeOfDay)!)),
                          format: DateFormat(DateFormat.HOUR_MINUTE, locale.toLanguageTag()),
                          onShowPicker: (context, currentValue) async {
                            final time = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.fromDateTime(currentValue!),
                            );
                            return time == null ? null : DateTimeField.convert(time);
                          },
                          resetIcon: null,
                          onChanged: (value) async {
                            for (final weekday in Weekday.values) {
                              await prefs.plannedTime(weekday).setValue(TimeOfDay.fromDateTime(value!));
                            }
                          },
                          decoration: InputDecoration(border: OutlineInputBorder()),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: TextField(
                      controller: _durationControllers[Weekday.monday],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      autofocus: false,
                      readOnly: true,
                      enableInteractiveSelection: false,
                      onTap: () async {
                        final duration = await showDialog(
                          context: context,
                          builder: (context) => SimpleDialog(
                            children: [
                                  for (final duration in PrayerTimesConstants.plannedDurations)
                                    SimpleDialogOption(
                                      onPressed: () => Navigator.pop(context, duration),
                                      child: Text(
                                        duration.formatHoursMinutes(context),
                                        style: textTheme.subtitle1,
                                      ),
                                    ),
                                ] +
                                [
                                  SimpleDialogOption(
                                    onPressed: () async => Navigator.pop(context, await _showCustomDurationDialog()),
                                    child: Text(
                                      strings.custom,
                                      style: textTheme.subtitle1,
                                    ),
                                  ),
                                ],
                          ),
                        );

                        if (duration != null) {
                          for (final weekday in Weekday.values) {
                            await prefs.plannedDuration(weekday).setValue(duration);
                          }
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _plannedRow(Weekday weekday) {
    final strings = S.of(context);
    final textTheme = Theme.of(context).textTheme;

    final prefs = Provider.of<AppPreferences>(context).prayerTimes;
    final locale = Localizations.localeOf(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: PreferenceBuilder<bool>(
        preference: prefs.plannedEnabled(weekday),
        builder: (context, enabled) => Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Switch(
              value: enabled,
              onChanged: prefs.plannedEnabled(weekday).setValue,
            ),
            Expanded(
              flex: 1,
              child: Text(
                weekday.format(locale),
                style: textTheme.subtitle1,
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: PreferenceBuilder<TimeOfDay>(
                  preference: prefs.plannedTime(weekday),
                  builder: (context, timeOfDay) => DateTimeField(
                    enabled: enabled,
                    controller: TextEditingController(
                        text: DateFormat(DateFormat.HOUR_MINUTE, locale.toLanguageTag())
                            .format(DateTimeField.convert(timeOfDay)!)),
                    format: DateFormat(DateFormat.HOUR_MINUTE, locale.toLanguageTag()),
                    onShowPicker: (context, currentValue) async {
                      final time = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.fromDateTime(currentValue!),
                      );
                      return time == null ? null : DateTimeField.convert(time);
                    },
                    resetIcon: null,
                    onChanged: (value) => prefs.plannedTime(weekday).setValue(TimeOfDay.fromDateTime(value!)),
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: TextField(
                enabled: enabled,
                controller: _durationControllers[weekday],
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                autofocus: false,
                readOnly: true,
                enableInteractiveSelection: false,
                onTap: () async {
                  final duration = await showDialog(
                    context: context,
                    builder: (context) => SimpleDialog(
                      children: [
                            for (final duration in PrayerTimesConstants.plannedDurations)
                              SimpleDialogOption(
                                onPressed: () => Navigator.pop(context, duration),
                                child: Text(
                                  duration.formatHoursMinutes(context),
                                  style: textTheme.subtitle1,
                                ),
                              ),
                          ] +
                          [
                            SimpleDialogOption(
                              onPressed: () async => Navigator.pop(context, await _showCustomDurationDialog()),
                              child: Text(
                                strings.custom,
                                style: textTheme.subtitle1,
                              ),
                            ),
                          ],
                    ),
                  );

                  if (duration != null) {
                    await prefs.plannedDuration(weekday).setValue(duration);
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
