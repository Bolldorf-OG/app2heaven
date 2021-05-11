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
import 'package:timezone/timezone.dart';

import '../../app2heaven.dart';
import '../../generated/l10n.dart';
import '../../util/helpers.dart';
import '../../widgets/navigation_drawer.dart';

class PrayerRequestOfMonthPage extends StatelessWidget {
  final _currentMonth = () {
    final now = DateTime.now();
    return TZDateTime.from(DateTime.utc(now.year, now.month), UTC).toLocal();
  }();

  @override
  Widget build(BuildContext context) {
    final strings = S.of(context);
    final textTheme = Theme.of(context).textTheme;
    final locale = Localizations.localeOf(context);
    final a2hText = Provider.of<App2HeavenTextStyle>(context).textStyle;

    return Scaffold(
      appBar: AppBar(
        title: Text(strings.monthly_prayerrequest),
      ),
      bottomNavigationBar: NavigationBottomAppBar(),
      body: StreamBuilder<DocumentSnapshot?>(
        initialData: null,
        stream: FirebaseFirestore.instance
            .collection("prayer-requests-otm")
            .where("month", isEqualTo: Timestamp.fromDate(_currentMonth))
            .limit(1)
            .snapshots()
            .map((snapshot) => snapshot.docs.isEmpty ? null : snapshot.docs.first),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          }

          if (snapshot.data == null) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(
                    "assets/prayer_requests/request_of_month.png",
                    height: 64,
                    width: 64,
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(top: 16.0),
                    alignment: Alignment.center,
                    child: Text(
                      strings.no_prayer_request_of_month,
                      style: textTheme.headline6,
                    ),
                  ),
                ),
              ],
            );
          }

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset(
                      "assets/prayer_requests/request_of_month.png",
                      height: 64,
                      width: 64,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      readLocalizedString(snapshot.data!, "title", locale)!,
                      style: textTheme.headline5,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(
                    readLocalizedString(snapshot.data!, "text", locale)!,
                    style: a2hText,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
