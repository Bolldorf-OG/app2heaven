/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

import '../../db/database.dart';
import '../../generated/l10n.dart';
import '../../widgets/list_items/gods_words.dart';
import '../base/list_page.dart';

class CurrentGodsWordsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dao = Provider.of<AppDatabase>(context).godsWordsDao;
    final strings = S.of(context);

    return ListPage<GodsWord>(
      title: strings.current_words,
      dataStream: dao.getCurrentGodsWordsStream(),
      iconPath: "assets/gods_words/list.png",
      onAdd: () async {
        final godsWord = await Navigator.pushNamed(context, "/gods-words/edit");
        if (godsWord != null) {
          await dao.insertGodsWord(godsWord as GodsWordsCompanion);
        }
      },
      itemBuilder: (context, godsWord) => GodsWordListItem(godsWord),
      itemTitle: (context, godsWord) => Text(godsWord.title),
      itemSubtitle: (context, godsWord) => Text(
        godsWord.content,
        maxLines: 5,
        overflow: TextOverflow.ellipsis,
      ),
      onDelete: (items) => dao.deleteGodsWords(items),
      onShare: (items) async {
        final content =
            items.map((e) => "${e.title}\n${e.content}\n").join("\n");
        await Share.share(content);
      },
      noItemsFound: strings.no_gods_words,
    );
  }
}
