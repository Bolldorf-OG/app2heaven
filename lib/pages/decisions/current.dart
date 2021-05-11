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
import '../../widgets/list_items/decisions.dart';
import '../base/list_page.dart';

class CurrentDecisionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dao = Provider.of<AppDatabase>(context).decisionsDao;
    final strings = S.of(context);

    return ListPage<Decision>(
      title: strings.current_decisions,
      dataStream: dao.getCurrentDecisionsStream(),
      iconPath: "assets/decisions/list.png",
      onAdd: () async {
        final decision = await Navigator.pushNamed(context, "/decisions/edit");
        if (decision != null) {
          await dao.insertDecision(decision as DecisionsCompanion);
        }
      },
      itemBuilder: (context, decision) => DecisionListItem(decision),
      itemTitle: (context, godsWord) => Text(godsWord.title),
      itemSubtitle: (context, godsWord) => Text(
        godsWord.content,
        maxLines: 5,
        overflow: TextOverflow.ellipsis,
      ),
      onDelete: (items) => dao.deleteDecisions(items),
      noItemsFound: strings.no_decisions,
    );
  }
}
