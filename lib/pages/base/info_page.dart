/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app2heaven.dart';
import '../../generated/l10n.dart';
import '../../widgets/navigation_drawer.dart';

@immutable
class InfoPageSection {
  final String title;
  final String content;

  const InfoPageSection({required this.title, required this.content});
}

class InfoPage extends StatelessWidget {
  final String iconPath;
  final List<InfoPageSection> sections;

  InfoPage({
    Key? key,
    required String iconPath,
    required String title,
    required String content,
  }) : this.sections(
          key: key,
          iconPath: iconPath,
          sections: [
            InfoPageSection(
              title: title,
              content: content,
            ),
          ],
        );

  InfoPage.sections({
    Key? key,
    required this.iconPath,
    required this.sections,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final strings = S.of(context);
    final a2hText = Provider.of<App2HeavenTextStyle>(context).textStyle;

    return Scaffold(
      appBar: AppBar(
        title: Text(strings.info),
      ),
      bottomNavigationBar: NavigationBottomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Image.asset(
                      iconPath,
                      height: 64,
                      width: 64,
                    ),
                    ...sections.expand(
                      (section) => [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Text(
                            section.title,
                            style: textTheme.headline5,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Text(
                          section.content,
                          style: a2hText,
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
