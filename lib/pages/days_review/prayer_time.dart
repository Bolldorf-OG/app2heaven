/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:moor/moor.dart' show Value;
import 'package:provider/provider.dart';

import '../../db/database.dart';
import '../../db/prayer_items.dart';
import '../../generated/l10n.dart';
import '../../util/helpers.dart';
import '../../widgets/prayer_time_chart.dart';

class DayReviewPrayerTime extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DayReviewPrayerTimeState();
}

class _DayReviewPrayerTimeState extends State<DayReviewPrayerTime> {
  Duration? _prayerDurationToday = Duration.zero;
  Duration _prayerDurationTomorrow = Duration.zero;

  StreamSubscription<Duration?>? _prayerDurationTodaySubscription;

  final _dialogController = TextEditingController();
  final _dialogFocusNode = FocusNode();

  final _today = DateTime.now().startOfDay;

  void _editPrayerTimeToday(PrayerItemsDao dao) async {
    final strings = S.of(context);

    final oldDuration = _prayerDurationToday!;
    _dialogController.text = oldDuration.inMinutes.toString();

    final newDuration = await (showDialog<Duration>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(strings.daysreview_prayertime_sub),
        content: TextField(
          controller: _dialogController,
          decoration: InputDecoration(
            suffixText: " min",
          ),
          textInputAction: TextInputAction.done,
          onEditingComplete: () => Navigator.pop(context, Duration(minutes: int.parse(_dialogController.text))),
          keyboardType: TextInputType.number,
          autofocus: true,
          focusNode: _dialogFocusNode,
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(strings.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, Duration(minutes: int.parse(_dialogController.text))),
            child: Text(strings.save),
          )
        ],
      ),
    ));

    if (newDuration == null) {
      return;
    }

    await dao.insertPrayerItem(PrayerItemsCompanion.insert(
      date: DateTime.now(),
      duration: Value(newDuration - oldDuration),
    ));
  }

  void _loadPrayerDurations() async {
    final dao = Provider.of<AppDatabase>(context).prayerItemsDao;
    _prayerDurationTodaySubscription = dao.getTotalPrayerDurationForDateStream(_today).listen((duration) {
      setState(() {
        _prayerDurationToday = duration;
      });
    });

    final durationTomorrow = await getIntendedPrayerTime(_today.add(Duration(days: 1)).getWeekday());
    setState(() {
      _prayerDurationTomorrow = durationTomorrow;
    });
  }

  @override
  void initState() {
    super.initState();
    _dialogFocusNode.addListener(() {
      _dialogController.selection = TextSelection(baseOffset: 0, extentOffset: _dialogController.text.length);
    });
  }

  @override
  void dispose() {
    _prayerDurationTodaySubscription?.cancel();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadPrayerDurations();
  }

  @override
  Widget build(BuildContext context) {
    final strings = S.of(context);
    final textTheme = Theme.of(context).textTheme;
    final dao = Provider.of<AppDatabase>(context).prayerItemsDao;

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
              strings.daysreview_prayertime_head,
              style: textTheme.headline6,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                strings.daysreview_prayertime_sub,
                style: textTheme.subtitle1,
              ),
            ),
            Text(
              _prayerDurationToday!.formatHoursMinutes(context),
              style: textTheme.headline5,
            ),
            ElevatedButton(
              onPressed: () => _editPrayerTimeToday(dao),
              child: Text(strings.edit),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                strings.daysreview_prayertime_sub2,
                style: textTheme.subtitle1,
              ),
            ),
            Text(
              _prayerDurationTomorrow.formatHoursMinutes(context),
              style: textTheme.headline5,
            ),
            AspectRatio(
              aspectRatio: 4.0 / 3.0,
              child: PrayerTimeChart(),
            ),
          ],
        ),
      ),
    );
  }
}
