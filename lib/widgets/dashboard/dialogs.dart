/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../generated/l10n.dart';
import '../../preferences/preferences.dart';
import '../../util/constants.dart';

class DashboardDialogsWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DashboardDialogsWidgetState();
}

class _DashboardDialogsWidgetState extends State<DashboardDialogsWidget> {
  bool askForAnalytics = false;
  bool askForProgrammers = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await showDialogs();
    });
  }

  Future<void> showDialogs() async {
    final strings = S.of(context);
    final prefs = Provider.of<AppPreferences>(context, listen: false);
    final dialogPrefs = prefs.dialogs;

    if (!dialogPrefs.reset2021.getValue()) {
      await dialogPrefs.askForProgrammers.clear();
      await dialogPrefs.reset2021.setValue(true);
    }

    if (dialogPrefs.askForAnalytics.getValue()) {
      final result = await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text(strings.analytics_dialog),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text(strings.send_data),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(strings.later),
            ),
          ],
        ),
      );
      await FirebaseAnalytics().setAnalyticsCollectionEnabled(result);
      await prefs.settings.analyticsEnabled.setValue(result);
      await dialogPrefs.askForAnalytics.setValue(false);
    }

    if (dialogPrefs.askForProgrammers.getValue()) {
      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text(
              strings.programmers_dialog(DialogsConstants.emailProgrammers)),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                Navigator.pop(context);
                await FirebaseAnalytics().logEvent(name: "programmer_dialog");
                await launch("mailto:${DialogsConstants.emailProgrammers}");
              },
              child: Text(strings.send_mail),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(context);
                await FirebaseAnalytics().logEvent(name: "programmer_github");
                await launch("https://github.com/Bolldorf-OG/app2heaven");
              },
              child: Text(strings.view_code),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(strings.later),
            ),
          ],
        ),
      );
      await dialogPrefs.askForProgrammers.setValue(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
