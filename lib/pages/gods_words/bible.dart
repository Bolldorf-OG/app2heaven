/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'dart:async';
import 'dart:io';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:moor/moor.dart' show Value;
import 'package:provider/provider.dart';

import '../../app2heaven.dart';
import '../../db/bible.dart';
import '../../db/database.dart';
import '../../generated/l10n.dart';
import '../../util/constants.dart';
import '../../widgets/navigation_drawer.dart';

class OpenBiblePage extends StatefulWidget {
  final bool openRandom;

  const OpenBiblePage({
    Key? key,
    this.openRandom = false,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OpenBiblePageState();
}

class _OpenBiblePageState extends State<OpenBiblePage> {
  final _formKey = GlobalKey<FormState>();
  final _bibleBookController = TextEditingController();
  final _bibleChapterController = TextEditingController();
  final _bibleVerseController = TextEditingController();
  final _bibleBookFocusNode = FocusNode();
  final _bibleChapterFocusNode = FocusNode();
  final _bibleVerseFocusNode = FocusNode();

  GodsWordsCompanion? _godsWordPreview;
  int? _selectedBookId;
  int _maxChapter = 0;
  int? _selectedChapter;
  int _maxVerse = 0;
  int? _selectedVerseFrom;
  int? _selectedVerseTo;

  void _suggestRandomPassage() async {
    await FirebaseAnalytics()
        .logEvent(name: AnalyticsConstants.eventViewBibleRandom);

    final dao = Provider.of<AppDatabase>(context, listen: false).bibleDao;
    final verse = await dao.getRandomVerse();
    final book = await dao.getBookById(verse.book);
    final maxChapter = await dao.getMaxChapterForBook(verse.book);
    final maxVerse = await dao.getMaxVerseForChapter(verse.book, verse.chapter);

    final int verseFrom;
    final int verseTo;

    if (verse.verse + 4 > maxVerse) {
      verseFrom = maxVerse - 4;
      verseTo = maxVerse;
    } else {
      verseFrom = verse.verse;
      verseTo = verse.verse + 4;
    }

    final passage =
        await _loadPassage(dao, verse.book, verse.chapter, verseFrom, verseTo);

    setState(() {
      _selectedBookId = verse.book;
      _maxChapter = maxChapter;
      _maxVerse = maxVerse;
      _bibleBookController.text = "${book.name}";
      _bibleChapterController.text = "${verse.chapter}";
      _bibleVerseController.text = "$verseFrom-$verseTo";

      _godsWordPreview = passage;
    });
  }

  Future<GodsWordsCompanion> _loadPassage(
    BibleDao bibleDao,
    int bookId,
    int chapter,
    int? verseFrom,
    int? verseTo,
  ) async {
    await FirebaseAnalytics().logEvent(
      name: AnalyticsConstants.eventViewBible,
      parameters: {
        "book": bookId,
        "chapter": chapter,
        "verse_from": verseFrom ?? -1,
        "verse_to": verseTo ?? -1,
      },
    );

    final book = await bibleDao.getBookById(bookId);

    String title;
    String? content;
    if (verseFrom == null) {
      title = "${book.abbreviation} $chapter";
      content = await bibleDao.getChapterText(bookId, chapter);
    } else if (verseTo == null) {
      title = "${book.abbreviation} $chapter, $verseFrom";
      content = await bibleDao.getVerseText(bookId, chapter, verseFrom);
    } else {
      title = "${book.abbreviation} $chapter, $verseFrom-$verseTo";
      content =
          await bibleDao.getVersesText(bookId, chapter, verseFrom, verseTo);
    }

    return GodsWordsCompanion.insert(
      title: title,
      content: Value(content),
      archived: false,
      emphasized: false,
    );
  }

  @override
  void initState() {
    super.initState();

    _bibleChapterController.addListener(() async {
      final book = _selectedBookId;
      if (book == null) {
        return;
      }

      final dao = Provider.of<AppDatabase>(context, listen: false).bibleDao;

      final chapter = int.tryParse(_bibleChapterController.text);
      if (chapter == null) {
        return;
      }
      final maxVerse = await dao.getMaxVerseForChapter(book, chapter);
      setState(() {
        _selectedChapter = chapter;
        _maxVerse = maxVerse;
      });
    });

    _bibleVerseController.addListener(() async {
      setState(() {
        final value = _bibleVerseController.text;

        if (RegExp(r"^\d+-\d+$").hasMatch(value)) {
          final match = RegExp(r"^(\d+)-(\d+)$").firstMatch(value)!;
          final from = int.tryParse(match.group(1)!);
          final to = int.tryParse(match.group(2)!);

          setState(() {
            _selectedVerseFrom = from;
            _selectedVerseTo = to;
          });
        } else {
          final verse = int.tryParse(value);

          setState(() {
            _selectedVerseFrom = verse;
            _selectedVerseTo = null;
          });
        }
      });
    });

    _bibleBookFocusNode.addListener(() {
      if (_bibleBookFocusNode.hasFocus) {
        _bibleBookController.selection = TextSelection(
          baseOffset: 0,
          extentOffset: _bibleBookController.text.length,
        );
      }
    });

    _bibleChapterFocusNode.addListener(() {
      if (_bibleChapterFocusNode.hasFocus) {
        _bibleChapterController.selection = TextSelection(
          baseOffset: 0,
          extentOffset: _bibleChapterController.text.length,
        );
      }
    });

    _bibleVerseFocusNode.addListener(() {
      if (_bibleVerseFocusNode.hasFocus) {
        _bibleVerseController.selection = TextSelection(
          baseOffset: 0,
          extentOffset: _bibleVerseController.text.length,
        );
      }
    });

    if (widget.openRandom) {
      _suggestRandomPassage();
    }
  }

  @override
  void dispose() {
    _bibleBookController.dispose();
    _bibleChapterController.dispose();
    _bibleVerseController.dispose();
    _bibleBookFocusNode.dispose();
    _bibleChapterFocusNode.dispose();
    _bibleVerseFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final strings = S.of(context);
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(strings.open_bible),
      ),
      bottomNavigationBar: NavigationBottomAppBar(),
      body: FutureBuilder<List<InternetAddress>>(
        initialData: [],
        future: InternetAddress.lookup("app2heaven.firebaseapp.com"),
        builder: (context, snapshot) {
          if (snapshot.data?.isNotEmpty == true &&
              snapshot.data![0].rawAddress.isNotEmpty == true) {
            return _realPage();
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.asset(
                  "assets/gods_words/open_bible.png",
                  width: 64,
                  height: 64,
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      strings.open_bible_needs_internet,
                      style: textTheme.headline6,
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _realPage() {
    final db = Provider.of<AppDatabase>(context);
    final dao = db.godsWordsDao;
    final bibleDao = db.bibleDao;
    final strings = S.of(context);
    final textTheme = Theme.of(context).textTheme;
    final a2hText = Provider.of<App2HeavenTextStyle>(context).textStyle;

    void save() async {
      final id = await dao.insertGodsWord(_godsWordPreview!);
      setState(() {
        _godsWordPreview = null;
      });
      await Navigator.pushNamed(context, "/gods-words/details", arguments: id);
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Image.asset(
            "assets/gods_words/open_bible.png",
            width: 64,
            height: 64,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              strings.bible_reference_advice,
              style: textTheme.subtitle1,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: InkWell(
                onTap: _suggestRandomPassage,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "assets/gods_words/open_bible/random.png",
                        height: 24,
                        width: 24,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        strings.open_bible_somewhere,
                        style: textTheme.subtitle1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          TypeAheadField<SearchBookFts5Result>(
            textFieldConfiguration: TextFieldConfiguration(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: strings.bible_book,
              ),
              controller: _bibleBookController,
              textInputAction: TextInputAction.next,
              onSubmitted: (value) {
                FocusScope.of(context).nextFocus();
              },
              focusNode: _bibleBookFocusNode,
            ),
            noItemsFoundBuilder: (context) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  strings.no_bible_books,
                  style: textTheme.bodyText1,
                ),
              );
            },
            itemBuilder: (context, result) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  MarkdownBody(
                    data: result.name,
                    styleSheet: MarkdownStyleSheet().copyWith(
                      p: textTheme.subtitle2,
                    ),
                  ),
                  MarkdownBody(
                    data: result.keywords,
                    styleSheet: MarkdownStyleSheet().copyWith(
                      p: textTheme.caption,
                    ),
                  ),
                ],
              ),
            ),
            suggestionsCallback: (pattern) async {
              WidgetsBinding.instance?.addPostFrameCallback((_) {
                setState(() {
                  _selectedBookId = null;
                });
              });
              return pattern.isEmpty
                  ? []
                  : await bibleDao.searchBooks("$pattern*");
            },
            onSuggestionSelected: (suggestion) async {
              final name = md.Document()
                  .parseInline(suggestion.name)
                  .map((e) => e.textContent)
                  .join();
              final maxChapter =
                  await bibleDao.getMaxChapterForBook(suggestion.id);
              setState(() {
                _selectedBookId = suggestion.id;
                _maxChapter = maxChapter;
                _bibleBookController.text = name;
              });
            },
          ),
          Form(
            key: _formKey,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: _bibleChapterController,
                      enabled: _selectedBookId != null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: strings.bible_chapter,
                      ),
                      keyboardType: TextInputType.number,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      autocorrect: false,
                      enableSuggestions: false,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter("$_maxChapter".length),
                      ],
                      validator: (value) {
                        final chapter = int.tryParse(value!) ?? 0;
                        return 0 < chapter && chapter <= _maxChapter
                            ? null
                            : strings.bible_chapter_max(_maxChapter);
                      },
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).nextFocus();
                      },
                      focusNode: _bibleChapterFocusNode,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                    child: TextFormField(
                      controller: _bibleVerseController,
                      enabled: _selectedBookId != null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: strings.bible_verses,
                        hintText: strings.bible_verses_hint,
                      ),
                      keyboardType:
                          TextInputType.numberWithOptions(signed: true),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      autocorrect: false,
                      enableSuggestions: false,
                      inputFormatters: [
                        TextInputFormatter.withFunction((oldValue, newValue) {
                          if (newValue.text.isEmpty) {
                            return newValue;
                          }

                          final match = RegExp(r"(\d+)(?:-(\d+))?")
                              .matchAsPrefix(newValue.text);
                          final maxLength = "$_maxVerse".length;
                          if ((match?.group(1)?.length ?? 0) <= maxLength &&
                              (match?.group(2)?.length ?? 0) <= maxLength) {
                            return newValue;
                          }

                          return oldValue;
                        }),
                      ],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return null;
                        }

                        if (RegExp(r"^\d+-\d+$").hasMatch(value)) {
                          final match =
                              RegExp(r"^(\d+)-(\d+)$").firstMatch(value)!;
                          final from = int.tryParse(match.group(1)!)!;
                          final to = int.tryParse(match.group(2)!);

                          if (0 < from && from < to! && to <= _maxVerse) {
                            return null;
                          }

                          return strings.bible_verse_max(_maxVerse);
                        }

                        final verse = int.tryParse(value) ?? 0;
                        return 0 < verse && verse <= _maxVerse
                            ? null
                            : strings.bible_verse_max(_maxVerse);
                      },
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (value) async {
                        if (!_formKey.currentState!.validate()) {
                          setState(() {
                            _godsWordPreview = null;
                          });
                          return;
                        }

                        final book = _selectedBookId;
                        final chapter = _selectedChapter;

                        if (book == null || chapter == null) {
                          return;
                        }

                        final passage = await _loadPassage(
                          bibleDao,
                          book,
                          chapter,
                          _selectedVerseFrom,
                          _selectedVerseTo,
                        );
                        setState(() {
                          _godsWordPreview = passage;
                        });
                      },
                      focusNode: _bibleVerseFocusNode,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: _selectedBookId == null || _selectedChapter == null
                ? null
                : () async {
                    FocusScope.of(context).unfocus();

                    if (!_formKey.currentState!.validate()) {
                      setState(() {
                        _godsWordPreview = null;
                      });
                      return;
                    }

                    final book = _selectedBookId;
                    final chapter = _selectedChapter;

                    if (book == null || chapter == null) {
                      return;
                    }

                    final passage = await _loadPassage(
                      bibleDao,
                      book,
                      chapter,
                      _selectedVerseFrom,
                      _selectedVerseTo,
                    );
                    setState(() {
                      _godsWordPreview = passage;
                    });
                  },
            child: Text(
              _selectedBookId == null || _selectedChapter == null
                  ? strings.read
                  : _selectedVerseFrom == null
                      ? strings.read_passage
                      : strings.read_verses(
                          (_selectedVerseTo ?? _selectedVerseFrom)! -
                              _selectedVerseFrom! +
                              1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: _godsWordPreview == null
                  ? []
                  : <Widget>[
                      Text(
                        _godsWordPreview!.title.value,
                        style: textTheme.headline6,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          _godsWordPreview!.content.value,
                          style: a2hText,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: save,
                        child: Text(strings.save),
                      )
                    ],
            ),
          )
        ],
      ),
    );
  }
}
