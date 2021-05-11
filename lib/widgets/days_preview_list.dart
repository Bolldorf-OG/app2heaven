/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app2heaven.dart';
import '../util/helpers.dart';

class DayPreviewList<T> extends StatelessWidget {
  final Stream<List<T>> dataStream;
  final DayPreviewListItem Function(T) itemBuilder;
  final String title;
  final String subtitle;
  final String iconPath;
  final String noItemsFound;

  const DayPreviewList({
    Key? key,
    required this.dataStream,
    required this.itemBuilder,
    required this.title,
    required this.subtitle,
    required this.iconPath,
    required this.noItemsFound,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 16),
            child: Image.asset(
              "assets/day_preview.png",
              height: 64,
              width: 64,
            ),
          ),
          Text(
            title,
            style: textTheme.headline6,
          ),
          Text(
            subtitle,
            style: textTheme.subtitle1,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              iconPath,
              height: 24,
              width: 24,
            ),
          ),
          Expanded(
            child: StreamBuilder<List<T>>(
                initialData: const [],
                stream: dataStream,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
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
                            noItemsFound,
                            style: textTheme.headline5,
                            textAlign: TextAlign.center,
                          ),
                        );
                      }

                      return ListView.separated(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) => itemBuilder(snapshot.data![index]),
                        separatorBuilder: (context, index) => Divider(color: Colors.grey),
                      );
                  }
                }),
          ),
        ],
      ),
    );
  }
}

class DayPreviewListItem extends StatelessWidget {
  final String route;
  final int? id;
  final String? title;
  final String? content;
  final DateTime? created;

  const DayPreviewListItem({
    Key? key,
    required this.route,
    required this.id,
    required this.title,
    required this.content,
    required this.created,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final textTheme = Theme.of(context).textTheme;
    final a2hText = Provider.of<App2HeavenTextStyle>(context).textStyle;

    return InkWell(
      onTap: () => Navigator.pushNamed(context, route, arguments: id),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title!,
                  style: textTheme.headline6,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    content!,
                    maxLines: 5,
                    style: a2hText,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  locale.mediumDateFormat.format(created!),
                  style: textTheme.caption,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
