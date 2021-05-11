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

import '../app2heaven.dart';
import '../db/database.dart';
import '../generated/l10n.dart';
import '../pages/confession/details.dart';
import '../pages/confession/edit.dart';
import '../util/confession_encryption.dart';
import '../util/helpers.dart';

@immutable
class _ConfessionTopicsWithIvAndSalt {
  final List<ConfessionTopic> topics;
  final ConfessionIvAndSalt ivAndSalt;

  _ConfessionTopicsWithIvAndSalt(this.topics, this.ivAndSalt);
}

class ConfessionTopicsList extends StatefulWidget {
  final String password;

  ConfessionTopicsList({
    Key? key,
    required this.password,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ConfessionTopicsListState();
}

class _ConfessionTopicsListState extends State<ConfessionTopicsList> with WidgetsBindingObserver {
  var popped = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (!popped && state != AppLifecycleState.resumed) {
      Navigator.pop(context);
      popped = true;
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dao = Provider.of<AppDatabase>(context).confessionsDao;
    final strings = S.of(context);

    return StreamBuilder<_ConfessionTopicsWithIvAndSalt>(
      initialData: null,
      stream: dao
          .getAllConfessionTopicsStream()
          .asyncMap((list) async => _ConfessionTopicsWithIvAndSalt(list, await ConfessionIvAndSalt.load())),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        }

        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.data!.topics.isEmpty) {
              return Container(
                alignment: Alignment.center,
                child: Text(
                  strings.no_confession_topics,
                  style: Theme.of(context).textTheme.headline5,
                  textAlign: TextAlign.center,
                ),
              );
            }

            return ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: snapshot.data!.topics.length,
              itemBuilder: (context, index) {
                final confessionTopic = snapshot.data!.topics[index];
                final salt = snapshot.data!.ivAndSalt.salt;
                final iv = snapshot.data!.ivAndSalt.iv;

                return _ConfessionTopicListItem(
                  ConfessionTopicData(
                    topic: confessionTopic,
                    title: ConfessionEncryptionHelper.instance.decrypt(
                      confessionTopic.title,
                      widget.password,
                      salt,
                      iv,
                    ),
                    content: ConfessionEncryptionHelper.instance.decrypt(
                      confessionTopic.content,
                      widget.password,
                      salt,
                      iv,
                    ),
                  ),
                  widget.password,
                );
              },
              separatorBuilder: (context, index) => Divider(color: Colors.grey),
            );
        }
      },
    );
  }
}

@immutable
class ConfessionTopicData {
  final ConfessionTopic? topic;
  final String? title;
  final String? content;

  ConfessionTopicData({this.topic, this.title, this.content});
}

class _ConfessionTopicListItem extends StatelessWidget {
  final ConfessionTopicData data;
  final String password;

  const _ConfessionTopicListItem(this.data, this.password);

  @override
  Widget build(BuildContext context) {
    final dao = Provider.of<AppDatabase>(context).confessionsDao;
    final strings = S.of(context);
    final textTheme = Theme.of(context).textTheme;
    final locale = Localizations.localeOf(context);
    final a2hText = Provider.of<App2HeavenTextStyle>(context).textStyle;

    void edit() async {
      dynamic result = await Navigator.pushReplacementNamed(
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

    Future<void> open() async {
      await Navigator.pushNamed(
        context,
        "/confession/topics/details",
        arguments: ConfessionTopicDetailsPageArgs(data.topic!.id, password),
      );
    }

    void delete() async {
      Navigator.pop(context);
      await dao.deleteConfessionTopic(data.topic!);
    }

    return InkWell(
      onTap: open,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  data.title!,
                  style: textTheme.headline6,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    data.content!,
                    maxLines: 5,
                    style: a2hText,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  locale.mediumDateFormat.format(data.topic!.created),
                  style: textTheme.caption,
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.remove_red_eye),
                      title: Text(strings.read),
                      onTap: () async {
                        Navigator.pop(context);
                        await open();
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.edit),
                      title: Text(strings.edit),
                      onTap: edit,
                    ),
                    ListTile(
                      leading: Icon(Icons.delete_forever),
                      title: Text(strings.delete),
                      onTap: delete,
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
