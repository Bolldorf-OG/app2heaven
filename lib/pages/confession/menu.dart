/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../../util/confession_encryption.dart';
import '../../util/constants.dart';
import '../../widgets/menus.dart';
import '../../widgets/password_dialog.dart';
import '../base/menu_page.dart';

class ConfessionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final strings = S.of(context);

    return MenuPage(
      title: strings.confession,
      iconPath: "assets/confession/icon.png",
      children: <MenuCard>[
        MenuCard(
          title: strings.info,
          description: strings.confession_info_sub,
          iconPath: "assets/confession/info.png",
          routeName: "/confession/info",
        ),
        MenuCard(
          title: strings.topics,
          description: strings.confession_topics_sub,
          iconPath: "assets/confession/topics.png",
          onTap: (context) async {
            final password = await PasswordDialog.show(
              context,
              hashKey: ConfessionConstants.keyPasswordHash,
              saltKey: ConfessionConstants.keyPasswordSalt,
              onStoreNewPassword: ConfessionIvAndSalt.initialize,
            );
            if (password != null) {
              await Navigator.pushNamed(context, "/confession/topics", arguments: password);
            }
          },
        ),
        MenuCard(
          title: strings.preparation,
          description: strings.confession_preparation_sub,
          iconPath: "assets/confession/preparation.png",
          routeName: "/confession/preparation",
        ),
        MenuCard(
          title: strings.confession_planner,
          description: strings.confession_planner_description,
          iconPath: "assets/confession/reminder.png",
          routeName: "/confession/reminder",
        ),
      ],
    );
  }
}
