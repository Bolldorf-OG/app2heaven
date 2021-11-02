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

import '../../app2heaven.dart';
import '../../db/database.dart';
import '../../generated/l10n.dart';
import '../../util/helpers.dart';
import '../../util/shared_content.dart';

class ExperienceListItem extends StatelessWidget {
  final Experience experience;

  const ExperienceListItem(this.experience);

  @override
  Widget build(BuildContext context) {
    final dao = Provider.of<AppDatabase>(context).experiencesDao;
    final strings = S.of(context);
    final textTheme = Theme.of(context).textTheme;
    final locale = Localizations.localeOf(context);
    final a2hText = Provider.of<App2HeavenTextStyle>(context).textStyle;

    void edit() async {
      final newExperience = await Navigator.pushReplacementNamed(
          context, "/experiences/edit",
          arguments: experience);
      if (newExperience != null) {
        await dao.updateExperience(
            experience, newExperience as ExperiencesCompanion);
      }
    }

    Future<void> open() async {
      await Navigator.pushNamed(context, "/experiences/details",
          arguments: experience.id);
    }

    void delete() async {
      Navigator.pop(context);
      await dao.deleteExperience(experience);
    }

    void share() async {
      Future<String> _createShareLink() async {
        final data = await SharedContent(experience.title, experience.content)
            .share(SharedContentType.experience);

        await dao.updateExperience(
          experience,
          experience
              .copyWith(
                shareId: data.id,
                shareLink: data.shortLink.toString(),
                editKey: data.editKey,
              )
              .toCompanion(true),
        );

        return data.shortLink.toString();
      }

      final shareLink = experience.shareLink ?? await _createShareLink();
      await Share.share(strings.share_experience(
          experience.title, experience.content, shareLink));
    }

    return InkWell(
      onTap: open,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  experience.title,
                  style: textTheme.headline6,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    experience.content,
                    maxLines: 5,
                    style: a2hText,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  locale.mediumDateFormat.format(experience.created),
                  style: textTheme.caption,
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.remove_red_eye),
                      title: Text(strings.read),
                      onTap: () async {
                        Navigator.pop(context);
                        await open();
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.edit),
                      title: Text(strings.edit),
                      onTap: edit,
                    ),
                    ListTile(
                      leading: Icon(Icons.share),
                      title: Text(strings.share),
                      onTap: share,
                    ),
                    ListTile(
                      leading: Icon(Icons.delete_forever),
                      title: Text(strings.delete),
                      onTap: delete,
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
