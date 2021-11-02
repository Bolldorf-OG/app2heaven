/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:flutter/material.dart';
import 'package:moor/moor.dart' show Value;

import '../../../db/database.dart';
import '../../../generated/l10n.dart';
import '../../../widgets/navigation_drawer.dart';

class PrayerNoteEditPage extends StatefulWidget {
  final PrayerNote? prayerNote;

  const PrayerNoteEditPage({Key? key, this.prayerNote}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PrayerNoteEditPageState(
        prayerNote?.title ?? "", prayerNote?.content ?? "");
  }
}

class _PrayerNoteEditPageState extends State<PrayerNoteEditPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController titleController;
  final TextEditingController contentController;

  _PrayerNoteEditPageState._create(
      this.titleController, this.contentController);

  _PrayerNoteEditPageState(String title, String content)
      : this._create(TextEditingController(text: title),
            TextEditingController(text: content));

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
                  PrayerNotesCompanion.insert(
                    title: titleController.text,
                    content: Value(contentController.text),
                    shareLink: Value(null),
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
