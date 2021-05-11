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

class DayPreviewDecisions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dao = Provider.of<AppDatabase>(context).decisionsDao;
    final strings = S.of(context);

    return DayPreviewList<Decision>(
      dataStream: dao.getCurrentDecisionsStream(),
      title: strings.dayspreview_decisions_head,
      subtitle: strings.dayspreview_decisions_sub,
      iconPath: "assets/decisions/list.png",
      itemBuilder: (decision) => DayPreviewListItem(
        route: "/decisions/details",
        id: decision.id,
        title: decision.title,
        content: decision.content,
        created: decision.created,
      ),
      noItemsFound: strings.no_decisions,
    );
  }
}
