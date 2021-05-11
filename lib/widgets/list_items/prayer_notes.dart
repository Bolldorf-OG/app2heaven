/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

import '../../app2heaven.dart';
import '../../db/database.dart';
import '../../generated/l10n.dart';
import '../../util/helpers.dart';
import '../../util/shared_content.dart';

class PrayerNoteListItem extends StatelessWidget {
  final PrayerNote prayerNote;

  const PrayerNoteListItem(this.prayerNote);

  @override
  Widget build(BuildContext context) {
    final dao = Provider.of<AppDatabase>(context).prayerNotesDao;
    final strings = S.of(context);
    final textTheme = Theme.of(context).textTheme;
    final locale = Localizations.localeOf(context);
    final a2hText = Provider.of<App2HeavenTextStyle>(context).textStyle;

    void edit() async {
      final newPrayerNote =
          await Navigator.pushReplacementNamed(context, "/prayer-times/notes/edit", arguments: prayerNote);
      if (newPrayerNote != null) {
        await dao.updatePrayerNote(prayerNote, newPrayerNote as PrayerNotesCompanion);
      }
    }

    Future<void> open() async {
      await Navigator.pushNamed(context, "/prayer-times/notes/details", arguments: prayerNote.id);
    }

    void delete() async {
      Navigator.pop(context);
      await dao.deletePrayerNote(prayerNote);
    }

    void share() async {
      Future<String> _createShareLink() async {
        final data = await SharedContent(prayerNote.title, prayerNote.content).share(SharedContentType.prayerNote);

        await dao.updatePrayerNote(
          prayerNote,
          prayerNote
              .copyWith(
                shareId: data.id,
                shareLink: data.shortLink.toString(),
                editKey: data.editKey,
              )
              .toCompanion(true),
        );

        return data.shortLink.toString();
      }

      final shareLink = prayerNote.shareLink ?? await _createShareLink();
      await Share.share(strings.share_prayer_note(prayerNote.title, prayerNote.content, shareLink));
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
                  prayerNote.title,
                  style: textTheme.headline6,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    prayerNote.content,
                    maxLines: 5,
                    style: a2hText,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  locale.mediumDateFormat.format(prayerNote.created),
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
