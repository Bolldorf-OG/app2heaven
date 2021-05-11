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

class PrayerTimesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final strings = S.of(context);

    return MenuPage(
      title: strings.prayertimes,
      iconPath: "assets/prayer_times/icon.png",
      children: <MenuCard>[
        MenuCard(
          title: strings.info,
          description: strings.prayer_info_sub,
          iconPath: "assets/prayer_times/info.png",
          routeName: "/prayer-times/info",
        ),
        MenuCard(
          title: strings.planning,
          description: strings.planning_button_sub,
          iconPath: "assets/prayer_times/planning.png",
          routeName: "/prayer-times/planning",
        ),
        MenuCard(
          title: strings.real_prayertimes,
          description: strings.real_prayertimes_sub,
          iconPath: "assets/prayer_times/clock.png",
          routeName: "/prayer-times/pray-now",
        ),
        MenuCard(
          title: strings.stimulus_to_prayer,
          description: strings.stimulus_to_prayer_sub,
          iconPath: "assets/prayer_times/stimulus.png",
          routeName: "/prayer-times/stimuli",
        ),
        MenuCard(
          title: strings.prayer_notes,
          description: strings.prayer_notes_sub,
          iconPath: "assets/prayer_times/notes.png",
          routeName: "/prayer-times/notes",
        ),
      ],
    );
  }
}
