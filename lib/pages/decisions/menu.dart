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

class DecisionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final strings = S.of(context);

    return MenuPage(
      title: strings.decisions,
      iconPath: "assets/decisions/icon.png",
      children: <MenuCard>[
        MenuCard(
          title: strings.info,
          description: strings.decisions_info_sub,
          iconPath: "assets/decisions/info.png",
          routeName: "/decisions/info",
        ),
        MenuCard(
          title: strings.current_decisions,
          description: strings.current_decisions_sub,
          iconPath: "assets/decisions/current.png",
          routeName: "/decisions/current",
        ),
        MenuCard(
          title: strings.archive,
          description: strings.decisions_archive_sub,
          iconPath: "assets/decisions/archived.png",
          routeName: "/decisions/archived",
        ),
      ],
    );
  }
}
