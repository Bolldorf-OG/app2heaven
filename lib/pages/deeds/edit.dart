/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:moor/moor.dart' show Value;

import '../../db/database.dart';
import '../../generated/l10n.dart';
import '../../util/helpers.dart';
import '../../widgets/navigation_drawer.dart';

class DeedEditPage extends StatefulWidget {
  final Deed? deed;

  const DeedEditPage({Key? key, this.deed}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DeedEditPageState(deed?.title ?? "", deed?.content ?? "", deed?.date ?? DateTime.now());
  }
}

class _DeedEditPageState extends State<DeedEditPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController titleController;
  final TextEditingController contentController;
  DateTime? date;

  final _today = DateTime.now().startOfDay;

  _DeedEditPageState._create(this.titleController, this.contentController, this.date);

  _DeedEditPageState(String title, String content, DateTime date)
      : this._create(TextEditingController(text: title), TextEditingController(text: content), date);

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final strings = S.of(context);
    final locale = Localizations.localeOf(context);

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Navigator.pop(
                  context,
                  DeedsCompanion.insert(
                    title: titleController.text,
                    content: Value(contentController.text),
                    archived: false,
                    date: date!,
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
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: DateTimeField(
                  initialValue: date,
                  onChanged: (value) => date = value,
                  format: locale.mediumDateFormat,
                  onShowPicker: (context, currentValue) => showDatePicker(
                    context: context,
                    initialDate: currentValue?.isAfter(_today) == true ? currentValue! : _today,
                    firstDate: _today,
                    lastDate: _today.add(Duration(days: 365 * 10)),
                  ),
                  resetIcon: null,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: strings.deed_date_label,
                  ),
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
