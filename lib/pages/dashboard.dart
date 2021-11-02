/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

import '../db/database.dart';
import '../generated/l10n.dart';
import '../preferences/preferences.dart';
import '../util/helpers.dart';
import '../widgets/dashboard/dashboard_card.dart';
import '../widgets/dashboard/dialogs.dart';
import '../widgets/dashboard/prayer_timer.dart';
import '../widgets/dashboard/preview_card.dart';
import '../widgets/dashboard/preview_list.dart';
import '../widgets/navigation_drawer.dart';
import 'experiences/experiences.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final strings = S.of(context);
    final db = Provider.of<AppDatabase>(context);
    final settings = Provider.of<AppPreferences>(context).settings.dashboard;

    // try to update cache
    FirebaseFirestore.instance
        .collection("communities")
        .get(GetOptions(source: Source.server))
        .catchError((_) {});
    FirebaseFirestore.instance
        .collection("stimulus-tags")
        .get(GetOptions(source: Source.server))
        .catchError((_) {});
    FirebaseFirestore.instance
        .collection("stimuli")
        .get(GetOptions(source: Source.server))
        .catchError((_) {});

    final firebaseMessaging = FirebaseMessaging.instance;
    firebaseMessaging.requestPermission();

    return Scaffold(
      appBar: AppBar(
        title: Text(strings.dashboard),
      ),
      bottomNavigationBar: NavigationBottomAppBar(),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/sky_background.webp"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          DashboardDialogsWidget(),
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                PreferenceBuilder<bool>(
                  preference: settings.audioStimulus,
                  builder: (context, value) => value
                      ? DashboardCard(
                          iconPath: "assets/prayer_times/audio_stimulus.png",
                          title: strings.audio_stimulus,
                          onTap: () {
                            FirebaseAnalytics().logSelectContent(
                              contentType: "dashboard_widget",
                              itemId: "audio_stimulus",
                            );

                            Navigator.pushNamed(context,
                                "/prayer-times/stimuli/audio-stimulus");
                          },
                        )
                      : Container(),
                ),
                PreferenceBuilder<bool>(
                  preference: settings.currentWords,
                  builder: (context, value) => value
                      ? PreviewList(
                          title: strings.current_words,
                          emptyText: strings.no_gods_words,
                          stream: db.godsWordsDao.getCurrentGodsWordsStream(),
                          itemBuilder: (context, dynamic item) => PreviewCard(
                            iconPath: "assets/gods_words/current.png",
                            title: item.title,
                            content: item.content,
                            onTap: () {
                              FirebaseAnalytics().logSelectContent(
                                contentType: "dashboard_widget",
                                itemId: "gods_word",
                              );

                              Navigator.pushNamed(
                                context,
                                "/gods-words/details",
                                arguments: item.id,
                              );
                            },
                          ),
                        )
                      : Container(),
                ),
                PreferenceBuilder<bool>(
                  preference: settings.currentPrayerRequests,
                  builder: (context, value) => value
                      ? PreviewList(
                          title: strings.current_prayerrequests,
                          emptyText: strings.no_prayer_requests,
                          stream: db.prayerRequestsDao
                              .getActivePrayerRequestsStream(),
                          itemBuilder: (context, dynamic item) => PreviewCard(
                            iconPath: "assets/prayer_requests/current.png",
                            title: item.title,
                            content: item.content,
                            onTap: () {
                              FirebaseAnalytics().logSelectContent(
                                contentType: "dashboard_widget",
                                itemId: "prayer_request",
                              );

                              Navigator.pushNamed(
                                context,
                                "/prayer-requests/details",
                                arguments: item.id,
                              );
                            },
                          ),
                        )
                      : Container(),
                ),
                PreferenceBuilder<bool>(
                  preference: settings.prayerTimer,
                  builder: (context, value) => value
                      ? Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: DashboardPrayerTimer(),
                        )
                      : Container(),
                ),
                PreferenceBuilder<bool>(
                  preference: settings.randomBible,
                  builder: (context, value) => value
                      ? Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: DashboardCard(
                            iconPath: "assets/gods_words/open_bible/random.png",
                            title: strings.random_word_of_god,
                            onTap: () {
                              FirebaseAnalytics().logSelectContent(
                                contentType: "dashboard_widget",
                                itemId: "random_word",
                              );

                              Navigator.pushNamed(
                                  context, "/gods-words/bible/random");
                            },
                          ),
                        )
                      : Container(),
                ),
                PreferenceBuilder<bool>(
                  preference: settings.randomExperience,
                  builder: (context, value) => value
                      ? Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: DashboardCard(
                            iconPath: "assets/experiences/random.png",
                            title: strings.random_experience,
                            onTap: () async {
                              await FirebaseAnalytics().logSelectContent(
                                contentType: "dashboard_widget",
                                itemId: "random_experience",
                              );

                              final communitiesSnapshot =
                                  await FirebaseFirestore.instance
                                      .collection("communities")
                                      .where("active", isEqualTo: true)
                                      .where("hasExperiences", isEqualTo: true)
                                      .snapshots()
                                      .first;
                              final community =
                                  communitiesSnapshot.docs.random();
                              if (community == null) {
                                return;
                              }

                              final experiencesSnapshot = await community
                                  .reference
                                  .collection("experiences")
                                  .where("active", isEqualTo: true)
                                  .snapshots()
                                  .first;
                              final experience =
                                  experiencesSnapshot.docs.random();
                              if (experience == null) {
                                return;
                              }

                              await Navigator.pushNamed(
                                context,
                                "/experiences/communities/experiences/details",
                                arguments: CommunityExperienceDetailsPageArgs(
                                  community.id,
                                  experience.id,
                                ),
                              );
                            },
                          ),
                        )
                      : Container(),
                ),
                PreferenceBuilder<bool>(
                  preference: settings.randomStimulus,
                  builder: (context, value) => value
                      ? Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: DashboardCard(
                            iconPath: "assets/prayer_times/random_stimulus.png",
                            title: strings.random_stimulus,
                            onTap: () async {
                              await FirebaseAnalytics().logSelectContent(
                                contentType: "dashboard_widget",
                                itemId: "random_stimulus",
                              );

                              final tagsSnapshot = await FirebaseFirestore
                                  .instance
                                  .collection("stimulus-tags")
                                  .where("active", isEqualTo: true)
                                  .where("isUsed", isEqualTo: true)
                                  .snapshots()
                                  .first;
                              final tag = tagsSnapshot.docs.random();
                              if (tag == null) {
                                return;
                              }

                              final stimuliSnapshot = await FirebaseFirestore
                                  .instance
                                  .collection("stimuli")
                                  .where("active", isEqualTo: true)
                                  .where("tags", arrayContains: tag.reference)
                                  .snapshots()
                                  .first;
                              final stimulus = stimuliSnapshot.docs.random();
                              if (stimulus == null) {
                                return;
                              }

                              await Navigator.pushNamed(
                                context,
                                "/prayer-times/stimuli/details",
                                arguments: stimulus.id,
                              );
                            },
                          ),
                        )
                      : Container(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
