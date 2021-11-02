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

import '../../../app2heaven.dart';
import '../../../db/database.dart';
import '../../../generated/l10n.dart';
import '../../../util/helpers.dart';
import '../../../util/shared_content.dart';
import '../../../widgets/navigation_drawer.dart';

class PrayerNoteDetailsPage extends StatelessWidget {
  final int prayerNoteId;

  const PrayerNoteDetailsPage({Key? key, required this.prayerNoteId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dao = Provider.of<AppDatabase>(context).prayerNotesDao;
    final strings = S.of(context);
    final textTheme = Theme.of(context).textTheme;
    final locale = Localizations.localeOf(context);
    final a2hText = Provider.of<App2HeavenTextStyle>(context).textStyle;

    return StreamBuilder<PrayerNote>(
      initialData: null,
      stream: dao.getPrayerNoteStream(prayerNoteId),
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
        final prayerNote = snapshot.data;

        if (prayerNote == null) {
          return Scaffold(
            appBar: AppBar(),
            bottomNavigationBar: NavigationBottomAppBar(),
          );
        }

        void edit() async {
          final newPrayerNote = await Navigator.pushNamed(
              context, "/prayer-times/notes/edit",
              arguments: prayerNote);
          if (newPrayerNote != null) {
            await dao.updatePrayerNote(
                prayerNote, newPrayerNote as PrayerNotesCompanion);
          }
        }

        void delete() async {
          Navigator.pop(context);
          await dao.deletePrayerNote(prayerNote);
        }

        void share() async {
          Future<String> _createShareLink() async {
            final data =
                await SharedContent(prayerNote.title, prayerNote.content)
                    .share(SharedContentType.prayerNote);

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
          await Share.share(strings.share_prayer_note(
              prayerNote.title, prayerNote.content, shareLink));
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
                    "assets/prayer_times/notes.png",
                    height: 64,
                    width: 64,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    prayerNote.title,
                    style: textTheme.headline5,
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: SelectableText(
                      prayerNote.content,
                      style: a2hText,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    locale.mediumDateFormat.format(prayerNote.created),
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
