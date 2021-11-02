/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:selectable_autolink_text/selectable_autolink_text.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../app2heaven.dart';
import '../../../generated/l10n.dart';
import '../../../util/helpers.dart';
import 'player.dart';
import 'sound_cloud.dart';

class AudioStimulusPage extends StatelessWidget {
  final _today = DateTime.now().startOfDay;

  @override
  Widget build(BuildContext context) {
    final strings = S.of(context);
    final textTheme = Theme.of(context).textTheme;
    final locale = Localizations.localeOf(context);
    final a2hText = Provider.of<App2HeavenTextStyle>(context).textStyle;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Image.asset("assets/prayer_times/audio_stimulus_logo.png"),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              strings.stimulus_head(locale.shortDateFormat.format(_today)),
              style: textTheme.headline4,
            ),
          ),
          Text(
            strings.stimulus_intro,
            style: textTheme.subtitle1,
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: _MorningPrayer(),
          ),
          StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection("audio-stimuli")
                .doc(DateFormat("yyyy-MM-dd").format(_today))
                .snapshots(),
            initialData: null,
            builder: (context, snapshot) {
              if (snapshot.data == null || !snapshot.data!.exists) {
                return Container(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: Text(
                    strings.no_stimulus_of_day,
                    style: textTheme.headline6,
                    textAlign: TextAlign.center,
                  ),
                );
              }

              String? audioUrl = snapshot.data!.get("audioUrl");
              var audioUri = audioUrl == null ? null : Uri.parse(audioUrl);

              var useSoundcloud = audioUrl == null;
              var loading = !useSoundcloud;

              return StatefulBuilder(
                builder: (context, setState) {
                  if (audioUri != null && loading) {
                    http.head(audioUri).then((response) {
                      setState(() {
                        loading = false;
                        useSoundcloud = response.statusCode != HttpStatus.ok;
                      });
                    }).catchError((e, stack) {
                      FirebaseCrashlytics.instance.recordError(e, stack);
                      loading = false;
                      useSoundcloud = true;
                    });
                  }

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SelectableAutoLinkText(
                        readLocalizedString(snapshot.data!, "text", locale)!,
                        style: textTheme.bodyText1,
                        linkStyle: TextStyle(color: Colors.blueAccent),
                        highlightedLinkStyle: TextStyle(
                          color: Colors.blueAccent,
                          backgroundColor: Colors.blueAccent.withAlpha(0x33),
                        ),
                        onTap: (url) => launch(url, forceSafariVC: false),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: loading
                            ? CircularProgressIndicator()
                            : (audioUrl == null || useSoundcloud
                                ? SoundCloudWebView()
                                : AudioStimulusPlayer(url: audioUrl)),
                      ),
                      Text.rich(
                        TextSpan(
                          text: strings.audio_stimuli_last_days,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => launch(
                                "https://www.credo-online.de/impulse/einfach-gemeinsam-beten.html"),
                        ),
                        style: a2hText.copyWith(
                          decoration: TextDecoration.underline,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}

class _MorningPrayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final strings = S.of(context);
    final textTheme = Theme.of(context).textTheme;

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
            child: Text(
              expanded ? strings.morning_prayer : strings.morning_prayer_head,
              style: textTheme.subtitle2,
            ),
          ),
        ),
      ),
    );
  }
}
