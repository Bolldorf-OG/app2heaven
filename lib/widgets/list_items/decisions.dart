/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app2heaven.dart';
import '../../db/database.dart';
import '../../generated/l10n.dart';
import '../../util/helpers.dart';

class DecisionListItem extends StatelessWidget {
  final Decision decision;

  const DecisionListItem(this.decision);

  @override
  Widget build(BuildContext context) {
    final dao = Provider.of<AppDatabase>(context).decisionsDao;
    final strings = S.of(context);
    final textTheme = Theme.of(context).textTheme;
    final locale = Localizations.localeOf(context);
    final a2hText = Provider.of<App2HeavenTextStyle>(context).textStyle;

    void edit() async {
      final newDecision = await Navigator.pushReplacementNamed(context, "/decisions/edit", arguments: decision);
      if (newDecision != null) {
        await dao.updateDecision(decision, newDecision as DecisionsCompanion);
      }
    }

    Future<void> open() async {
      await Navigator.pushNamed(context, "/decisions/details", arguments: decision.id);
    }

    void unarchive() async {
      Navigator.pop(context);
      await dao.updateDecision(decision, decision.copyWith(archived: false).toCompanion(false));
    }

    void archive() async {
      Navigator.pop(context);
      await dao.updateDecision(decision, decision.copyWith(archived: true).toCompanion(false));
    }

    void delete() async {
      Navigator.pop(context);
      await dao.deleteDecision(decision);
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
                  decision.title,
                  style: textTheme.headline6,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    decision.content,
                    maxLines: 5,
                    style: a2hText,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  locale.mediumDateFormat.format(decision.created),
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
                      leading: Icon(decision.archived ? Icons.unarchive : Icons.archive),
                      title: Text(decision.archived ? strings.show_in_current : strings.archive),
                      onTap: decision.archived ? unarchive : archive,
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
