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

class DeedsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final strings = S.of(context);

    return MenuPage(
      title: strings.deeds,
      iconPath: "assets/deeds/icon.png",
      children: <MenuCard>[
        MenuCard(
          title: strings.info,
          description: strings.deeds_info_sub,
          iconPath: "assets/deeds/info.png",
          routeName: "/deeds/info",
        ),
        MenuCard(
          title: strings.current_deeds,
          description: strings.current_deeds_sub,
          iconPath: "assets/deeds/current.png",
          routeName: "/deeds/current",
        ),
        MenuCard(
          title: strings.archive,
          description: strings.deeds_archive_sub,
          iconPath: "assets/deeds/archived.png",
          routeName: "/deeds/archived",
        ),
      ],
    );
  }
}
