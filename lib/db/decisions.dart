/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:flutter/foundation.dart';
import 'package:moor/moor.dart';

import 'database.dart';

part 'decisions.g.dart';

class Decisions extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text()();

  TextColumn get content => text().named("text").clientDefault(() => "")();

  BoolColumn get archived => boolean()();

  DateTimeColumn get created => dateTime().withDefault(currentDateAndTime)();
}

class DecisionRatings extends Table {
  DateTimeColumn get date => dateTime()();

  IntColumn get rating => integer()();

  IntColumn get decisionId => integer().customConstraint('REFERENCES decisions(id)')();

  @override
  Set<Column> get primaryKey => {date, decisionId};
}

@immutable
class DecisionWithRating {
  final Decision decision;
  final DecisionRating? rating;

  DecisionWithRating(this.decision, this.rating);
}

@UseDao(tables: [Decisions, DecisionRatings])
class DecisionsDao extends DatabaseAccessor<AppDatabase> with _$DecisionsDaoMixin {
  DecisionsDao(AppDatabase db) : super(db);

  Stream<Decision> getDecisionStream(int id) {
    return (select(decisions)..where((d) => d.id.equals(id))).watchSingle();
  }

  Stream<List<Decision>> getCurrentDecisionsStream() {
    return (select(decisions)
          ..where((d) => d.archived.equals(false))
          ..orderBy([
            (item) => OrderingTerm.desc(item.created),
          ]))
        .watch();
  }

  Stream<List<Decision>> getArchivedDecisionStream() {
    return (select(decisions)
          ..where((d) => d.archived.equals(true))
          ..orderBy([
            (item) => OrderingTerm.desc(item.created),
          ]))
        .watch();
  }

  Future<int> insertDecision(DecisionsCompanion decision) {
    return into(decisions).insert(decision);
  }

  Future<int> updateDecision(Decision decision, DecisionsCompanion newDecision) {
    return (update(decisions)..whereSamePrimaryKey(decision)).write(newDecision);
  }

  Future<int> deleteDecision(Decision decision) {
    return delete(decisions).delete(decision);
  }

  Future<int> deleteDecisions(List<Decision> items) {
    return (delete(decisions)..where((item) => item.id.isIn(items.map((e) => e.id)))).go();
  }

  Stream<List<DecisionWithRating>> getCurrentDecisionsWithRatingsForDateStream(DateTime date) {
    final joined = select(decisions).join([
      leftOuterJoin(
          decisionRatings, decisionRatings.decisionId.equalsExp(decisions.id) & decisionRatings.date.equals(date)),
    ]);
    return (joined
          ..where(decisions.archived.equals(false))
          ..orderBy([
            OrderingTerm.desc(decisions.created),
          ]))
        .map((result) => DecisionWithRating(result.readTable(decisions), result.readTableOrNull(decisionRatings)))
        .watch();
  }

  Future<void> setDecisionRating(DecisionRatingsCompanion decisionRating) async {
    return into(decisionRatings).insert(decisionRating, mode: InsertMode.insertOrReplace).then((value) => {});
  }

  Stream<List<DecisionRating>> getDecisionRatingsForDateRangeStream(int decisionId, DateTime from, DateTime to) {
    return (select(decisionRatings)
          ..where((rating) => rating.decisionId.equals(decisionId) & rating.date.isBetweenValues(from, to)))
        .watch();
  }
}
