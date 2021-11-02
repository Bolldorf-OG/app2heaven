/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';

import '../../app2heaven.dart';
import '../../db/database.dart';
import '../../db/decisions.dart';
import '../../generated/l10n.dart';
import '../../util/constants.dart';
import '../../widgets/decision_rating_bar.dart';

class DayReviewDecisions extends StatelessWidget {
  final DateTime date;

  const DayReviewDecisions({Key? key, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dao = Provider.of<AppDatabase>(context).decisionsDao;
    final strings = S.of(context);
    final textTheme = Theme.of(context).textTheme;
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
              strings.daysreview_decisions_head,
              style: textTheme.headline6,
            ),
          ),
          Expanded(
            child: StreamBuilder<List<DecisionWithRating>>(
                initialData: const [],
                stream: dao.getCurrentDecisionsWithRatingsForDateStream(date),
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
                            strings.no_decisions,
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
                          final decisionWithRating = snapshot.data![index];
                          final decision = decisionWithRating.decision;
                          final rating = decisionWithRating.rating;

                          return Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            decision.title,
                                            style: textTheme.headline6,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.read_more),
                                          color: Theme.of(context).primaryColor,
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, "/decisions/details",
                                                arguments: decision.id);
                                          },
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: Text(
                                        decision.content,
                                        maxLines: 5,
                                        style: a2hText,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 32.0, vertical: 8.0),
                                      child: DecisionRatingBar(
                                        ratingLevel: rating?.rating ?? 0,
                                        onRatingChanged: (newRating) async {
                                          await FirebaseAnalytics().logEvent(
                                            name: AnalyticsConstants
                                                .eventRateDecision,
                                          );
                                          await dao.setDecisionRating(
                                              DecisionRatingsCompanion.insert(
                                            date: date,
                                            rating: newRating,
                                            decisionId: decision.id,
                                          ));
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (context, index) =>
                            Divider(color: Colors.grey),
                      );
                  }
                }),
          ),
        ],
      ),
    );
  }
}
