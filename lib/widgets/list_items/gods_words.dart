/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

import '../../app2heaven.dart';
import '../../db/database.dart';
import '../../generated/l10n.dart';
import '../../util/helpers.dart';
import '../../util/shared_content.dart';

class GodsWordListItem extends StatelessWidget {
  final GodsWord godsWord;

  const GodsWordListItem(this.godsWord);

  @override
  Widget build(BuildContext context) {
    final dao = Provider.of<AppDatabase>(context).godsWordsDao;
    final strings = S.of(context);
    final textTheme = Theme.of(context).textTheme;
    final locale = Localizations.localeOf(context);
    final a2hText = Provider.of<App2HeavenTextStyle>(context).textStyle;

    void edit() async {
      final newGodsWord = await Navigator.pushReplacementNamed(context, "/gods-words/edit", arguments: godsWord);
      if (newGodsWord != null) {
        await dao.updateGodsWord(godsWord, newGodsWord as GodsWordsCompanion);
      }
    }

    Future<void> open() async {
      await Navigator.pushNamed(context, "/gods-words/details", arguments: godsWord.id);
    }

    void unarchive() async {
      Navigator.pop(context);
      await dao.updateGodsWord(godsWord, godsWord.copyWith(archived: false).toCompanion(false));
    }

    void archive() async {
      Navigator.pop(context);
      await dao.updateGodsWord(godsWord, godsWord.copyWith(archived: true).toCompanion(false));
    }

    void delete() async {
      Navigator.pop(context);
      await dao.deleteGodsWord(godsWord);
    }

    void share() async {
      Future<String> _createShareLink() async {
        final data = await SharedContent(godsWord.title, godsWord.content).share(SharedContentType.godsWord);

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
      await Share.share(strings.share_gods_word(godsWord.title, godsWord.content, shareLink));
    }

    void emphasize() async {
      await dao.updateGodsWord(godsWord, godsWord.copyWith(emphasized: true).toCompanion(false));
    }

    void unemphasize() async {
      await dao.updateGodsWord(godsWord, godsWord.copyWith(emphasized: false).toCompanion(false));
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
                  godsWord.title,
                  style: textTheme.headline6,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    godsWord.content,
                    maxLines: 5,
                    style: a2hText,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  locale.mediumDateFormat.format(godsWord.created),
                  style: textTheme.caption,
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(godsWord.emphasized ? Icons.star : Icons.star_border),
            onPressed: godsWord.emphasized ? unemphasize : emphasize,
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
                      leading: Icon(godsWord.emphasized ? Icons.star : Icons.star_border),
                      title: Text(godsWord.emphasized ? strings.unhighlight : strings.highlight),
                      onTap: () {
                        Navigator.pop(context);
                        if (godsWord.emphasized) {
                          unemphasize();
                        } else {
                          emphasize();
                        }
                      },
                    ),
                    ListTile(
                      leading: Icon(godsWord.archived ? Icons.unarchive : Icons.archive),
                      title: Text(godsWord.archived ? strings.show_in_current : strings.archive),
                      onTap: godsWord.archived ? unarchive : archive,
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
