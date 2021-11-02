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
import '../../db/database.dart';
import '../../generated/l10n.dart';
import '../../util/helpers.dart';
import '../../widgets/navigation_drawer.dart';

class DeedDetailsPage extends StatelessWidget {
  final int deedId;

  const DeedDetailsPage({Key? key, required this.deedId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dao = Provider.of<AppDatabase>(context).deedsDao;
    final strings = S.of(context);
    final textTheme = Theme.of(context).textTheme;
    final locale = Localizations.localeOf(context);
    final a2hText = Provider.of<App2HeavenTextStyle>(context).textStyle;

    return StreamBuilder<Deed>(
      initialData: null,
      stream: dao.getDeedStream(deedId),
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
        final deed = snapshot.data;

        if (deed == null) {
          return Scaffold(
            appBar: AppBar(),
            bottomNavigationBar: NavigationBottomAppBar(),
          );
        }

        void edit() async {
          final newDeed = await Navigator.pushNamed(context, "/deeds/edit",
              arguments: deed);
          if (newDeed != null) {
            await dao.updateDeed(deed, newDeed as DeedsCompanion);
          }
        }

        void unarchive() async {
          Navigator.pop(context);
          await dao.updateDeed(
              deed, deed.copyWith(archived: false).toCompanion(false));
        }

        void archive() async {
          Navigator.pop(context);
          await dao.updateDeed(
              deed, deed.copyWith(archived: true).toCompanion(false));
        }

        void delete() async {
          Navigator.pop(context);
          await dao.deleteDeed(deed);
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
                icon: Icon(deed.archived ? Icons.unarchive : Icons.done),
                onPressed: deed.archived ? unarchive : archive,
                tooltip: deed.archived ? strings.show_in_current : strings.done,
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
                    "assets/deeds/list.png",
                    height: 64,
                    width: 64,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    deed.title,
                    style: textTheme.headline5,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    locale.fullDateFormat.format(deed.date),
                    style: textTheme.subtitle2,
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: SelectableText(
                      deed.content,
                      style: a2hText,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    locale.mediumDateFormat.format(deed.created),
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
