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
import '../../widgets/decision_rating_chart.dart';
import '../../widgets/navigation_drawer.dart';

class DecisionDetailsPage extends StatelessWidget {
  final int decisionId;

  const DecisionDetailsPage({Key? key, required this.decisionId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dao = Provider.of<AppDatabase>(context).decisionsDao;
    final strings = S.of(context);
    final textTheme = Theme.of(context).textTheme;
    final locale = Localizations.localeOf(context);
    final a2hText = Provider.of<App2HeavenTextStyle>(context).textStyle;

    return StreamBuilder<Decision>(
      initialData: null,
      stream: dao.getDecisionStream(decisionId),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(),
            bottomNavigationBar: NavigationBottomAppBar(),
            body: Text("Error: ${snapshot.error}"),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting || snapshot.connectionState == ConnectionState.none) {
          return Scaffold(
            appBar: AppBar(),
            bottomNavigationBar: NavigationBottomAppBar(),
            body: Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            ),
          );
        }
        final decision = snapshot.data;

        if (decision == null) {
          return Scaffold(
            appBar: AppBar(),
            bottomNavigationBar: NavigationBottomAppBar(),
          );
        }

        void edit() async {
          final newDecision = await Navigator.pushNamed(context, "/decisions/edit", arguments: decision);
          if (newDecision != null) {
            await dao.updateDecision(decision, newDecision as DecisionsCompanion);
          }
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

        return Scaffold(
          appBar: AppBar(),
          bottomNavigationBar: NavigationBottomAppBar(
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: edit,
                tooltip: strings.edit,
              ),
              IconButton(
                icon: Icon(decision.archived ? Icons.unarchive : Icons.archive),
                onPressed: decision.archived ? unarchive : archive,
                tooltip: decision.archived ? strings.show_in_current : strings.archive,
              ),
              IconButton(
                icon: Icon(Icons.delete_forever),
                onPressed: delete,
                tooltip: strings.delete,
              ),
            ],
          ),
          body: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(bottom: 16),
                  child: Image.asset(
                    "assets/decisions/list.png",
                    height: 64,
                    width: 64,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    decision.title,
                    style: textTheme.headline5,
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: SelectableText(
                      decision.content,
                      style: a2hText,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    locale.mediumDateFormat.format(decision.created),
                    style: textTheme.caption,
                    textAlign: TextAlign.end,
                  ),
                ),
                Expanded(
                  child: DecisionRatingChart(
                    decisionId: decisionId,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
