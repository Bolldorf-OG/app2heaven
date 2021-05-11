/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer_builder/timer_builder.dart';

import '../db/database.dart';
import '../util/helpers.dart';

class PrayerTimer extends StatelessWidget {
  final Widget Function(
    BuildContext context,
    bool active,
    Duration? duration,
    void Function() togglePrayerTime,
  ) builder;

  const PrayerTimer({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dao = Provider.of<AppDatabase>(context).prayerItemsDao;

    return StreamBuilder<Duration?>(
      stream: dao.getTotalPrayerDurationForDateStream(DateTime.now().startOfDay),
      initialData: Duration.zero,
      builder: (context, snapshot) {
        final durationToday = snapshot.data;

        return StreamBuilder<PrayerItem?>(
          stream: dao.getCurrentPrayerItemStream(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            }

            return snapshot.data != null
                ? TimerBuilder.periodic(
                    Duration(seconds: 1),
                    builder: (context) => builder(
                      context,
                      true,
                      DateTime.now().difference(snapshot.data!.date) + durationToday!,
                      () => dao.endPrayerTime(DateTime.now()),
                    ),
                  )
                : builder(
                    context,
                    false,
                    durationToday,
                    () => dao.startPrayerTime(DateTime.now()),
                  );
          },
        );
      },
    );
  }
}
