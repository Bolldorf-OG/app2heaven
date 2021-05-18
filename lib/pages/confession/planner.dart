/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:provider/provider.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';
import 'package:timezone/timezone.dart';

import '../../app2heaven.dart';
import '../../db/confessions.dart';
import '../../db/database.dart';
import '../../generated/l10n.dart';
import '../../preferences/preferences.dart';
import '../../util/confession_encryption.dart';
import '../../util/constants.dart';
import '../../util/helpers.dart';
import '../../widgets/navigation_drawer.dart';
import '../../widgets/password_dialog.dart';

class ConfessionPlannerPage extends StatelessWidget {
  final _today = DateTime.now().startOfDay;

  DateTime get _tomorrow => _today.add(Duration(days: 1));

  Future<void> _createReminder(BuildContext context) async {
    await FirebaseAnalytics().logEvent(name: AnalyticsConstants.eventConfessionReminder);

    final strings = S.of(context);
    final locale = Localizations.localeOf(context);
    final confessionPrefs = Provider.of<AppPreferences>(context, listen: false).confession;

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

    final date = await showDatePicker(
      context: context,
      initialDate: _tomorrow,
      firstDate: _today,
      lastDate: DateTime(9999),
    );
    if (date == null) {
      return;
    }

    final localTimeZone = await FlutterNativeTimezone.getLocalTimezone();
    final scheduledDate = TZDateTime(getLocation(localTimeZone), date.year, date.month, date.day, 8);

    await notificationsPlugin.zonedSchedule(
      NotificationIds.confession,
      strings.reminder,
      strings.confession_reminder_message_today,
      scheduledDate,
      NotificationChannels.main(strings.confession_reminder_message_today),
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.wallClockTime,
      androidAllowWhileIdle: true,
    );

    await confessionPrefs.reminderDate.setValue(scheduledDate);

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(strings.reminder_created),
        content: Text(strings.reminder_created_confession(
            locale.mediumDateFormat.format(scheduledDate), scheduledDate.timeOfDay.format(context))),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(strings.ok),
          ),
        ],
      ),
    );
  }

  Future<void> _addConfession(BuildContext context, ConfessionsDao dao) async {
    final date = await showDatePicker(
      context: context,
      initialDate: _today,
      firstDate: DateTime(0),
      lastDate: _today,
    );

    if (date == null) {
      return;
    }

    final clearTopics = await showDialog(
      context: context,
      builder: (context) => _ConfessionDialog(),
    );

    if (clearTopics == null) {
      return;
    }

    if (clearTopics) {
      final password = await PasswordDialog.show(
        context,
        hashKey: ConfessionConstants.keyPasswordHash,
        saltKey: ConfessionConstants.keyPasswordSalt,
        onStoreNewPassword: ConfessionIvAndSalt.initialize,
      );

      if (password == null) {
        return;
      }

      await dao.clearConfessionTopics();
    }

    await dao.insertConfession(date);
  }

  @override
  Widget build(BuildContext context) {
    final dao = Provider.of<AppDatabase>(context).confessionsDao;
    final strings = S.of(context);
    final confessionPrefs = Provider.of<AppPreferences>(context).confession;
    final locale = Localizations.localeOf(context);
    final theme = Theme.of(context);
    final a2hText = Provider.of<App2HeavenTextStyle>(context).textStyle;

    return Scaffold(
      appBar: AppBar(
        title: Text(strings.reminder),
      ),
      bottomNavigationBar: NavigationBottomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Image.asset(
                "assets/confession/reminder.png",
                height: 64,
                width: 64,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                strings.plan_next_confession,
                style: theme.textTheme.headline6,
              ),
            ),
            PreferenceBuilder<DateTime>(
              preference: confessionPrefs.reminderDate,
              builder: (context, value) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    value == DateTime(-1)
                        ? Text(strings.no_confession_planned)
                        : Text.rich(
                            TextSpan(
                              text: value.isBefore(_today)
                                  ? strings.confession_planned_on_past + "\n"
                                  : strings.confession_planned_on_future + "\n",
                              style: a2hText,
                              children: [
                                TextSpan(
                                  text: locale.fullDateFormat.format(value),
                                  style: a2hText.copyWith(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                    Row(
                      children: [
                        if (value != DateTime(-1))
                          ElevatedButton.icon(
                            onPressed: () async {
                              final notificationsPlugin = FlutterLocalNotificationsPlugin();
                              final result = await notificationsPlugin
                                  .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
                                  ?.requestPermissions(
                                    sound: true,
                                    alert: true,
                                    badge: true,
                                  );
                              if (result != false) {
                                await notificationsPlugin.cancel(NotificationIds.confession);
                              }

                              await confessionPrefs.reminderDate.clear();
                            },
                            icon: Icon(Icons.delete_outline),
                            label: Text(strings.clear_reminder),
                          ),
                        Spacer(),
                        ElevatedButton.icon(
                          onPressed: () async => await _createReminder(context),
                          icon: Icon(Icons.notifications_active_outlined),
                          label: Text(value.isBefore(_today) ? strings.set_reminder : strings.change_reminder),
                        ),
                      ],
                    )
                  ],
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                strings.past_confessions,
                style: theme.textTheme.headline6,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton.icon(
                onPressed: () async => await _addConfession(context, dao),
                icon: const Icon(Icons.playlist_add),
                label: Text(strings.add_confession),
              ),
            ),
            StreamBuilder<List<Confession>>(
              initialData: null,
              stream: dao.getConfessionsStream(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                }

                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Container(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(),
                    );
                  case ConnectionState.active:
                  case ConnectionState.done:
                    if (snapshot.data!.isEmpty) {
                      return Container(
                        alignment: Alignment.center,
                        child: Text(
                          strings.no_confessions_yet,
                          style: Theme.of(context).textTheme.headline5,
                          textAlign: TextAlign.center,
                        ),
                      );
                    }

                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final confession = snapshot.data![index];

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 4.0),
                          child: Text(locale.fullDateFormat.format(confession.date)),
                        );
                      },
                    );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ConfessionDialog extends StatefulWidget {
  const _ConfessionDialog({
    Key? key,
  }) : super(key: key);

  @override
  __ConfessionDialogState createState() => __ConfessionDialogState();
}

class __ConfessionDialogState extends State<_ConfessionDialog> {
  bool _clearTopics = true;

  @override
  Widget build(BuildContext context) {
    final strings = S.of(context);

    return AlertDialog(
      title: Text(strings.save_confession),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(strings.confession_today_text),
          Row(
            children: [
              Checkbox(
                value: _clearTopics,
                onChanged: (value) => setState(() => _clearTopics = value ?? true),
              ),
              Expanded(
                child: Text(strings.clear_confession_topics),
              ),
            ],
          )
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, null),
          child: Text(strings.cancel),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, _clearTopics),
          child: Text(strings.save),
        ),
      ],
    );
  }
}
