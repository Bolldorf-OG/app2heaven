/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../../widgets/navigation_drawer.dart';
import 'audio_stimulus/audio_stimulus.dart';
import 'stimulus_list/stimulus_list.dart';

class PrayerStimuliPage extends StatelessWidget {
  final openAudioStimulus;

  const PrayerStimuliPage({
    Key? key,
    this.openAudioStimulus = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final strings = S.of(context);

    return DefaultTabController(
      length: 2,
      initialIndex: openAudioStimulus ? 1 : 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text(strings.stimulus_to_prayer),
          bottom: TabBar(
            tabs: <Tab>[
              Tab(text: strings.stimuli_by_category),
              Tab(text: strings.audio_stimulus),
            ],
            onTap: (value) async {
              final tabNames = ["by-tag", "audio-stimulus"];
              try {
                await FirebaseAnalytics().setCurrentScreen(
                    screenName: "/prayer-times/stimuli/${tabNames[value]}");
              } catch (e) {
                // ignored
              }
            },
          ),
        ),
        bottomNavigationBar: NavigationBottomAppBar(),
        body: TabBarView(
          children: <Widget>[
            PrayerStimulusTagsListPage(),
            AudioStimulusPage(),
          ],
        ),
      ),
    );
  }
}
