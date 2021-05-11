/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../base/info_page.dart';

class PrayerRequestsInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final strings = S.of(context);

    return InfoPage(
      iconPath: "assets/prayer_requests/info.png",
      title: strings.prayerrequests,
      content: strings.prayerrequests_info_paragraph,
    );
  }
}
