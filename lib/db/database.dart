/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import 'bible.dart';
import 'confessions.dart';
import 'decisions.dart';
import 'deeds.dart';
import 'experiences.dart';
import 'favorites.dart';
import 'gods_words.dart';
import 'prayer_items.dart';
import 'prayer_notes.dart';
import 'prayer_requests.dart';

part 'database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final file = await AppDatabase.dbFile;
    return VmDatabase(file);
  });
}

@UseMoor(
  tables: [
    Deeds,
    Decisions,
    DecisionRatings,
    Confessions,
    ConfessionTopics,
    Experiences,
    GodsWords,
    PrayerNotes,
    PrayerRequests,
    PrayerItems,
    Favorites,
    BibleBooks,
    BibleVerses,
  ],
  daos: [
    DeedsDao,
    DecisionsDao,
    ConfessionsDao,
    ExperiencesDao,
    GodsWordsDao,
    PrayerNotesDao,
    PrayerRequestsDao,
    PrayerItemsDao,
    FavoritesDao,
    BibleDao,
  ],
  include: {
    "bible_fts.moor",
  },
)
class AppDatabase extends _$AppDatabase {
  static Future<File> get dbFile async {
    final dbFolder = await getApplicationSupportDirectory();

    return File(path.join(dbFolder.path, 'db.v2020.sqlite'));
  }

  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 11;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
        },
        beforeOpen: (details) async {
          if (details.wasCreated) {
            await customStatement(
              await rootBundle.loadString("assets/bible/books.sql"),
            );
            await customStatement(
              await rootBundle.loadString("assets/bible/verses.sql"),
            );
            await bibleDao.fillBookFts5();
          }
        },
        onUpgrade: (m, from, to) async {
          if (from == 10 && to == 11) {
            return; // nothing to do
          }
        },
      );
}

class DurationConverter extends TypeConverter<Duration, int> {
  const DurationConverter();

  @override
  Duration? mapToDart(int? fromDb) =>
      fromDb == null ? null : Duration(microseconds: fromDb);

  @override
  int? mapToSql(Duration? value) => value?.inMicroseconds;
}

class DocumentReferenceConverter
    extends TypeConverter<DocumentReference, String> {
  const DocumentReferenceConverter();

  @override
  DocumentReference? mapToDart(String? fromDb) =>
      fromDb == null ? null : FirebaseFirestore.instance.doc(fromDb);

  @override
  String? mapToSql(DocumentReference? value) => value?.path;
}

extension DateTimeExtensions on Expression<DateTime?> {
  Expression<DateTime> get startOfDay => FunctionCallExpression<String>(
        "strftime",
        [
          const Constant<String>("%s"),
          FunctionCallExpression<int>(
            "date",
            [
              this,
              const Constant<String>("unixepoch"),
              const Constant<String>("localtime")
            ],
          ),
        ],
      ).cast();
}
