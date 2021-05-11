/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app2heaven.dart';
import '../generated/l10n.dart';
import '../widgets/navigation_drawer.dart';

class IntroductionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final strings = S.of(context);
    final a2hText = Provider.of<App2HeavenTextStyle>(context).textStyle;

    void resetDemo() {
      FeatureDiscovery.clearPreferences(
        context,
        <String>{
          "share_many",
          "delete_many",
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(strings.introduction),
      ),
      bottomNavigationBar: NavigationBottomAppBar(
        actions: <Widget>[
          PopupMenuButton<void Function()>(
            itemBuilder: (context) => [
              PopupMenuItem<void Function()>(
                value: resetDemo,
                child: Text(strings.reset_demo),
              ),
            ],
            onSelected: (value) => value.call(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset(
              "assets/logo_sun.png",
              width: 96,
              height: 96,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                strings.introduction_to_the_app,
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              strings.introduction_text,
              style: a2hText,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
