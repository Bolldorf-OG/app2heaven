/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import "package:devicelocale/devicelocale.dart";
import "package:feature_discovery/feature_discovery.dart";
import 'package:file_picker_writable/file_picker_writable.dart';
import "package:firebase_core/firebase_core.dart";
import "package:firebase_crashlytics/firebase_crashlytics.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_local_notifications/flutter_local_notifications.dart";
import "package:flutter_localizations/flutter_localizations.dart";
import "package:flutter_native_timezone/flutter_native_timezone.dart";
import 'package:flutter_phoenix/flutter_phoenix.dart';
import "package:provider/provider.dart";
import "package:streaming_shared_preferences/streaming_shared_preferences.dart";
import "package:timezone/data/latest.dart";
import "package:timezone/timezone.dart";

import 'app2heaven.dart';
import "db/database.dart";
import 'pages/prayer_times/audio_stimulus/handler.dart';
import 'preferences/preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  const initializationSettings = InitializationSettings(
    android: AndroidInitializationSettings("ic_notification"),
    iOS: IOSInitializationSettings(
      requestAlertPermission: false,
      requestSoundPermission: false,
      requestBadgePermission: false,
    ),
  );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  initializeTimeZones();
  setLocalLocation(getLocation(await FlutterNativeTimezone.getLocalTimezone()));

  await Firebase.initializeApp();

  if (kReleaseMode) {
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  } else {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
  }

  final currentLocale = await Devicelocale.currentAsLocale ?? Locale("en");
  await GlobalMaterialLocalizations.delegate.load(currentLocale);

  await AudioStimulusHandler.init();

  FilePickerWritable().init();

  runApp(
    Phoenix(
      child: Provider<AppDatabase>(
        create: (context) => AppDatabase(),
        dispose: (context, db) => db.close(),
        child: Provider<AppPreferences>.value(
          value: AppPreferences(await StreamingSharedPreferences.instance),
          child: Provider<App2HeavenTextStyle>.value(
            value: App2HeavenTextStyle(),
            child: FeatureDiscovery(
              child: App2Heaven(),
            ),
          ),
        ),
      ),
    ),
  );
}
