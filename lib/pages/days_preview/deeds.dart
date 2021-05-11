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
import '../../util/helpers.dart';
import '../../widgets/days_preview_list.dart';

class DayPreviewDeeds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dao = Provider.of<AppDatabase>(context).deedsDao;
    final strings = S.of(context);

    return DayPreviewList<Deed>(
      dataStream: dao.getCurrentDeedsStreamForDate(DateTime.now().toUtc().startOfDay),
      title: strings.dayspreview_deeds_head,
      subtitle: strings.dayspreview_deeds_sub,
      iconPath: "assets/deeds/list.png",
      itemBuilder: (deed) => DayPreviewListItem(
        route: "/deeds/details",
        id: deed.id,
        title: deed.title,
        content: deed.content,
        created: deed.created,
      ),
      noItemsFound: strings.no_deeds_today,
    );
  }
}
