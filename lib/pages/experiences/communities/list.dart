/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../db/database.dart';
import '../../../generated/l10n.dart';
import '../../../util/helpers.dart';
import '../../../widgets/navigation_drawer.dart';
import 'details.dart';

class CommunitiesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final strings = S.of(context);
    final textTheme = Theme.of(context).textTheme;
    final favoritesDao = Provider.of<AppDatabase>(context).favoritesDao;
    final locale = Localizations.localeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(strings.communities),
      ),
      bottomNavigationBar: NavigationBottomAppBar(),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("communities")
            .where("active", isEqualTo: true)
            .where("hasExperiences", isEqualTo: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          }

          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              );
            case ConnectionState.none:
            case ConnectionState.active:
            case ConnectionState.done:
              if (snapshot.data!.docs.isEmpty) {
                return Container(
                  alignment: Alignment.center,
                  child: Text(
                    strings.no_communities,
                    style: textTheme.headline5,
                    textAlign: TextAlign.center,
                  ),
                );
              }

              final documents = List<DocumentSnapshot>.from(snapshot.data!.docs);

              return StreamBuilder<List<DocumentReference?>>(
                stream: favoritesDao.getFavoritesStream(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  }

                  final favorites = {for (var ref in snapshot.data ?? []) ref.path};

                  documents.sort((a, b) {
                    final favA = favorites.contains(a.reference.path);
                    final favB = favorites.contains(b.reference.path);

                    final comp = (favB ? 1 : 0) - (favA ? 1 : 0);

                    if (comp != 0) {
                      return comp;
                    }

                    return readLocalizedString(a, "name", locale)!.compareTo(readLocalizedString(b, "name", locale)!);
                  });

                  return ListView.separated(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: documents.length,
                    itemBuilder: (context, index) {
                      final document = documents[index];
                      return ListTile(
                        title: Text(
                          readLocalizedString(document, "name", locale)!,
                          style: textTheme.subtitle1,
                        ),
                        dense: true,
                        trailing: StreamBuilder<bool?>(
                          stream: favoritesDao.isFavoriteStream(document.reference),
                          initialData: false,
                          builder: (context, snapshot) {
                            final favorite = snapshot.data ?? false;
                            return IconButton(
                              icon: favorite ? Icon(Icons.star) : Icon(Icons.star_border),
                              onPressed: () async => await favoritesDao.setFavorite(document.reference, !favorite),
                            );
                          },
                        ),
                        onTap: () async {
                          await FirebaseAnalytics().logSelectContent(
                            contentType: "community",
                            itemId: document.reference.path,
                          );

                          final querySnapshot =
                              await document.reference.collection("experiences").where("active", isEqualTo: true).get();

                          if (querySnapshot.size == 1) {
                            await Navigator.pushNamed(
                              context,
                              "/experiences/communities/experiences/details",
                              arguments: CommunityExperienceDetailsPageArgs(document.id, querySnapshot.docs[0].id),
                            );
                          } else {
                            await Navigator.pushNamed(
                              context,
                              "/experiences/communities/experiences",
                              arguments: document.id,
                            );
                          }
                        },
                      );
                    },
                    separatorBuilder: (context, index) => Divider(color: Colors.grey),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
