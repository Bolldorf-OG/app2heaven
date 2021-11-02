/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:archive/archive_io.dart';
import 'package:file_picker_cross/file_picker_cross.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import '../app2heaven.dart';
import '../db/database.dart';
import '../generated/l10n.dart';
import '../preferences/preferences.dart';
import '../widgets/navigation_drawer.dart';

class BackupRestorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final strings = S.of(context);
    final prefs = Provider.of<AppPreferences>(context);
    final db = Provider.of<AppDatabase>(context);
    final a2hText = Provider.of<App2HeavenTextStyle>(context).textStyle;

    return Scaffold(
      appBar: AppBar(
        title: Text(strings.backup_restore),
      ),
      bottomNavigationBar: NavigationBottomAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              strings.backup_explanation,
              style: a2hText,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
              child: ElevatedButton.icon(
                icon: const Icon(Icons.save_alt),
                label: Text(strings.create_backup),
                onPressed: () async {
                  await FilePickerCross(await _createBackup(prefs)).exportToStorage(
                    fileName: "Backup_${DateTime.now().toIso8601String().replaceAll(RegExp(r'[.:]'), "-")}.zip"
                  );
                },
              ),
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.settings_backup_restore),
              label: Text(strings.restore_from_backup),
              onPressed: () async {
                final confirmed = await showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(strings.restore_from_backup_warning),
                    content: Text(strings.restore_backup_confirm),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context, false);
                        },
                        child: Text(strings.cancel),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context, true);
                        },
                        child: Text(strings.confirm),
                      ),
                    ],
                  ),
                );
                if (!confirmed) {
                  return;
                }

                await db.close();

                try {
                  await Future.any([
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => AlertDialog(
                        title: Text(strings.restore_from_backup),
                        content: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircularProgressIndicator.adaptive(),
                          ],
                        ),
                      ),
                    ),
                    FilePickerCross.importFromStorage(
                      type: FileTypeCross.custom,
                      fileExtension: "zip"
                    ).then((file) => _readBackupFrom(file, prefs))
                  ]);
                } on _VersionMismatchError catch (_) {
                  await showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(strings.restore_from_backup),
                      content: Text(strings.backup_version_mismatch),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: Text(strings.ok),
                        ),
                      ],
                    ),
                  );
                }

                Phoenix.rebirth(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<Uint8List> _createBackup(AppPreferences prefs) async {
    final tempDir = await (await getTemporaryDirectory()).createTemp("backup_");
    final tempDirOut = await (await getTemporaryDirectory()).createTemp("backupZip_");

    await File("${tempDir.path}/info").writeAsString("A2H-Backup v2021");
    await prefs.writeToJsonFile(File("${tempDir.path}/preferences.json"));
    await (await AppDatabase.dbFile).copy("${tempDir.path}/database.db");

    final backup = File("${tempDirOut.path}/backup.zip");

    final encoder = ZipFileEncoder();
    encoder.zipDirectory(tempDir, filename: backup.path);

    return await backup.readAsBytes();
  }

  Future<void> _readBackupFrom(FilePickerCross file, AppPreferences prefs) async {
    final decoder = ZipDecoder();
    final archive = decoder.decodeBytes(file.toUint8List());
    final info = utf8.decode(archive.findFile("info")?.content);

    if (info != "A2H-Backup v2021") {
      throw _VersionMismatchError();
    }

    final prefsFile = archive.findFile("preferences.json");
    if (prefsFile == null) {
      throw _VersionMismatchError();
    }

    final dbFile = archive.findFile("database.db");
    if (dbFile == null) {
      throw _VersionMismatchError();
    }

    final prefsJson = JsonDecoder().convert(utf8.decode(prefsFile.content));
    await prefs.readFromJson(prefsJson);

    await (await AppDatabase.dbFile).writeAsBytes(dbFile.content);
  }
}

class _VersionMismatchError extends Error {}
