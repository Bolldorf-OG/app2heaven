/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'dart:ui' as ui;

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_installations/firebase_installations.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../db/database.dart';
import '../../generated/l10n.dart';
import '../../preferences/preferences.dart';
import '../../util/confession_encryption.dart';
import '../../util/constants.dart';
import '../../widgets/navigation_drawer.dart';

export 'dashboard.dart';
export 'days_preview.dart';
export 'days_review.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final strings = S.of(context);
    final settings = Provider.of<AppPreferences>(context).settings;
    final confessionsDao = Provider.of<AppDatabase>(context).confessionsDao;
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final sectionTitleStyle =
        textTheme.subtitle2!.copyWith(color: theme.colorScheme.secondary);
    final analytics = FirebaseAnalytics();

    return Scaffold(
      appBar: AppBar(
        title: Text(strings.settings),
        actions: [
          PopupMenuButton(
            onSelected: (value) async {
              if (value == "debug_info") {
                final token = await FirebaseMessaging.instance.getToken();
                final fid = await FirebaseInstallations.id;
                await showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: SelectableText("Push Token: $token\n\nFID: $fid"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context, false);
                        },
                        child: Text(strings.back),
                      ),
                    ],
                  ),
                );
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: "debug_info",
                child: Text("Debug Infos"),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: NavigationBottomAppBar(),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Text(
            strings.language,
            style: sectionTitleStyle,
          ),
          PreferenceBuilder<bool>(
            preference: settings.useSystemLocale,
            builder: (context, value) => SwitchListTile(
              value: value,
              title: Text(strings.use_system_language),
              onChanged: (value) {
                analytics.logEvent(
                    name: AnalyticsConstants.eventUseSystemLocale,
                    parameters: {"value": value});
                settings.useSystemLocale.setValue(value);
                if (value) {
                  analytics.setUserProperty(
                      name: AnalyticsConstants.keyLocale,
                      value: ui.window.locale.toString());

                  settings.locale.setValue(ui.window.locale);
                }
              },
            ),
          ),
          PreferenceBuilder<bool>(
            preference: settings.useSystemLocale,
            builder: (context, useSystemLocale) => useSystemLocale
                ? Container()
                : PreferenceBuilder<Locale>(
                    preference: settings.locale,
                    builder: (context, value) {
                      return ListTile(
                        title: DropdownButton<String>(
                          isExpanded: true,
                          value: value.languageCode,
                          items: [
                            DropdownMenuItem(
                              value: "de",
                              child: Text("Deutsch"),
                            ),
                            DropdownMenuItem(
                              value: "en",
                              child: Text("English"),
                            ),
                            DropdownMenuItem(
                              value: "fr",
                              child: Text("Français"),
                            ),
                          ],
                          onChanged: (value) {
                            if (value != null) {
                              analytics.setUserProperty(
                                  name: AnalyticsConstants.keyLocale,
                                  value: value);

                              settings.locale.setValue(Locale(value));
                            }
                          },
                        ),
                      );
                    },
                  ),
          ),
          Text(
            strings.shown_elements,
            style: sectionTitleStyle,
          ),
          ListTile(
            title: Text(strings.dashboard),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.pushNamed(context, "/settings/dashboard");
            },
          ),
          ListTile(
            title: Text(strings.dayspreview),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.pushNamed(context, "/settings/days_preview");
            },
          ),
          ListTile(
            title: Text(strings.daysreview),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.pushNamed(context, "/settings/days_review");
            },
          ),
          Text(
            strings.confession_password,
            style: sectionTitleStyle,
          ),
          ListTile(
            title: ElevatedButton(
              onPressed: () async {
                final result = await showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: Text(strings.caution),
                          content: Text(strings.reset_password_caution),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, false),
                              child: Text(strings.cancel),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context, true),
                              child: Text(strings.reset),
                            )
                          ],
                        ));

                if (result) {
                  await confessionsDao.clearConfessionTopics();
                  await ConfessionIvAndSalt.clear();
                  final secureStorage = FlutterSecureStorage();
                  await secureStorage.delete(
                      key: ConfessionConstants.keyPasswordHash);
                  await secureStorage.delete(
                      key: ConfessionConstants.keyPasswordSalt);
                }
              },
              child: Text(strings.reset),
            ),
            subtitle: Text(strings.reset_password_caution),
          ),
          Text(
            "Analytics",
            style: sectionTitleStyle,
          ),
          PreferenceBuilder<bool>(
            preference: settings.analyticsEnabled,
            builder: (context, value) => SwitchListTile(
              value: value,
              title: Text(strings.send_data),
              subtitle: Text(strings.analytics_info),
              onChanged: (value) {
                settings.analyticsEnabled.setValue(value);
                FirebaseAnalytics().setAnalyticsCollectionEnabled(value);
              },
            ),
          ),
          ListTile(
            title: ElevatedButton(
              onPressed: () {
                launch("https://www.app2heaven.com/privacy-policy");
              },
              child: Text(strings.privacy_policy),
            ),
          ),
          ListTile(
            title: ElevatedButton(
              onPressed: () async {
                final packageInfo = await PackageInfo.fromPlatform();

                showLicensePage(
                  context: context,
                  applicationName: packageInfo.appName,
                  applicationVersion: packageInfo.version,
                );
              },
              child: Text(strings.oss_libs),
            ),
          ),
        ],
      ),
    );
  }
}
