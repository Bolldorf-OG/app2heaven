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

class ExperiencesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final strings = S.of(context);

    return MenuPage(
      title: strings.faithexperiences,
      iconPath: "assets/experiences/icon.png",
      children: <MenuCard>[
        MenuCard(
          title: strings.info,
          description: strings.experiences_info_sub,
          iconPath: "assets/experiences/info.png",
          routeName: "/experiences/info",
        ),
        MenuCard(
          title: strings.experiences,
          description: strings.experiences_sub,
          iconPath: "assets/experiences/my_experiences.png",
          routeName: "/experiences/my_experiences",
        ),
        MenuCard(
          title: strings.communities,
          description: strings.community_experiences_sub,
          iconPath: "assets/experiences/communities.png",
          routeName: "/experiences/communities",
        ),
      ],
    );
  }
}
