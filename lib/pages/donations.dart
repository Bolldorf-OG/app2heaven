/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../generated/l10n.dart';
import '../preferences/preferences.dart';
import '../util/constants.dart';
import '../widgets/navigation_drawer.dart';

class DonationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final strings = S.of(context);
    final prefs = Provider.of<AppPreferences>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(strings.donations),
      ),
      bottomNavigationBar: NavigationBottomAppBar(
        actions: <Widget>[
          PopupMenuButton<void Function()>(
            itemBuilder: (context) => [
              PopupMenuItem<void Function()>(
                value: () => prefs.dialogs.askForDonationsDate.clear(),
                child: Text(strings.reset_dialog),
              ),
            ],
            onSelected: (value) => value.call(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: MarkdownBody(
          data: strings.donations_text_markdown("a2h://donate"),
          styleSheet: MarkdownStyleSheet().copyWith(p: Theme.of(context).textTheme.headline6?.copyWith(height: 1.33)),
          onTapLink: (text, href, title) async {
            if (href == "a2h://donate") {
              await FirebaseAnalytics().logEvent(name: AnalyticsConstants.eventDonate);
              await prefs.dialogs.askForDonationsDate.setValue(DateTime.now().add(DonationsConstants.timeoutExtended));
              await launch(DonationsConstants.link, forceSafariVC: false);
            }
          },
        ),
      ),
    );
  }
}
