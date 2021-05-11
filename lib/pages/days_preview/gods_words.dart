/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../db/database.dart';
import '../../generated/l10n.dart';
import '../../widgets/days_preview_list.dart';

class DayPreviewWords extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dao = Provider.of<AppDatabase>(context).godsWordsDao;
    final strings = S.of(context);

    return DayPreviewList<GodsWord>(
      dataStream: dao.getCurrentGodsWordsStream(),
      title: strings.dayspreview_words_head,
      subtitle: strings.dayspreview_words_sub,
      iconPath: "assets/gods_words/list.png",
      noItemsFound: strings.no_gods_words,
      itemBuilder: (godsWord) => DayPreviewListItem(
        route: "/gods-words/details",
        id: godsWord.id,
        title: godsWord.title,
        content: godsWord.content,
        created: godsWord.created,
      ),
    );
  }
}
