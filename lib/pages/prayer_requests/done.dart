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

import '../../db/database.dart';
import '../../generated/l10n.dart';
import '../../widgets/list_items/prayer_requests.dart';
import '../base/list_page.dart';

class DonePrayerRequestsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dao = Provider.of<AppDatabase>(context).prayerRequestsDao;
    final strings = S.of(context);

    return ListPage<PrayerRequest>(
      title: strings.god_helped,
      dataStream: dao.getDonePrayerRequestsStream(),
      iconPath: "assets/prayer_requests/list.png",
      itemBuilder: (context, prayerRequest) => PrayerRequestListItem(prayerRequest),
      itemTitle: (context, godsWord) => Text(godsWord.title),
      itemSubtitle: (context, godsWord) => Text(
        godsWord.content,
        maxLines: 5,
        overflow: TextOverflow.ellipsis,
      ),
      onDelete: (items) => dao.deletePrayerRequests(items),
      onShare: (items) async {
        final content = items.map((e) => "${e.title}\n${e.content}\n").join("\n");
        await Share.share(content);
      },
      noItemsFound: strings.no_prayer_requests,
    );
  }
}
