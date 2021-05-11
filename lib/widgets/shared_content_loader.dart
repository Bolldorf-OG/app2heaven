/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import "package:flutter/cupertino.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:moor/moor.dart";
import "package:provider/provider.dart";

import '../db/database.dart';
import '../db/prayer_requests.dart';
import '../util/shared_content.dart';

class SharedContentLoader extends StatefulWidget {
  final Uri uri;
  final Uint8List encryptionKey;

  SharedContentLoader({Key? key, required this.uri, required this.encryptionKey}) : super(key: key) {
    if (uri.pathSegments[0] != "shared" || uri.pathSegments.length != 2) {
      throw ArgumentError.value(uri, "uri", "path must be /shared/{id}");
    }
  }

  @override
  State<StatefulWidget> createState() => _SharedContentLoaderState();
}

class _SharedContentLoaderState extends State<SharedContentLoader> {
  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    final db = Provider.of<AppDatabase>(context);

    final shareId = widget.uri.pathSegments[1];
    final typeString = widget.uri.queryParameters["t"];
    if (typeString == null) {
      return;
    }
    final type = SharedContentType.of(typeString);

    switch (type) {
      case SharedContentType.prayerNote:
        final localId = await db.prayerNotesDao.getIdForShareId(shareId);
        if (localId != null) {
          await Navigator.pushReplacementNamed(context, "/prayer-times/notes/details", arguments: localId);
          break;
        }

        final sharedContent = await SharedContent.load(widget.uri, widget.encryptionKey);

        final id = await db.prayerNotesDao.insertPrayerNote(PrayerNotesCompanion.insert(
          title: sharedContent.title,
          content: Value(sharedContent.text),
        ));
        await Navigator.pushReplacementNamed(context, "/prayer-times/notes/details", arguments: id);
        break;
      case SharedContentType.prayerRequest:
        final localId = await db.prayerRequestsDao.getIdForShareId(shareId);
        if (localId != null) {
          await Navigator.pushReplacementNamed(context, "/prayer-requests/details", arguments: localId);
          break;
        }

        final sharedContent = await SharedContent.load(widget.uri, widget.encryptionKey);

        final id = await db.prayerRequestsDao.insertPrayerRequest(PrayerRequestsCompanion.insert(
          title: sharedContent.title,
          content: Value(sharedContent.text),
          emphasized: false,
          state: PrayerRequestState.active,
        ));
        await Navigator.pushReplacementNamed(context, "/prayer-requests/details", arguments: id);
        break;
      case SharedContentType.experience:
        final localId = await db.experiencesDao.getIdForShareId(shareId);
        if (localId != null) {
          await Navigator.pushReplacementNamed(context, "/experiences/details", arguments: localId);
          break;
        }

        final sharedContent = await SharedContent.load(widget.uri, widget.encryptionKey);

        final id = await db.experiencesDao.insertExperience(ExperiencesCompanion.insert(
          title: sharedContent.title,
          content: Value(sharedContent.text),
        ));
        await Navigator.pushReplacementNamed(context, "/experiences/details", arguments: id);
        break;
      case SharedContentType.godsWord:
        final localId = await db.godsWordsDao.getIdForShareId(shareId);
        if (localId != null) {
          await Navigator.pushReplacementNamed(context, "/gods-words/details", arguments: localId);
          break;
        }

        final sharedContent = await SharedContent.load(widget.uri, widget.encryptionKey);

        final id = await db.godsWordsDao.insertGodsWord(GodsWordsCompanion.insert(
          title: sharedContent.title,
          content: Value(sharedContent.text),
          emphasized: false,
          archived: false,
        ));
        await Navigator.pushNamed(context, "/gods-words/details", arguments: id);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
