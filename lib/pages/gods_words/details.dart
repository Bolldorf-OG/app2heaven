/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

import '../../app2heaven.dart';
import '../../db/database.dart';
import '../../generated/l10n.dart';
import '../../util/helpers.dart';
import '../../util/shared_content.dart';
import '../../widgets/navigation_drawer.dart';

class GodsWordDetailsPage extends StatelessWidget {
  final int godsWordId;

  const GodsWordDetailsPage({Key? key, required this.godsWordId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dao = Provider.of<AppDatabase>(context).godsWordsDao;
    final strings = S.of(context);
    final textTheme = Theme.of(context).textTheme;
    final locale = Localizations.localeOf(context);
    final a2hText = Provider.of<App2HeavenTextStyle>(context).textStyle;

    return StreamBuilder<GodsWord>(
      initialData: null,
      stream: dao.getGodsWordStream(godsWordId),
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
        final godsWord = snapshot.data;

        if (godsWord == null) {
          return Scaffold(
            appBar: AppBar(),
            bottomNavigationBar: NavigationBottomAppBar(),
          );
        }

        void edit() async {
          final newGodsWord = await Navigator.pushNamed(
              context, "/gods-words/edit",
              arguments: godsWord);
          if (newGodsWord != null) {
            await dao.updateGodsWord(
                godsWord, newGodsWord as GodsWordsCompanion);
          }
        }

        void unarchive() async {
          Navigator.pop(context);
          await dao.updateGodsWord(
              godsWord, godsWord.copyWith(archived: false).toCompanion(false));
        }

        void archive() async {
          Navigator.pop(context);
          await dao.updateGodsWord(
              godsWord, godsWord.copyWith(archived: true).toCompanion(false));
        }

        void delete() async {
          Navigator.pop(context);
          await dao.deleteGodsWord(godsWord);
        }

        void share() async {
          Future<String> _createShareLink() async {
            final data = await SharedContent(godsWord.title, godsWord.content)
                .share(SharedContentType.godsWord);

            await dao.updateGodsWord(
              godsWord,
              godsWord
                  .copyWith(
                    shareId: data.id,
                    shareLink: data.shortLink.toString(),
                    editKey: data.editKey,
                  )
                  .toCompanion(true),
            );

            return data.shortLink.toString();
          }

          final shareLink = godsWord.shareLink ?? await _createShareLink();
          await Share.share(strings.share_gods_word(
              godsWord.title, godsWord.content, shareLink));
        }

        return Scaffold(
          appBar: AppBar(),
          bottomNavigationBar: NavigationBottomAppBar(
            actions: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: edit,
                tooltip: strings.edit,
              ),
              IconButton(
                icon: Icon(godsWord.archived ? Icons.unarchive : Icons.archive),
                onPressed: godsWord.archived ? unarchive : archive,
                tooltip: godsWord.archived
                    ? strings.show_in_current
                    : strings.archive,
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
                    "assets/gods_words/list.png",
                    height: 64,
                    width: 64,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    godsWord.title,
                    style: textTheme.headline5,
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: SelectableText(
                      godsWord.content,
                      style: a2hText,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    locale.mediumDateFormat.format(godsWord.created),
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
