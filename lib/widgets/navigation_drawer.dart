/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:flutter/material.dart';

import '../generated/l10n.dart';

class NavigationBottomAppBar extends StatelessWidget {
  final List<Widget>? actions;

  const NavigationBottomAppBar({Key? key, this.actions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var parentTheme = Theme.of(context);
    final theme = parentTheme.copyWith(
      iconTheme: IconThemeData(
        color: parentTheme.primaryColor,
      ),
    );

    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: Theme(
        data: theme,
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                showNavigationDrawer(context);
              },
            ),
            Spacer(),
            ...(actions ?? []),
          ],
        ),
      ),
    );
  }
}

void showNavigationDrawer(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    isDismissible: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    builder: (context) => DraggableScrollableSheet(
      expand: false,
      builder: _drawerContent,
    ),
  );
}

Widget _drawerContent(context, controller) {
  final strings = S.of(context);

  return SingleChildScrollView(
    controller: controller,
    child: Column(
      children: [
        ListTile(
          leading: Image.asset(
            "assets/logo_sun.png",
            width: 32,
            height: 32,
          ),
          title: Text(
            "App2Heaven",
            style: Theme.of(context).textTheme.headline5,
          ),
          trailing: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        Divider(
          indent: 8.0,
          endIndent: 8.0,
        ),
        _MenuEntry(
          title: strings.prayertimes,
          iconPath: "assets/sidemenu/gebetszeiten.png",
          routeName: "/prayer-times",
        ),
        _MenuEntry(
          title: strings.experiences,
          iconPath: "assets/sidemenu/glaubenserfahrungen.png",
          routeName: "/experiences",
        ),
        _MenuEntry(
          title: strings.prayerrequests,
          iconPath: "assets/sidemenu/gebetsanliegen.png",
          routeName: "/prayer-requests",
        ),
        _MenuEntry(
          title: strings.words,
          iconPath: "assets/sidemenu/worte.png",
          routeName: "/gods-words",
        ),
        _MenuEntry(
          title: strings.decisions,
          iconPath: "assets/sidemenu/entscheidungen.png",
          routeName: "/decisions",
        ),
        _MenuEntry(
          title: strings.deeds,
          iconPath: "assets/sidemenu/taten.png",
          routeName: "/deeds",
        ),
        _MenuEntry(
          title: strings.confession,
          iconPath: "assets/sidemenu/beichte.png",
          routeName: "/confession",
        ),
        _MenuEntry(
          title: strings.dayspreview,
          iconPath: "assets/sidemenu/tagesvorschau.png",
          routeName: "/day-preview",
        ),
        _MenuEntry(
          title: strings.daysreview,
          iconPath: "assets/sidemenu/tagesrueckblick.png",
          routeName: "/day-review",
        ),
        _MenuEntry(
          title: strings.introduction,
          iconPath: "assets/sidemenu/introduction.png",
          routeName: "/introduction",
        ),
        _MenuEntry(
          title: strings.dashboard,
          iconPath: "assets/sidemenu/home.png",
          routeName: "/",
        ),
        _MenuEntry(
          title: strings.settings,
          iconPath: "assets/sidemenu/settings.png",
          routeName: "/settings",
        ),
        _MenuEntry(
          title: strings.backup_restore,
          iconPath: "assets/sidemenu/backup.png",
          routeName: "/backup",
        ),
        _MenuEntry(
          title: strings.imprint_title,
          iconPath: "assets/sidemenu/imprint.png",
          routeName: "/imprint",
        ),
      ],
    ),
  );
}

class _MenuEntry extends StatelessWidget {
  final String title;
  final String iconPath;
  final String routeName;

  const _MenuEntry({
    Key? key,
    required this.title,
    required this.iconPath,
    required this.routeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        iconPath,
        height: 48,
        fit: BoxFit.cover,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.subtitle1,
      ),
      contentPadding: EdgeInsets.zero,
      dense: true,
      onTap: () {
        Navigator.pop(context);
        Navigator.popUntil(context, (route) => route.settings.name == '/');
        if (routeName == '/') {
          Navigator.pop(context);
        }
        Navigator.pushNamed(context, routeName);
      },
    );
  }
}
