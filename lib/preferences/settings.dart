/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

import '../util/constants.dart';
import '../util/helpers.dart';
import 'adapters.dart';
import 'dashboard.dart';
import 'days_preview.dart';
import 'days_review.dart';
import 'preferences.dart';

class AppSettings {
  final Preference<bool> useSystemLocale;
  final Preference<Locale> locale;
  final DashboardSettings dashboard;
  final DaysPreviewSettings daysPreview;
  final DaysReviewSettings daysReview;
  final Preference<bool> analyticsEnabled;

  AppSettings(StreamingSharedPreferences preferences)
      : useSystemLocale = preferences.getBool(
          SettingsConstants.keyUseSystemLocale,
          defaultValue: true,
        ),
        locale = preferences.getCustomValue(
          SettingsConstants.keyLocale,
          defaultValue: ui.window.locale,
          adapter: LocaleAdapter.instance,
        ),
        dashboard = DashboardSettings(preferences),
        daysPreview = DaysPreviewSettings(preferences),
        daysReview = DaysReviewSettings(preferences),
        analyticsEnabled = preferences.getBool(
          SettingsConstants.keyAnalyticsEnabled,
          defaultValue: false,
        );

  Map<String, dynamic> get jsonData => {
        "useSystemLocale": useSystemLocale.getValue(),
        "locale": locale.getValue().toJson(),
        "dashboard": dashboard.jsonData,
        "daysPreview": daysPreview.jsonData,
        "daysReview": daysReview.jsonData,
        "analyticsEnabled": analyticsEnabled.getValue(),
      };

  Future<void> readFromJson(Map<String, dynamic> prefsJson) async {
    await useSystemLocale.setOrClearValue(prefsJson["useSystemLocale"]);
    await locale.setOrClearValue(JsonHelper.readLocale(prefsJson["locale"]));
    await dashboard.readFromJson(prefsJson["dashboard"]);
    await daysPreview.readFromJson(prefsJson["daysPreview"]);
    await daysReview.readFromJson(prefsJson["daysReview"]);
    await analyticsEnabled.setOrClearValue(prefsJson["analyticsEnabled"]);
  }
}
