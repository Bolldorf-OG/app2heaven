/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moor/moor.dart';

import 'database.dart';

part 'favorites.g.dart';

class Favorites extends Table {
  TextColumn get firestoreRef => text().map(DocumentReferenceConverter())();

  BoolColumn get favorite => boolean().withDefault(Constant(false))();

  @override
  Set<Column> get primaryKey => {firestoreRef};
}

@UseDao(tables: [Favorites])
class FavoritesDao extends DatabaseAccessor<AppDatabase>
    with _$FavoritesDaoMixin {
  FavoritesDao(AppDatabase db) : super(db);

  Stream<List<DocumentReference>> getFavoritesStream() {
    return (select(favorites)..where((tbl) => tbl.favorite.equals(true)))
        .map((result) => result.firestoreRef)
        .watch();
  }

  Stream<bool> isFavoriteStream(DocumentReference reference) {
    return (select(favorites)
          ..addColumns([favorites.favorite])
          ..whereSamePrimaryKey(
              FavoritesCompanion.insert(firestoreRef: reference)))
        .map((result) => result.favorite)
        .watchSingle();
  }

  Future<void> setFavorite(DocumentReference reference, bool favorite) {
    return into(favorites).insert(
      FavoritesCompanion.insert(
          firestoreRef: reference, favorite: Value(favorite)),
      mode: InsertMode.insertOrReplace,
    );
  }
}
