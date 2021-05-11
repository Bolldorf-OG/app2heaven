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

import '../../db/database.dart';
import '../../generated/l10n.dart';
import '../../widgets/list_items/gods_words.dart';
import '../base/list_page.dart';

class ArchivedGodsWordsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dao = Provider.of<AppDatabase>(context).godsWordsDao;
    final strings = S.of(context);

    return ListPage<GodsWord>(
      title: strings.archive,
      dataStream: dao.getArchivedGodsWordStream(),
      iconPath: "assets/gods_words/list.png",
      itemBuilder: (context, godsWord) => GodsWordListItem(godsWord),
      itemTitle: (context, godsWord) => Text(godsWord.title),
      itemSubtitle: (context, godsWord) => Text(
        godsWord.content,
        maxLines: 5,
        overflow: TextOverflow.ellipsis,
      ),
      onDelete: (items) => dao.deleteGodsWords(items),
      noItemsFound: strings.no_gods_words,
    );
  }
}
