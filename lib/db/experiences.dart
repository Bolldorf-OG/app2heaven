/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:moor/moor.dart';

import 'database.dart';

part 'experiences.g.dart';

class Experiences extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text()();

  TextColumn get content => text().clientDefault(() => "")();

  TextColumn get editKey => text().nullable()();

  TextColumn get shareId => text().nullable()();

  TextColumn get shareLink => text().nullable()();

  DateTimeColumn get created => dateTime().withDefault(currentDateAndTime)();
}

@UseDao(tables: [Experiences])
class ExperiencesDao extends DatabaseAccessor<AppDatabase>
    with _$ExperiencesDaoMixin {
  ExperiencesDao(AppDatabase db) : super(db);

  Stream<Experience> getExperienceStream(int id) {
    return (select(experiences)..where((d) => d.id.equals(id))).watchSingle();
  }

  Stream<List<Experience>> getAllExperiencesStream() {
    return (select(experiences)
          ..orderBy([
            (item) => OrderingTerm.desc(item.created),
          ]))
        .watch();
  }

  Future<int> insertExperience(ExperiencesCompanion experience) {
    return into(experiences).insert(experience);
  }

  Future<int> updateExperience(
      Experience experience, ExperiencesCompanion newExperience) {
    return (update(experiences)..whereSamePrimaryKey(experience))
        .write(newExperience);
  }

  Future<int> deleteExperience(Experience experience) {
    return delete(experiences).delete(experience);
  }

  Future<int> deleteExperiences(List<Experience> items) {
    return (delete(experiences)
          ..where((item) => item.id.isIn(items.map((e) => e.id))))
        .go();
  }

  Future<int?> getIdForShareId(String shareId) {
    return (selectOnly(experiences)
          ..addColumns([experiences.id])
          ..where(experiences.shareId.equals(shareId))
          ..limit(1))
        .map((result) => result.read(experiences.id))
        .getSingle();
  }
}
