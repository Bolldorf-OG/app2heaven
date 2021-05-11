/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:moor/moor.dart' show Value;
import 'package:provider/provider.dart';

import '../../db/database.dart';
import '../../generated/l10n.dart';
import '../../util/confession_encryption.dart';
import '../../util/constants.dart';
import '../../widgets/confession_topics_list.dart';
import '../../widgets/password_dialog.dart';
import '../confession/edit.dart';

class DayReviewConfession extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DayReviewConfessionState();
}

class _DayReviewConfessionState extends State<DayReviewConfession> with WidgetsBindingObserver {
  String? _storedPassword;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state != AppLifecycleState.resumed) {
      setState(() {
        _storedPassword = null;
      });
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
    final textTheme = Theme.of(context).textTheme;

    return StatefulBuilder(
      builder: (context, setState) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(bottom: 16),
                child: Image.asset(
                  "assets/day_review.png",
                  height: 64,
                  width: 64,
                ),
              ),
              Text(
                strings.daysreview_confession_head,
                style: textTheme.headline6,
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: ElevatedButton(
                  onPressed: () async {
                    final password = _storedPassword ??
                        await PasswordDialog.show(
                          context,
                          hashKey: ConfessionConstants.keyPasswordHash,
                          saltKey: ConfessionConstants.keyPasswordSalt,
                          onStoreNewPassword: ConfessionIvAndSalt.initialize,
                        );

                    setState(() {
                      _storedPassword = password;
                    });

                    if (password != null) {
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
                    }
                  },
                  child: Text(strings.daysreview_confession_button),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  strings.topics,
                  style: textTheme.subtitle2,
                  textAlign: TextAlign.center,
                ),
              ),
              if (_storedPassword == null)
                ElevatedButton.icon(
                    icon: Icon(Icons.lock),
                    label: Text(strings.unlock),
                    onPressed: () async {
                      final password = await PasswordDialog.show(
                        context,
                        hashKey: ConfessionConstants.keyPasswordHash,
                        saltKey: ConfessionConstants.keyPasswordSalt,
                        onStoreNewPassword: ConfessionIvAndSalt.initialize,
                      );

                      setState(() {
                        _storedPassword = password;
                      });
                    })
              else
                Expanded(
                  child: ConfessionTopicsList(password: _storedPassword!),
                )
            ],
          ),
        );
      },
    );
  }
}
