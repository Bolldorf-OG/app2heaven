/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import "dart:convert";

import "package:firebase_analytics/firebase_analytics.dart";
import "package:firebase_analytics/observer.dart";
import "package:firebase_crashlytics/firebase_crashlytics.dart";
import "package:firebase_messaging/firebase_messaging.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import "package:flutter_localizations/flutter_localizations.dart";
import "package:provider/provider.dart";
import "package:streaming_shared_preferences/streaming_shared_preferences.dart";

import "db/database.dart";
import "generated/l10n.dart";
import "pages/backup_restore.dart";
import 'pages/confession/confession.dart';
import "pages/dashboard.dart";
import 'pages/days_preview/days_preview.dart';
import 'pages/days_review/days_review.dart';
import 'pages/decisions/decisions.dart';
import 'pages/deeds/deeds.dart';
import "pages/donations.dart";
import 'pages/experiences/experiences.dart';
import 'pages/gods_words/gods_words.dart';
import "pages/introduction.dart";
import 'pages/prayer_requests/prayer_requests.dart';
import 'pages/prayer_times/prayer_times.dart';
import 'pages/settings/settings.dart';
import 'preferences/preferences.dart';
import 'widgets/deep_link_builder.dart';
import 'widgets/shared_content_loader.dart';

class App2Heaven extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final analytics = FirebaseAnalytics();
    analytics.logAppOpen();
    FirebaseMessaging.instance.getToken().then(
          (value) => analytics.setUserId(value?.substring(0, value.indexOf(":"))),
        );

    final settings = Provider.of<AppPreferences>(context).settings;

    return PreferenceBuilder<bool>(
      preference: settings.useSystemLocale,
      builder: (context, useSystemLocale) => PreferenceBuilder<Locale>(
        preference: settings.locale,
        builder: (context, value) => MaterialApp(
          title: "Flutter Demo",
          theme: ThemeData(
            primaryColor: Colors.blue,
            backgroundColor: Colors.grey.shade200,
            brightness: Brightness.light,
            appBarTheme: AppBarTheme(
              brightness: Brightness.light,
              color: Colors.white,
              iconTheme: IconThemeData(color: Colors.black38),
              actionsIconTheme: IconThemeData(color: Colors.blue),
              textTheme: Typography.englishLike2014.merge(Typography.material2014().black),
            ),
            buttonTheme: ButtonThemeData(
              buttonColor: Colors.blue,
              textTheme: ButtonTextTheme.primary,
            ),
            tabBarTheme: TabBarTheme(
              labelColor: Colors.black,
            ),
          ),
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate,
            S.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          locale: useSystemLocale ? null : value,
          routes: {
            "/": (_) => DeepLinkBuilder(
                  builder: (context) => DashboardPage(),
                ),
            "/donations": (_) => DonationsPage(),
            "/introduction": (_) => IntroductionPage(),
            "/settings": (_) => SettingsPage(),
            "/settings/dashboard": (_) => DashboardSettingsPage(),
            "/settings/days_preview": (_) => DaysPreviewSettingsPage(),
            "/settings/days_review": (_) => DaysReviewSettingsPage(),
            "/experiences": (_) => ExperiencesPage(),
            "/experiences/info": (_) => ExperiencesInfoPage(),
            "/experiences/my_experiences": (_) => MyExperiencesPage(),
            "/experiences/communities": (_) => CommunitiesPage(),
            "/experiences/communities/experiences": (ctx) => CommunityExperiencesPage(
                  communityId: ModalRoute.of(ctx)!.settings.arguments as String,
                ),
            "/experiences/communities/experiences/details": (ctx) => CommunityExperienceDetailsPage.fromArgs(
                  args: ModalRoute.of(ctx)!.settings.arguments as CommunityExperienceDetailsPageArgs,
                ),
            "/experiences/edit": (ctx) => ExperienceEditPage(
                  experience: ModalRoute.of(ctx)!.settings.arguments as Experience?,
                ),
            "/experiences/details": (ctx) => ExperienceDetailsPage(
                  experienceId: ModalRoute.of(ctx)!.settings.arguments as int,
                ),
            "/confession": (_) => ConfessionPage(),
            "/confession/info": (_) => ConfessionInfoPage(),
            "/confession/topics": (ctx) => ConfessionTopicsPage(
                  password: ModalRoute.of(ctx)!.settings.arguments as String,
                ),
            "/confession/topics/edit": (ctx) => ConfessionTopicEditPage.fromArgs(
                  args: ModalRoute.of(ctx)!.settings.arguments as ConfessionTopicEditPageArgs?,
                ),
            "/confession/topics/details": (ctx) => ConfessionTopicDetailsPage.fromArgs(
                  args: ModalRoute.of(ctx)!.settings.arguments as ConfessionTopicDetailsPageArgs,
                ),
            "/confession/preparation": (_) => ConfessionPreparationPage(),
            "/confession/reminder": (_) => ConfessionPlannerPage(),
            "/deeds": (_) => DeedsPage(),
            "/deeds/info": (_) => DeedsInfoPage(),
            "/deeds/current": (_) => CurrentDeedsPage(),
            "/deeds/archived": (_) => ArchivedDeedsPage(),
            "/deeds/edit": (ctx) => DeedEditPage(
                  deed: ModalRoute.of(ctx)!.settings.arguments as Deed?,
                ),
            "/deeds/details": (ctx) => DeedDetailsPage(
                  deedId: ModalRoute.of(ctx)!.settings.arguments as int,
                ),
            "/decisions": (_) => DecisionsPage(),
            "/decisions/info": (_) => DecisionsInfoPage(),
            "/decisions/current": (_) => CurrentDecisionsPage(),
            "/decisions/archived": (_) => ArchivedDecisionsPage(),
            "/decisions/edit": (ctx) => DecisionEditPage(
                  decision: ModalRoute.of(ctx)!.settings.arguments as Decision?,
                ),
            "/decisions/details": (ctx) => DecisionDetailsPage(
                  decisionId: ModalRoute.of(ctx)!.settings.arguments as int,
                ),
            "/gods-words": (_) => GodsWordsPage(),
            "/gods-words/info": (_) => GodsWordsInfoPage(),
            "/gods-words/current": (_) => CurrentGodsWordsPage(),
            "/gods-words/archived": (_) => ArchivedGodsWordsPage(),
            "/gods-words/bible": (_) => OpenBiblePage(),
            "/gods-words/bible/random": (_) => OpenBiblePage(
                  openRandom: true,
                ),
            "/gods-words/reminders": (_) => GodsWordsRemindersPage(),
            "/gods-words/edit": (ctx) => GodsWordEditPage(
                  godsWord: ModalRoute.of(ctx)!.settings.arguments as GodsWord?,
                ),
            "/gods-words/details": (ctx) => GodsWordDetailsPage(
                  godsWordId: ModalRoute.of(ctx)!.settings.arguments as int,
                ),
            "/prayer-requests": (_) => PrayerRequestsPage(),
            "/prayer-requests/info": (_) => PrayerRequestsInfoPage(),
            "/prayer-requests/current": (_) => CurrentPrayerRequestsPage(),
            "/prayer-requests/god-helped": (_) => DonePrayerRequestsPage(),
            "/prayer-requests/archived": (_) => ArchivedPrayerRequestsPage(),
            "/prayer-requests/of-month": (_) => PrayerRequestOfMonthPage(),
            "/prayer-requests/edit": (ctx) => PrayerRequestEditPage(
                  prayerRequest: ModalRoute.of(ctx)!.settings.arguments as PrayerRequest?,
                ),
            "/prayer-requests/details": (ctx) => PrayerRequestDetailsPage(
                  prayerRequestId: ModalRoute.of(ctx)!.settings.arguments as int,
                ),
            "/prayer-times": (_) => PrayerTimesPage(),
            "/prayer-times/info": (_) => PrayerTimesInfoPage(),
            "/prayer-times/planning": (_) => PrayerTimePlanningPage(),
            "/prayer-times/pray-now": (_) => PrayerTimerPage(),
            "/prayer-times/stimuli": (_) => PrayerStimuliPage(),
            "/prayer-times/stimuli/audio-stimulus": (_) => PrayerStimuliPage(
                  openAudioStimulus: true,
                ),
            "/prayer-times/stimuli/with-tag": (ctx) => PrayerStimuliWithTagPage.fromArgs(
                  args: ModalRoute.of(ctx)!.settings.arguments as PrayerStimuliWithTagPageArgs,
                ),
            "/prayer-times/stimuli/details": (ctx) => PrayerStimulusDetailsPage(
                  stimulusId: ModalRoute.of(ctx)!.settings.arguments as String?,
                ),
            "/prayer-times/notes": (_) => PrayerNotesPage(),
            "/prayer-times/notes/edit": (ctx) => PrayerNoteEditPage(
                  prayerNote: ModalRoute.of(ctx)!.settings.arguments as PrayerNote?,
                ),
            "/prayer-times/notes/details": (ctx) => PrayerNoteDetailsPage(
                  prayerNoteId: ModalRoute.of(ctx)!.settings.arguments as int,
                ),
            "/day-preview": (_) => DayPreviewPage(),
            "/day-review": (_) => DayReviewPage(),
            "/backup": (_) => BackupRestorePage(),
          },
          onGenerateRoute: (settings) {
            if (settings.name!.startsWith("/shared/")) {
              final args = settings.arguments as Map<String, dynamic>;
              final query = args["query"] as Map<String, dynamic>;
              final key = base64Url.decode(query["k"]);

              return MaterialPageRoute(
                settings: RouteSettings(name: "/shared/*"),
                builder: (context) => SharedContentLoader(
                  uri: Uri.https("app2heaven.firebaseapp.com", settings.name!, args["deepQuery"]),
                  encryptionKey: key,
                ),
              );
            }

            return null;
          },
          navigatorObservers: [
            FirebaseAnalyticsObserver(
                analytics: analytics, onError: (e) => FirebaseCrashlytics.instance.recordError(e, null)),
          ],
        ),
      ),
    );
  }
}

class App2HeavenTextStyle {
  final textStyle = TextStyle(
    fontSize: 18.0,
    height: 1.33,
  );
}
