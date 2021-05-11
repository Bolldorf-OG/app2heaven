/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../../widgets/menus.dart';
import '../base/menu_page.dart';

class GodsWordsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final strings = S.of(context);

    return MenuPage(
      title: strings.words,
      iconPath: "assets/gods_words/icon.png",
      children: <MenuCard>[
        MenuCard(
          title: strings.info,
          description: strings.words_info_sub,
          iconPath: "assets/gods_words/info.png",
          routeName: "/gods-words/info",
        ),
        MenuCard(
          title: strings.open_bible,
          description: strings.open_bible_sub,
          iconPath: "assets/gods_words/open_bible.png",
          routeName: "/gods-words/bible",
        ),
        MenuCard(
          title: strings.current_words,
          description: strings.current_words_sub,
          iconPath: "assets/gods_words/current.png",
          routeName: "/gods-words/current",
        ),
        MenuCard(
          title: strings.archive,
          description: strings.words_archive_sub,
          iconPath: "assets/gods_words/archived.png",
          routeName: "/gods-words/archived",
        ),
        MenuCard(
          title: strings.reminder,
          description: strings.words_reminder_sub,
          iconPath: "assets/gods_words/reminder.png",
          routeName: "/gods-words/reminders",
        ),
      ],
    );
  }
}
