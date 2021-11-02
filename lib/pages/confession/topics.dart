/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:moor/moor.dart' show Value;
import 'package:provider/provider.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

import '../../db/database.dart';
import '../../generated/l10n.dart';
import '../../preferences/preferences.dart';
import '../../util/confession_encryption.dart';
import '../../util/helpers.dart';
import '../../widgets/confession_topics_list.dart';
import '../../widgets/navigation_drawer.dart';
import 'edit.dart';

class ConfessionTopicsPage extends StatelessWidget {
  final String password;

  const ConfessionTopicsPage({
    Key? key,
    required this.password,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dao = Provider.of<AppDatabase>(context).confessionsDao;
    final strings = S.of(context);
    final confessionPrefs = Provider.of<AppPreferences>(context).confession;
    final locale = Localizations.localeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(strings.topics),
      ),
      bottomNavigationBar: NavigationBottomAppBar(),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 16),
              child: Image.asset(
                "assets/confession/topics.png",
                height: 64,
                width: 64,
              ),
            ),
            StreamBuilder<Confession>(
              stream: dao.getLastConfessionStream(),
              initialData: null,
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return Container();
                }

                return Text(
                  strings.last_confession(
                      locale.fullDateFormat.format(snapshot.data!.date)),
                );
              },
            ),
            PreferenceBuilder<DateTime>(
              preference: confessionPrefs.reminderDate,
              builder: (context, value) {
                if (value == DateTime(-1)) {
                  return Container();
                }

                return Text(
                  strings
                      .planned_confession(locale.fullDateFormat.format(value)),
                );
              },
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ConfessionTopicsList(password: password),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        tooltip: strings.add,
        onPressed: () async {
          dynamic result = await Navigator.pushNamed(
            context,
            "/confession/topics/edit",
            arguments: ConfessionTopicEditPageArgs(null, null),
          );
          if (result != null) {
            final title = result.title;
            final content = result.content;

            final ivAndSalt = await ConfessionIvAndSalt.load();

            await dao.insertConfessionTopic(
              ConfessionTopicsCompanion.insert(
                title: ConfessionEncryptionHelper.instance.encrypt(
                  title,
                  password,
                  ivAndSalt.salt,
                  ivAndSalt.iv,
                ),
                content: Value(
                  ConfessionEncryptionHelper.instance.encrypt(
                    content,
                    password,
                    ivAndSalt.salt,
                    ivAndSalt.iv,
                  ),
                ),
              ),
            );
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
