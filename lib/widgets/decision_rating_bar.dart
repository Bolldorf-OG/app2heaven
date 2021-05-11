/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import '../generated/l10n.dart';
import 'ratings_icons.dart';

class DecisionRatingBar extends StatelessWidget {
  final int ratingLevel;
  final void Function(int) onRatingChanged;

  const DecisionRatingBar({Key? key, required this.ratingLevel, required this.onRatingChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final strings = S.of(context);

    return Column(
      children: [
        if (ratingLevel == 1) Text(strings.rating_min),
        if (ratingLevel == 5) Text(strings.rating_max),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(
                RatingsIcons.rating1,
                color: ratingLevel == 1 ? Color.fromARGB(220, 240, 83, 0) : Colors.grey,
              ),
              onPressed: () => onRatingChanged(1),
            ),
            IconButton(
              icon: Icon(
                RatingsIcons.rating2,
                color: ratingLevel == 2 ? Color.fromARGB(227, 252, 158, 0) : Colors.grey,
              ),
              onPressed: () => onRatingChanged(2),
            ),
            IconButton(
              icon: Icon(
                RatingsIcons.rating3,
                color: ratingLevel == 3 ? Color.fromARGB(233, 234, 209, 0) : Colors.grey,
              ),
              onPressed: () => onRatingChanged(3),
            ),
            IconButton(
              icon: Icon(
                RatingsIcons.rating4,
                color: ratingLevel == 4 ? Color.fromARGB(222, 211, 212, 0) : Colors.grey,
              ),
              onPressed: () => onRatingChanged(4),
            ),
            IconButton(
              icon: Icon(
                RatingsIcons.rating5,
                color: ratingLevel == 5 ? Color.fromARGB(198, 0, 156, 21) : Colors.grey,
              ),
              onPressed: () => onRatingChanged(5),
            ),
          ],
        ),
      ],
    );
  }
}
