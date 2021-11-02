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

import '../../../db/database.dart';
import '../../../generated/l10n.dart';
import '../../../widgets/list_items/prayer_notes.dart';
import '../../base/list_page.dart';

class PrayerNotesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dao = Provider.of<AppDatabase>(context).prayerNotesDao;
    final strings = S.of(context);

    return ListPage<PrayerNote>(
      title: strings.prayer_notes,
      dataStream: dao.getAllPrayerNotesStream(),
      iconPath: "assets/prayer_times/notes.png",
      onAdd: () async {
        final prayerNote =
            await Navigator.pushNamed(context, "/prayer-times/notes/edit");
        if (prayerNote != null) {
          await dao.insertPrayerNote(prayerNote as PrayerNotesCompanion);
        }
      },
      itemBuilder: (context, prayerNote) => PrayerNoteListItem(prayerNote),
      itemTitle: (context, godsWord) => Text(godsWord.title),
      itemSubtitle: (context, godsWord) => Text(
        godsWord.content,
        maxLines: 5,
        overflow: TextOverflow.ellipsis,
      ),
      onDelete: (items) => dao.deletePrayerNotes(items),
      onShare: (items) async {
        final content =
            items.map((e) => "${e.title}\n${e.content}\n").join("\n");
        await Share.share(content);
      },
      noItemsFound: strings.no_prayer_notes,
    );
  }
}
