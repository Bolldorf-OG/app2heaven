/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

import '../../db/database.dart';
import '../../generated/l10n.dart';
import '../../widgets/list_items/experiences.dart';
import '../base/list_page.dart';

class MyExperiencesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dao = Provider.of<AppDatabase>(context).experiencesDao;
    final strings = S.of(context);

    return ListPage<Experience>(
      title: strings.experiences,
      dataStream: dao.getAllExperiencesStream(),
      iconPath: "assets/experiences/my_experiences.png",
      onAdd: () async {
        final experience = await Navigator.pushNamed(context, "/experiences/edit");
        if (experience != null) {
          await dao.insertExperience(experience as ExperiencesCompanion);
        }
      },
      itemBuilder: (context, experience) => ExperienceListItem(experience),
      itemTitle: (context, godsWord) => Text(godsWord.title),
      itemSubtitle: (context, godsWord) => Text(
        godsWord.content,
        maxLines: 5,
        overflow: TextOverflow.ellipsis,
      ),
      onDelete: (items) => dao.deleteExperiences(items),
      onShare: (items) async {
        final content = items.map((e) => "${e.title}\n${e.content}\n").join("\n");
        await Share.share(content);
      },
      noItemsFound: strings.no_experiences,
    );
  }
}
