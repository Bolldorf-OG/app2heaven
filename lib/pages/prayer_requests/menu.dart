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

class PrayerRequestsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final strings = S.of(context);

    return MenuPage(
      title: strings.prayerrequests,
      iconPath: "assets/prayer_requests/icon.png",
      children: <MenuCard>[
        MenuCard(
          title: strings.info,
          description: "",
          iconPath: "assets/prayer_requests/info.png",
          routeName: "/prayer-requests/info",
        ),
        MenuCard(
          title: strings.current_prayerrequests,
          description: "",
          iconPath: "assets/prayer_requests/current.png",
          routeName: "/prayer-requests/current",
        ),
        MenuCard(
          title: strings.god_helped,
          description: "",
          iconPath: "assets/prayer_requests/god_helped.png",
          routeName: "/prayer-requests/god-helped",
        ),
        MenuCard(
          title: strings.monthly_prayerrequest,
          description: "",
          iconPath: "assets/prayer_requests/request_of_month.png",
          routeName: "/prayer-requests/of-month",
        ),
        MenuCard(
          title: strings.former_prayerrequests,
          description: "",
          iconPath: "assets/prayer_requests/archived.png",
          routeName: "/prayer-requests/archived",
        ),
      ],
    );
  }
}
