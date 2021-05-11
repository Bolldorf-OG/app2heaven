/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:moor/moor.dart';

import 'database.dart';

part 'bible.g.dart';

class BibleBooks extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  TextColumn get abbreviation => text()();

  TextColumn get keywords => text()();
}

class BibleVerses extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get book => integer().customConstraint('REFERENCES bible_books(id)')();

  IntColumn get chapter => integer()();

  IntColumn get verse => integer()();

  TextColumn get content => text().named("text")();
}

@UseDao(
  tables: [BibleBooks, BibleVerses],
  include: {
    "bible_queries.moor",
  },
)
class BibleDao extends DatabaseAccessor<AppDatabase> with _$BibleDaoMixin {
  BibleDao(AppDatabase db) : super(db);

  Future<Iterable<SearchBookFts5Result>> searchBooks(String query) {
    return searchBookFts5(query).get();
  }

  Future<int> getMaxChapterForBook(int bookId) {
    final maxChapter = bibleVerses.chapter.max();
    return (selectOnly(bibleVerses)
          ..addColumns([maxChapter])
          ..where(bibleVerses.book.equals(bookId)))
        .map((result) => result.read(maxChapter) ?? 0)
        .getSingle();
  }

  Future<int> getMaxVerseForChapter(int bookId, int chapter) {
    final maxVerse = bibleVerses.verse.max();
    return (selectOnly(bibleVerses)
          ..addColumns([maxVerse])
          ..where(bibleVerses.book.equals(bookId) & bibleVerses.chapter.equals(chapter)))
        .map((result) => result.read(maxVerse)!)
        .getSingle();
  }

  Future<BibleBook> getBookById(int bookId) {
    return (select(bibleBooks)..where((tbl) => tbl.id.equals(bookId))).getSingle();
  }

  Future<String> getChapterText(int bookId, int chapter) async {
    final verses = await (selectOnly(bibleVerses)
          ..addColumns([bibleVerses.content])
          ..where(
            bibleVerses.book.equals(bookId) & bibleVerses.chapter.equals(chapter),
          ))
        .map((result) => result.read(bibleVerses.content))
        .get();
    return verses.asMap().entries.map((e) => "${e.key + 1} ${e.value}").join("\n");
  }

  Future<String> getVerseText(int bookId, int chapter, int verse) {
    return (selectOnly(bibleVerses)
          ..addColumns([bibleVerses.content])
          ..where(
            bibleVerses.book.equals(bookId) & bibleVerses.chapter.equals(chapter) & bibleVerses.verse.equals(verse),
          ))
        .map((result) => result.read(bibleVerses.content)!)
        .getSingle();
  }

  Future<String> getVersesText(int bookId, int chapter, int verseFrom, int verseTo) async {
    final verses = await (selectOnly(bibleVerses)
          ..addColumns([bibleVerses.content])
          ..where(
            bibleVerses.book.equals(bookId) &
                bibleVerses.chapter.equals(chapter) &
                bibleVerses.verse.isBetweenValues(verseFrom, verseTo),
          ))
        .map((result) => result.read(bibleVerses.content))
        .get();

    return verses.asMap().entries.map((e) => "${e.key + verseFrom} ${e.value}").join("\n");
  }

  Future<BibleVerse> getRandomVerse() {
    return (select(bibleVerses)
          ..orderBy([
            (tbl) => OrderingTerm.asc(CustomExpression<int>("RANDOM()")),
          ])
          ..limit(1))
        .getSingle();
  }
}
