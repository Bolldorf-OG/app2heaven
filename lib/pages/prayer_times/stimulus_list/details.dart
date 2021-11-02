/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app2heaven.dart';
import '../../../util/helpers.dart';
import '../../../widgets/navigation_drawer.dart';

class PrayerStimulusDetailsPage extends StatelessWidget {
  final String? stimulusId;

  PrayerStimulusDetailsPage({
    Key? key,
    required this.stimulusId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final textTheme = Theme.of(context).textTheme;
    final a2hText = Provider.of<App2HeavenTextStyle>(context).textStyle;

    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: NavigationBottomAppBar(),
      body: StreamBuilder<DocumentSnapshot>(
        initialData: null,
        stream: FirebaseFirestore.instance
            .collection("stimuli")
            .doc(stimulusId)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            }
          }

          if (snapshot.connectionState == ConnectionState.waiting ||
              snapshot.connectionState == ConnectionState.none) {
            return Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );
          }
          final document = snapshot.data;

          if (document == null || !document.exists) {
            return Container();
          }

          return Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(bottom: 16),
                  child: Image.asset(
                    "assets/prayer_times/stimulus.png",
                    height: 64,
                    width: 64,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    readLocalizedString(document, "title", locale)!,
                    style: textTheme.headline5,
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: SelectableText(
                      readLocalizedString(document, "text", locale)!,
                      style: a2hText,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
