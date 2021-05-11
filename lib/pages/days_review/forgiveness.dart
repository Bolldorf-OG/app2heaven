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

class DayReviewForgiveness extends StatelessWidget {
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
              strings.daysreview_forgivness_head,
              style: textTheme.headline6,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 16),
              child: Text(
                strings.daysreview_forgivness_paragraph,
                style: a2hText,
              ),
            ),
            Text(
              strings.daysreview_forgivness_head2,
              style: textTheme.headline6,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                strings.daysreview_forgivness_paragraph2,
                style: a2hText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
