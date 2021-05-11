/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';

import '../../app2heaven.dart';
import '../../db/database.dart';
import '../../generated/l10n.dart';
import '../../util/helpers.dart';

class DayReviewDeeds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dao = Provider.of<AppDatabase>(context).deedsDao;
    final strings = S.of(context);
    var theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final locale = Localizations.localeOf(context);
    final a2hText = Provider.of<App2HeavenTextStyle>(context).textStyle;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 16),
            child: Image.asset(
              "assets/day_review.png",
              height: 64,
              width: 64,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Text(
              strings.daysreview_deeds_head,
              style: textTheme.headline6,
            ),
          ),
          Expanded(
            child: StreamBuilder<List<Deed>>(
                initialData: const [],
                stream: dao.getDeedsStreamForDate(DateTime.now().toUtc().startOfDay),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return Text("Error: ${snapshot.error}");
                  }

                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return Container(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(),
                      );
                    case ConnectionState.active:
                    case ConnectionState.done:
                      if (snapshot.data!.isEmpty) {
                        return Container(
                          alignment: Alignment.center,
                          child: Text(
                            strings.no_deeds_today,
                            style: textTheme.headline5,
                            textAlign: TextAlign.center,
                          ),
                        );
                      }

                      return ListView.separated(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final deed = snapshot.data![index];

                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              if (index == 0 && deed.archived)
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: Text(
                                    strings.all_deeds_done_for_today,
                                    style: textTheme.subtitle1,
                                  ),
                                ),
                              if (index == 0 && deed.archived)
                                Text(
                                  strings.already_done,
                                  textAlign: TextAlign.center,
                                  style: textTheme.headline6,
                                ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      deed.title,
                                      style: textTheme.headline6,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.read_more),
                                    color: theme.primaryColor,
                                    onPressed: () {
                                      Navigator.pushNamed(context, "/deeds/details", arguments: deed.id);
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.edit),
                                    color: theme.primaryColor,
                                    onPressed: () async {
                                      final newDeed =
                                          await Navigator.pushNamed(context, "/deeds/edit", arguments: deed);
                                      if (newDeed != null) {
                                        await dao.updateDeed(deed, newDeed as DeedsCompanion);
                                      }
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    color: theme.primaryColor,
                                    onPressed: () async {
                                      await dao.deleteDeed(deed);
                                    },
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  strings.deed_planned_for(locale.shortDateFormat.format(deed.date)),
                                  style: textTheme.subtitle2,
                                ),
                              ),
                              Text(
                                deed.content,
                                maxLines: 5,
                                style: a2hText,
                                overflow: TextOverflow.ellipsis,
                              ),
                              if (!deed.archived)
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton.icon(
                                      label: Text(strings.done),
                                      icon: const Icon(Icons.check),
                                      onPressed: () async {
                                        await dao.updateDeed(deed, deed.copyWith(archived: true).toCompanion(false));
                                      },
                                    )
                                  ],
                                )
                            ],
                          );
                        },
                        separatorBuilder: (context, index) {
                          if (!snapshot.data![index].archived &&
                              index + 1 < snapshot.data!.length &&
                              snapshot.data![index + 1].archived) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 16, bottom: 0),
                                  child: Text(
                                    strings.already_done,
                                    textAlign: TextAlign.center,
                                    style: textTheme.headline6,
                                  ),
                                ),
                              ],
                            );
                          }

                          return Divider(color: Colors.grey);
                        },
                      );
                  }
                }),
          ),
        ],
      ),
    );
  }
}
