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

import '../../app2heaven.dart';
import '../../db/database.dart';
import '../../db/prayer_requests.dart';
import '../../generated/l10n.dart';
import '../../util/helpers.dart';
import '../../util/shared_content.dart';
import '../../widgets/navigation_drawer.dart';

class PrayerRequestDetailsPage extends StatelessWidget {
  final int prayerRequestId;

  const PrayerRequestDetailsPage({Key? key, required this.prayerRequestId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dao = Provider.of<AppDatabase>(context).prayerRequestsDao;
    final strings = S.of(context);
    final textTheme = Theme.of(context).textTheme;
    final locale = Localizations.localeOf(context);
    final a2hText = Provider.of<App2HeavenTextStyle>(context).textStyle;

    return StreamBuilder<PrayerRequest>(
      initialData: null,
      stream: dao.getPrayerRequestStream(prayerRequestId),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(),
            bottomNavigationBar: NavigationBottomAppBar(),
            body: Text("Error: ${snapshot.error}"),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting || snapshot.connectionState == ConnectionState.none) {
          return Scaffold(
            appBar: AppBar(),
            bottomNavigationBar: NavigationBottomAppBar(),
            body: Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            ),
          );
        }
        final prayerRequest = snapshot.data;

        if (prayerRequest == null) {
          return Scaffold(
            appBar: AppBar(),
            bottomNavigationBar: NavigationBottomAppBar(),
          );
        }

        void edit() async {
          final newPrayerRequest =
              await Navigator.pushNamed(context, "/prayer-requests/edit", arguments: prayerRequest);
          if (newPrayerRequest != null) {
            await dao.updatePrayerRequest(prayerRequest, newPrayerRequest as PrayerRequestsCompanion);
          }
        }

        void unarchive() async {
          Navigator.pop(context);
          await dao.updatePrayerRequest(
              prayerRequest, prayerRequest.copyWith(state: PrayerRequestState.active).toCompanion(false));
        }

        void archive() async {
          Navigator.pop(context);
          await dao.updatePrayerRequest(
              prayerRequest, prayerRequest.copyWith(state: PrayerRequestState.archived).toCompanion(false));
        }

        void done() async {
          Navigator.pop(context);
          await dao.updatePrayerRequest(
              prayerRequest, prayerRequest.copyWith(state: PrayerRequestState.done).toCompanion(false));
        }

        void delete() async {
          Navigator.pop(context);
          await dao.deletePrayerRequest(prayerRequest);
        }

        void share() async {
          Future<String> _createShareLink() async {
            final data =
                await SharedContent(prayerRequest.title, prayerRequest.content).share(SharedContentType.prayerRequest);

            await dao.updatePrayerRequest(
              prayerRequest,
              prayerRequest
                  .copyWith(
                    shareId: data.id,
                    shareLink: data.shortLink.toString(),
                    editKey: data.editKey,
                  )
                  .toCompanion(true),
            );

            return data.shortLink.toString();
          }

          final shareLink = prayerRequest.shareLink ?? await _createShareLink();
          await Share.share(prayerRequest.state == PrayerRequestState.done
              ? strings.share_prayer_request_done(prayerRequest.title, prayerRequest.content, shareLink)
              : strings.share_prayer_request(prayerRequest.title, prayerRequest.content, shareLink));
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
              () {
                switch (prayerRequest.state) {
                  case PrayerRequestState.active:
                    return IconButton(
                      icon: Icon(Icons.done),
                      tooltip: strings.prayer_request_done,
                      onPressed: done,
                    );
                  case PrayerRequestState.done:
                    return IconButton(
                      icon: Icon(Icons.archive),
                      tooltip: strings.archive,
                      onPressed: archive,
                    );
                  case PrayerRequestState.archived:
                    return IconButton(
                      icon: Icon(Icons.unarchive),
                      tooltip: strings.show_in_current,
                      onPressed: unarchive,
                    );
                }
              }(),
              () {
                switch (prayerRequest.state) {
                  case PrayerRequestState.active:
                    return IconButton(
                      icon: Icon(Icons.archive),
                      tooltip: strings.archive,
                      onPressed: archive,
                    );
                  case PrayerRequestState.done:
                    return IconButton(
                      icon: Icon(Icons.undo),
                      tooltip: strings.show_in_current,
                      onPressed: unarchive,
                    );
                  case PrayerRequestState.archived:
                    return IconButton(
                      icon: Icon(Icons.done),
                      tooltip: strings.prayer_request_done,
                      onPressed: done,
                    );
                }
              }(),
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
                    "assets/prayer_requests/list.png",
                    height: 64,
                    width: 64,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    prayerRequest.title,
                    style: textTheme.headline5,
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: SelectableText(
                      prayerRequest.content,
                      style: a2hText,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    locale.mediumDateFormat.format(prayerRequest.created),
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
