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
import '../../base/list_page.dart';

@immutable
class PrayerStimuliWithTagPageArgs {
  final String tagName;
  final DocumentReference tagReference;

  PrayerStimuliWithTagPageArgs(this.tagName, this.tagReference);
}

class PrayerStimuliWithTagPage extends StatelessWidget {
  final String tagName;
  final DocumentReference tagReference;

  PrayerStimuliWithTagPage.fromArgs({
    Key? key,
    required PrayerStimuliWithTagPageArgs args,
  }) : this(
          key: key,
          tagName: args.tagName,
          tagReference: args.tagReference,
        );

  PrayerStimuliWithTagPage({
    Key? key,
    required this.tagName,
    required this.tagReference,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final strings = S.of(context);
    final textTheme = Theme.of(context).textTheme;
    final locale = Localizations.localeOf(context);
    final a2hText = Provider.of<App2HeavenTextStyle>(context).textStyle;

    return ListPage<DocumentSnapshot>(
      title: tagName,
      iconPath: "assets/prayer_times/stimulus.png",
      dataStream: FirebaseFirestore.instance
          .collection("stimuli")
          .where("tags", arrayContains: tagReference)
          .where("active", isEqualTo: true)
          .snapshots()
          .map((snapshot) => snapshot.docs),
      itemBuilder: (context, data) {
        final title = readLocalizedString(data, "title", locale)!;
        final text = readLocalizedString(data, "text", locale)!;
        return ListTile(
          title: Text(
            title,
            style: textTheme.headline6,
          ),
          subtitle: Text(
            text,
            style: a2hText,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
          dense: true,
          onTap: () async {
            await FirebaseAnalytics().logSelectContent(
              contentType: "stimulus",
              itemId: data.reference.path,
            );
            await Navigator.pushNamed(
              context,
              "/prayer-times/stimuli/details",
              arguments: data.id,
            );
          },
        );
      },
      noItemsFound: strings.no_stimuli,
    );
  }
}
