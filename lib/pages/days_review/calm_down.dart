/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';

import '../../app2heaven.dart';
import '../../generated/l10n.dart';

class DayReviewCalmDown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final strings = S.of(context);
    final textTheme = Theme.of(context).textTheme;
    final a2hText = Provider.of<App2HeavenTextStyle>(context).textStyle;

    return SingleChildScrollView(
      child: Padding(
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
            Text(
              strings.daysreview_calm_head,
              style: textTheme.headline6,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Icon(
                Icons.star,
                color: Color.fromARGB(104, 0, 0, 123),
              ),
            ),
            Text(
              strings.daysreview_calm_text,
              style: a2hText,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Icon(
                Icons.star,
                color: Color.fromARGB(104, 0, 0, 123),
              ),
            ),
            Text(
              strings.daysreview_calm_text2,
              style: a2hText,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Icon(
                Icons.star,
                color: Color.fromARGB(104, 0, 0, 123),
              ),
            ),
            Text(
              strings.daysreview_calm_text3,
              style: a2hText,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Icon(
                Icons.star,
                color: Color.fromARGB(104, 0, 0, 123),
              ),
            ),
            Text(
              strings.daysreview_calm_text4,
              style: a2hText,
            ),
          ],
        ),
      ),
    );
  }
}
