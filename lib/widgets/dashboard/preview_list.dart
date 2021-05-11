/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:flutter/material.dart';

class PreviewList<T> extends StatelessWidget {
  final String title;
  final String emptyText;
  final Stream<List<T>> stream;
  final Widget Function(BuildContext context, T item) itemBuilder;

  const PreviewList({
    Key? key,
    required this.title,
    required this.emptyText,
    required this.stream,
    required this.itemBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            title,
            style: textTheme.headline5!.copyWith(color: Colors.white),
          ),
        ),
        StreamBuilder<List<T>>(
          initialData: [],
          stream: stream,
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
                    child: Text(
                      emptyText,
                      style: textTheme.bodyText1!.copyWith(color: Colors.white),
                    ),
                  );
                }

                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: snapshot.data!
                        .map(
                          (e) => Container(
                            width: 150,
                            child: itemBuilder(context, e),
                          ),
                        )
                        .toList(),
                  ),
                );
            }
          },
        ),
      ],
    );
  }
}
