/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../generated/l10n.dart';
import '../../widgets/navigation_drawer.dart';
import '../../widgets/reminder_buttons.dart';

class GodsWordsRemindersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final strings = S.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(strings.gods_word_reminder),
      ),
      bottomNavigationBar: NavigationBottomAppBar(),
      body: OrientationBuilder(
        builder: (context, orientation) => SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset(
                "assets/gods_words/reminder.png",
                width: 64,
                height: 64,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  strings.words_reminder_head,
                  style: Theme.of(context).textTheme.subtitle1,
                  textAlign: TextAlign.center,
                ),
              ),
              ReminderButtonGrid(
                orientation: orientation,
              )
            ],
          ),
        ),
      ),
    );
  }
}
