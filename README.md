# App2Heaven

https://www.app2heaven.com/

## Bible Data

To build and run this app, you need to supply your own bible data.
To do so, you need to add two files: `assets/bible/books.sql` and `assets/bible/verses.sql`.
Both files are simply SQL insert scripts.

The format for `books.sql` is:
```sql
INSERT INTO bible_books (id, abbreviation, name, keywords)
VALUES
(1,'Gen','Das Buch Genesis','genesis mose moose'),
-- Add the other books of the bible, with the keywords that can be used in the search
;
```

The file `verses.sql` should look like this:
```sql
INSERT INTO bible_verses (book, chapter, verse, text)
VALUES
(1,1,1, 'Im Anfang erschuf Gott Himmel und Erde.'),
-- Add all the other verses of the bible. The book field references the data from books.sql, chapter and verse are just the chapter and verse number of the verse.
;
```

## License

This Source Code Form is subject to the terms of the Mozilla Public
License, v. 2.0. If a copy of the MPL was not distributed with this
file, You can obtain one at https://mozilla.org/MPL/2.0/.

See also [LICENSE](LICENSE)
