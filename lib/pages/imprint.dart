/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../generated/l10n.dart';
import '../widgets/navigation_drawer.dart';

class ImprintPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final strings = S.of(context);
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(strings.imprint_title),
      ),
      bottomNavigationBar: NavigationBottomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                "assets/logo_sun.png",
                height: 96,
                width: 96,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: FutureBuilder<PackageInfo>(
                  future: PackageInfo.fromPlatform(),
                  builder: (context, snapshot) {
                    return Text(
                      "App2Heaven (v${snapshot.data?.version})",
                      style: theme.textTheme.headline6,
                      textAlign: TextAlign.center,
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  strings.imprint_text,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  strings.imprint_donations_text,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  strings.imprint_donations_account_title,
                  style: theme.textTheme.bodyText1,
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                strings.imprint_donations_account_text,
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        style: textTheme.bodyText2,
                        text: strings.imprint_feedback_text,
                      ),
                      TextSpan(
                        style: theme.textTheme.bodyText2!
                            .copyWith(color: theme.primaryColor),
                        text: "info@appheaven.org",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            await launch("mailto://info@appheaven.org");
                          },
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  strings.imprint_address_title,
                  style: theme.textTheme.bodyText1,
                  textAlign: TextAlign.center,
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      style: textTheme.bodyText2,
                      text: strings.imprint_address_text,
                    ),
                    TextSpan(
                      style: theme.textTheme.bodyText2!
                          .copyWith(color: theme.primaryColor),
                      text: "https://app2heaven.com",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          await launch(
                            "https://app2heaven.com",
                            forceWebView: false,
                            forceSafariVC: false,
                          );
                        },
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
