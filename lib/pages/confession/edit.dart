/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../../widgets/navigation_drawer.dart';

@immutable
class ConfessionTopicEditPageArgs {
  final String? title;
  final String? content;

  const ConfessionTopicEditPageArgs(this.title, this.content);
}

class ConfessionTopicEditPage extends StatefulWidget {
  final String? title;
  final String? content;

  ConfessionTopicEditPage.fromArgs({
    Key? key,
    required ConfessionTopicEditPageArgs? args,
  }) : this(
          key: key,
          title: args?.title,
          content: args?.content,
        );

  ConfessionTopicEditPage({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ConfessionTopicEditPageState(title ?? "", content ?? "");
  }
}

class _ConfessionTopicEditPageState extends State<ConfessionTopicEditPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController titleController;
  final TextEditingController contentController;

  _ConfessionTopicEditPageState._create(this.titleController, this.contentController);

  _ConfessionTopicEditPageState(String title, String content)
      : this._create(TextEditingController(text: title), TextEditingController(text: content));

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final strings = S.of(context);

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Navigator.pop(
                  context,
                  ConfessionTopicEditPageArgs(
                    titleController.text,
                    contentController.text,
                  ),
                );
              }
            },
          ),
        ],
      ),
      bottomNavigationBar: NavigationBottomAppBar(),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: strings.title,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return strings.missing_title;
                    }

                    return null;
                  },
                ),
              ),
              Expanded(
                child: TextFormField(
                  controller: contentController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: strings.text,
                  ),
                  validator: (value) {
                    return null;
                  },
                  maxLines: null,
                  expands: true,
                  textAlignVertical: TextAlignVertical.top,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
