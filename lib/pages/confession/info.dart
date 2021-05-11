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

class ConfessionInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final strings = S.of(context);

    return InfoPage.sections(
      iconPath: "assets/confession/info.png",
      sections: [
        InfoPageSection(
          title: strings.confession_info_head,
          content: strings.confession_info_paragraph,
        ),
        InfoPageSection(
          title: strings.confession_info_head2,
          content: strings.confession_info_paragraph2,
        ),
      ],
    );
  }
}
