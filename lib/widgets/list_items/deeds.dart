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

class DeedListItem extends StatelessWidget {
  final Deed deed;

  const DeedListItem(this.deed);

  @override
  Widget build(BuildContext context) {
    final dao = Provider.of<AppDatabase>(context).deedsDao;
    final strings = S.of(context);
    final textTheme = Theme.of(context).textTheme;
    final locale = Localizations.localeOf(context);
    final a2hText = Provider.of<App2HeavenTextStyle>(context).textStyle;

    void edit() async {
      final newDeed = await Navigator.pushReplacementNamed(
          context, "/deeds/edit",
          arguments: deed);
      if (newDeed != null) {
        await dao.updateDeed(deed, newDeed as DeedsCompanion);
      }
    }

    Future<void> open() async {
      await Navigator.pushNamed(context, "/deeds/details", arguments: deed.id);
    }

    void unarchive() async {
      Navigator.pop(context);
      await dao.updateDeed(
          deed, deed.copyWith(archived: false).toCompanion(false));
    }

    void archive() async {
      Navigator.pop(context);
      await dao.updateDeed(
          deed, deed.copyWith(archived: true).toCompanion(false));
    }

    void delete() async {
      Navigator.pop(context);
      await dao.deleteDeed(deed);
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
                  deed.title,
                  style: textTheme.headline6,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    strings.deed_planned_for(
                        locale.shortDateFormat.format(deed.date)),
                    style: textTheme.subtitle2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    deed.content,
                    maxLines: 5,
                    style: a2hText,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  locale.mediumDateFormat.format(deed.created),
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
                      leading:
                          Icon(deed.archived ? Icons.unarchive : Icons.done),
                      title: Text(deed.archived
                          ? strings.show_in_current
                          : strings.done),
                      onTap: deed.archived ? unarchive : archive,
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
