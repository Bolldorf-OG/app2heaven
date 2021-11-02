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
import '../../widgets/navigation_drawer.dart';

class ExperienceDetailsPage extends StatelessWidget {
  final int experienceId;

  const ExperienceDetailsPage({Key? key, required this.experienceId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dao = Provider.of<AppDatabase>(context).experiencesDao;
    final strings = S.of(context);
    final textTheme = Theme.of(context).textTheme;
    final locale = Localizations.localeOf(context);
    final a2hText = Provider.of<App2HeavenTextStyle>(context).textStyle;

    return StreamBuilder<Experience>(
      initialData: null,
      stream: dao.getExperienceStream(experienceId),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(),
            bottomNavigationBar: NavigationBottomAppBar(),
            body: Text("Error: ${snapshot.error}"),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting ||
            snapshot.connectionState == ConnectionState.none) {
          return Scaffold(
            appBar: AppBar(),
            bottomNavigationBar: NavigationBottomAppBar(),
            body: Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            ),
          );
        }
        final experience = snapshot.data;

        if (experience == null) {
          return Scaffold(
            appBar: AppBar(),
            bottomNavigationBar: NavigationBottomAppBar(),
          );
        }

        void edit() async {
          final newExperience = await Navigator.pushNamed(
              context, "/experiences/edit",
              arguments: experience);
          if (newExperience != null) {
            await dao.updateExperience(
                experience, newExperience as ExperiencesCompanion);
          }
        }

        void delete() async {
          Navigator.pop(context);
          await dao.deleteExperience(experience);
        }

        void share() async {
          Future<String> _createShareLink() async {
            final data =
                await SharedContent(experience.title, experience.content)
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

        return Scaffold(
          appBar: AppBar(),
          bottomNavigationBar: NavigationBottomAppBar(
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: edit,
                tooltip: strings.edit,
              ),
              IconButton(
                icon: Icon(Icons.share),
                onPressed: share,
                tooltip: strings.share,
              ),
              IconButton(
                icon: Icon(Icons.delete_forever),
                onPressed: delete,
                tooltip: strings.delete,
              ),
            ],
          ),
          body: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(bottom: 16),
                  child: Image.asset(
                    "assets/experiences/my_experiences.png",
                    height: 64,
                    width: 64,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    experience.title,
                    style: textTheme.headline5,
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: SelectableText(
                      experience.content,
                      style: a2hText,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    locale.mediumDateFormat.format(experience.created),
                    style: textTheme.caption,
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
