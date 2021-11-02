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

class PrayerRequestListItem extends StatelessWidget {
  final PrayerRequest prayerRequest;

  const PrayerRequestListItem(this.prayerRequest);

  @override
  Widget build(BuildContext context) {
    final dao = Provider.of<AppDatabase>(context).prayerRequestsDao;
    final strings = S.of(context);
    final textTheme = Theme.of(context).textTheme;
    final locale = Localizations.localeOf(context);
    final a2hText = Provider.of<App2HeavenTextStyle>(context).textStyle;

    void edit() async {
      final newPrayerRequest = await Navigator.pushReplacementNamed(
          context, "/prayer-requests/edit",
          arguments: prayerRequest);
      if (newPrayerRequest != null) {
        await dao.updatePrayerRequest(
            prayerRequest, newPrayerRequest as PrayerRequestsCompanion);
      }
    }

    Future<void> open() async {
      await Navigator.pushNamed(context, "/prayer-requests/details",
          arguments: prayerRequest.id);
    }

    void unarchive() async {
      Navigator.pop(context);
      await dao.updatePrayerRequest(
          prayerRequest,
          prayerRequest
              .copyWith(state: PrayerRequestState.active)
              .toCompanion(false));
    }

    void archive() async {
      Navigator.pop(context);
      await dao.updatePrayerRequest(
          prayerRequest,
          prayerRequest
              .copyWith(state: PrayerRequestState.archived)
              .toCompanion(false));
    }

    void done() async {
      Navigator.pop(context);
      await dao.updatePrayerRequest(
          prayerRequest,
          prayerRequest
              .copyWith(state: PrayerRequestState.done)
              .toCompanion(false));
    }

    void delete() async {
      Navigator.pop(context);
      await dao.deletePrayerRequest(prayerRequest);
    }

    void share() async {
      Future<String> _createShareLink() async {
        final data =
            await SharedContent(prayerRequest.title, prayerRequest.content)
                .share(SharedContentType.prayerRequest);

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
          ? strings.share_prayer_request_done(
              prayerRequest.title, prayerRequest.content, shareLink)
          : strings.share_prayer_request(
              prayerRequest.title, prayerRequest.content, shareLink));
    }

    void emphasize() async {
      await dao.updatePrayerRequest(prayerRequest,
          prayerRequest.copyWith(emphasized: true).toCompanion(false));
    }

    void unemphasize() async {
      await dao.updatePrayerRequest(prayerRequest,
          prayerRequest.copyWith(emphasized: false).toCompanion(false));
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
                  prayerRequest.title,
                  style: textTheme.headline6,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    prayerRequest.content,
                    maxLines: 5,
                    style: a2hText,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  locale.mediumDateFormat.format(prayerRequest.created),
                  style: textTheme.caption,
                ),
              ],
            ),
          ),
          IconButton(
            icon:
                Icon(prayerRequest.emphasized ? Icons.star : Icons.star_border),
            onPressed: prayerRequest.emphasized ? unemphasize : emphasize,
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
                      leading: Icon(prayerRequest.emphasized
                          ? Icons.star
                          : Icons.star_border),
                      title: Text(prayerRequest.emphasized
                          ? strings.unhighlight
                          : strings.highlight),
                      onTap: () {
                        Navigator.pop(context);
                        if (prayerRequest.emphasized) {
                          unemphasize();
                        } else {
                          emphasize();
                        }
                      },
                    ),
                    () {
                      switch (prayerRequest.state) {
                        case PrayerRequestState.active:
                          return ListTile(
                            leading: Icon(Icons.done),
                            title: Text(strings.prayer_request_done),
                            onTap: done,
                          );
                        case PrayerRequestState.done:
                          return ListTile(
                            leading: Icon(Icons.archive),
                            title: Text(strings.archive),
                            onTap: archive,
                          );
                        case PrayerRequestState.archived:
                          return ListTile(
                            leading: Icon(Icons.unarchive),
                            title: Text(strings.show_in_current),
                            onTap: unarchive,
                          );
                      }
                    }(),
                    () {
                      switch (prayerRequest.state) {
                        case PrayerRequestState.active:
                          return ListTile(
                            leading: Icon(Icons.archive),
                            title: Text(strings.archive),
                            onTap: archive,
                          );
                        case PrayerRequestState.done:
                          return ListTile(
                            leading: Icon(Icons.undo),
                            title: Text(strings.show_in_current),
                            onTap: unarchive,
                          );
                        case PrayerRequestState.archived:
                          return ListTile(
                            leading: Icon(Icons.done),
                            title: Text(strings.prayer_request_done),
                            onTap: done,
                          );
                      }
                    }(),
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
