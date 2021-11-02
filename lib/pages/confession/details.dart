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

import '../../app2heaven.dart';
import '../../db/database.dart';
import '../../generated/l10n.dart';
import '../../util/confession_encryption.dart';
import '../../util/helpers.dart';
import '../../widgets/confession_topics_list.dart';
import '../../widgets/navigation_drawer.dart';
import 'edit.dart';

@immutable
class ConfessionTopicDetailsPageArgs {
  final int confessionTopicId;
  final String password;

  const ConfessionTopicDetailsPageArgs(this.confessionTopicId, this.password);
}

class ConfessionTopicDetailsPage extends StatelessWidget {
  final int confessionTopicId;
  final String password;

  ConfessionTopicDetailsPage.fromArgs({
    Key? key,
    required ConfessionTopicDetailsPageArgs args,
  }) : this(
          key: key,
          confessionTopicId: args.confessionTopicId,
          password: args.password,
        );

  ConfessionTopicDetailsPage({
    Key? key,
    required this.confessionTopicId,
    required this.password,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dao = Provider.of<AppDatabase>(context).confessionsDao;
    final strings = S.of(context);
    final locale = Localizations.localeOf(context);
    final textTheme = Theme.of(context).textTheme;
    final a2hText = Provider.of<App2HeavenTextStyle>(context).textStyle;

    return StreamBuilder<ConfessionTopicData>(
      initialData: null,
      stream: dao
          .getConfessionTopicStream(confessionTopicId)
          .asyncMap((topic) async {
        final ivAndSalt = await ConfessionIvAndSalt.load();

        return ConfessionTopicData(
          topic: topic,
          title: ConfessionEncryptionHelper.instance.decrypt(
            topic.title,
            password,
            ivAndSalt.salt,
            ivAndSalt.iv,
          ),
          content: ConfessionEncryptionHelper.instance.decrypt(
            topic.content,
            password,
            ivAndSalt.salt,
            ivAndSalt.iv,
          ),
        );
      }),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(),
            bottomNavigationBar: NavigationBottomAppBar(),
            body: Text("Error: ${snapshot.error}"),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting ||
            snapshot.connectionState == ConnectionState.none) {
          return Scaffold(
            appBar: AppBar(),
            bottomNavigationBar: NavigationBottomAppBar(),
            body: Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            ),
          );
        }
        final data = snapshot.data;

        if (data == null) {
          return Scaffold(
            appBar: AppBar(),
            bottomNavigationBar: NavigationBottomAppBar(),
          );
        }

        void edit() async {
          dynamic result = await Navigator.pushNamed(
            context,
            "/confession/topics/edit",
            arguments: ConfessionTopicEditPageArgs(data.title, data.content),
          );
          if (result != null) {
            final title = result.title;
            final content = result.content;

            final ivAndSalt = await ConfessionIvAndSalt.load();

            await dao.updateConfessionTopic(
              data.topic!,
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
        }

        void delete() async {
          Navigator.pop(context);
          await dao.deleteConfessionTopic(data.topic!);
        }

        return Scaffold(
          appBar: AppBar(),
          bottomNavigationBar: NavigationBottomAppBar(
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: edit,
                tooltip: strings.edit,
              ),
              IconButton(
                icon: Icon(Icons.delete_forever),
                onPressed: delete,
                tooltip: strings.delete,
              ),
            ],
          ),
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    data.title!,
                    style: textTheme.headline5,
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: SelectableText(
                      data.content!,
                      style: a2hText,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    locale.mediumDateFormat.format(data.topic!.created),
                    style: textTheme.caption,
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
