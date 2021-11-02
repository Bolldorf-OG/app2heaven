/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app2heaven.dart';
import '../../generated/l10n.dart';
import '../../util/helpers.dart';
import '../../widgets/navigation_drawer.dart';

class ConfessionPreparationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final strings = S.of(context);
    final textTheme = Theme.of(context).textTheme;
    final locale = Localizations.localeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(strings.preparation),
      ),
      bottomNavigationBar: NavigationBottomAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 16),
              child: Image.asset(
                "assets/confession/topics.png",
                height: 64,
                width: 64,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                strings.confession_preparation_head,
                style: textTheme.headline5,
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              strings.confession_preparation_paragraph,
              style: textTheme.bodyText1,
              textAlign: TextAlign.justify,
            ),
            StreamBuilder<List<DocumentSnapshot>>(
              stream: FirebaseFirestore.instance
                  .collection("examinations")
                  .where("active", isEqualTo: true)
                  .snapshots()
                  .map((snapshot) {
                final documents = List<DocumentSnapshot>.from(snapshot.docs);
                documents.sort(
                  (a, b) => readLocalizedString(a, "title", locale)!
                      .compareTo(readLocalizedString(b, "title", locale)!),
                );
                return documents;
              }),
              initialData: [],
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Container(
                    child: Text("Error: ${snapshot.error}"),
                  );
                }

                return Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      ...snapshot.data!.map(
                        (document) => _ExaminationCard(
                          title: readLocalizedString(document, "title", locale),
                          text: readLocalizedString(document, "text", locale),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ExaminationCard extends StatelessWidget {
  final String? title;
  final String? text;

  const _ExaminationCard({
    Key? key,
    required this.title,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final a2hText = Provider.of<App2HeavenTextStyle>(context).textStyle;

    var expanded = false;
    return StatefulBuilder(
      builder: (context, setState) => Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(8.0),
          onTap: () => setState(() {
            expanded = !expanded;
          }),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Text(
                  title!,
                  style: textTheme.headline6,
                ),
                expanded
                    ? Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          text!,
                          style: a2hText,
                          textAlign: TextAlign.justify,
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
