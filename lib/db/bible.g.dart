// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bible.dart';

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$BibleDaoMixin on DatabaseAccessor<AppDatabase> {
  $BibleBooksTable get bibleBooks => attachedDatabase.bibleBooks;
  $BibleVersesTable get bibleVerses => attachedDatabase.bibleVerses;
  BibleBookNames get bibleBookNames => attachedDatabase.bibleBookNames;
  Future<int> clearBookFts5() {
    return customUpdate(
      'DELETE FROM bible_book_names',
      variables: [],
      updates: {bibleBookNames},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> fillBookFts5() {
    return customInsert(
      'INSERT INTO bible_book_names (id, abbreviation, keywords, name) SELECT id, abbreviation, keywords, name FROM bible_books',
      variables: [],
      updates: {bibleBookNames},
    );
  }

  Selectable<SearchBookFts5Result> searchBookFts5(String query) {
    return customSelect(
        'SELECT CAST(id AS INTEGER) AS id,\n                                       highlight(bible_book_names, 1, \'_\', \'_\') AS name,\n                                       abbreviation,\n                                       highlight(bible_book_names, 2, \'**\', \'**\') AS keywords\n                                 FROM bible_book_names\n                                 WHERE bible_book_names MATCH :query\n                                 ORDER BY rank',
        variables: [
          Variable<String>(query)
        ],
        readsFrom: {
          bibleBookNames,
        }).map((QueryRow row) {
      return SearchBookFts5Result(
        id: row.read<int>('id'),
        name: row.read<String>('name'),
        abbreviation: row.read<String>('abbreviation'),
        keywords: row.read<String>('keywords'),
      );
    });
  }
}

class SearchBookFts5Result {
  final int id;
  final String name;
  final String abbreviation;
  final String keywords;
  SearchBookFts5Result({
    required this.id,
    required this.name,
    required this.abbreviation,
    required this.keywords,
  });
}
