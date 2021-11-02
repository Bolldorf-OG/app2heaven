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

import '../../../app2heaven.dart';
import '../../../generated/l10n.dart';
import '../../../util/helpers.dart';
import '../../../widgets/navigation_drawer.dart';
import 'details.dart';

class CommunityExperiencesPage extends StatelessWidget {
  final String communityId;

  const CommunityExperiencesPage({Key? key, required this.communityId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final strings = S.of(context);
    final textTheme = Theme.of(context).textTheme;
    final locale = Localizations.localeOf(context);
    final a2hText = Provider.of<App2HeavenTextStyle>(context).textStyle;

    return Scaffold(
      appBar: AppBar(
        title: Text(strings.communities),
      ),
      bottomNavigationBar: NavigationBottomAppBar(),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("communities")
            .doc(communityId)
            .collection("experiences")
            .where("active", isEqualTo: true)
            .snapshots(),
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
              if (snapshot.data!.docs.isEmpty) {
                return Container(
                  alignment: Alignment.center,
                  child: Text(
                    strings.no_community_experiences,
                    style: textTheme.headline5,
                    textAlign: TextAlign.center,
                  ),
                );
              }

              final documents =
                  List<QueryDocumentSnapshot>.from(snapshot.data!.docs);
              documents.sort(
                (a, b) => readLocalizedString(a, "title", locale)!
                    .compareTo(readLocalizedString(b, "title", locale)!),
              );

              return ListView.separated(
                scrollDirection: Axis.vertical,
                itemCount: documents.length,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                itemBuilder: (context, index) {
                  final document = documents[index];
                  return ListTile(
                    isThreeLine: true,
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        readLocalizedString(document, "title", locale)!,
                        style: textTheme.headline6,
                      ),
                    ),
                    subtitle: Text(
                      readLocalizedString(document, "text", locale)!
                          .replaceAll("\n", " "),
                      style: a2hText,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    ),
                    onTap: () async {
                      await FirebaseAnalytics().logSelectContent(
                        contentType: "community_experience",
                        itemId: document.reference.path,
                      );
                      await Navigator.pushNamed(
                        context,
                        "/experiences/communities/experiences/details",
                        arguments: CommunityExperienceDetailsPageArgs(
                            communityId, document.id),
                      );
                    },
                  );
                },
                separatorBuilder: (context, index) =>
                    Divider(color: Colors.grey),
              );
          }
        },
      ),
    );
  }
}
