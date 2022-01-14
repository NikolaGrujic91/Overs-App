// Copyright 2022 Nikola Grujic. All rights reserved.
// Use of this source code is governed by a GNU-style license that can be
// found in the LICENSE file.

import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:overs_app/data_collector/collector.dart';
import 'package:overs_app/data_collector/enums.dart';
import 'package:overs_app/data_collector/fixture.dart';

import 'package:overs_app/overs_detector/candidate.dart';

/// Class for detecting over 2.5 goals candidate fixtures
class OversDetector extends ChangeNotifier {
  /// Creates new instance
  OversDetector();

  /// List of fixtures that fulfill over 2.5 goals requirements.
  List<Candidate> candidates = [];

  /// List of fixtures to be played
  List<Fixture> fixtures = [];

  /// Results of previously finished fixtures per league
  LinkedHashMap<League, List<Fixture>> results =
      LinkedHashMap<League, List<Fixture>>();

  /// Execute algorithm for finding fixtures that
  /// fulfill over 2.5 goals requirements.
  ///
  /// Usage:
  ///
  /// ```
  /// var oversDetector = OversDetector();
  /// await oversDetector.run().then((value)
  ///   => print(oversDetector.candidates));
  /// ```
  ///
  Future<void> run() async {
    final collector = Collector();
    await collector
        .collect()
        .then((value) => _processCollectResponse(collector))
        .then((value) => _run());
  }

  void _processCollectResponse(Collector collector) {
    fixtures = collector.fixtures;
    results = collector.results;
  }

  /// Algorithm
  ///
  /// Home team
  ///
  /// 1. The home team MUST have had 7 goals or MORE in their last 3 home games.
  ///
  /// 2. 2 or all 3 of the 3 previous games must have ended over 2.5.
  ///
  /// Away Team
  ///
  /// 1. The away team MUST have had 7 goals or MORE in their last 3 away games.
  ///
  /// 2. The PREVIOUS game... must have had 2 or more goals in total
  /// for the entire game.
  ///
  /// 3. The away team MUST have scored in 2 or 3 of the last 3 games.
  ///
  /// 4. 2 or 3 of the 3 previous games must have ended over 2.5.
  void _run() {
    for (final fixture in fixtures) {
      if (!_checkOverOdd(fixture.overOdd)) {
        continue;
      }

      final homeTeamPreviousFixtures =
          _getHomeTeamResults(fixture.homeTeam, fixture.league);

      if (_numberOfGoals(homeTeamPreviousFixtures) < 7) {
        continue;
      }

      if (_numberOfOverFixtures(homeTeamPreviousFixtures) < 2) {
        continue;
      }

      final awayTeamPreviousFixtures =
          _getAwayTeamResults(fixture.awayTeam, fixture.league);

      if (_numberOfGoals(awayTeamPreviousFixtures) < 7) {
        continue;
      }

      if (_numberOfGoals(<Fixture>[awayTeamPreviousFixtures[0]]) < 2) {
        continue;
      }

      if (_teamScored(awayTeamPreviousFixtures) < 2) {
        continue;
      }

      if (_numberOfOverFixtures(awayTeamPreviousFixtures) < 2) {
        continue;
      }

      final candidate = Candidate(
        candidateFixture: fixture,
        homeTeamPreviousFixtures: homeTeamPreviousFixtures,
        awayTeamPreviousFixtures: awayTeamPreviousFixtures,
      );
      candidates.add(candidate);
    }

    candidates.sort(
      (c1, c2) => c1.candidateFixture.date.compareTo(c2.candidateFixture.date),
    );
    notifyListeners();
  }

  int _teamScored(List<Fixture> awayTeamPreviousFixtures) {
    var scored = 0;

    for (final fixture in awayTeamPreviousFixtures) {
      if (fixture.awayScore! > 0) {
        scored++;
      }
    }

    return scored;
  }

  bool _checkOverOdd(double fixtureOverOdd) {
    return 1.60 <= fixtureOverOdd && fixtureOverOdd <= 2.20;
  }

  int _numberOfGoals(List<Fixture> previousFixtures) {
    var totalGoals = 0;

    for (final fixture in previousFixtures) {
      totalGoals += fixture.homeScore! + fixture.awayScore!;
    }

    return totalGoals;
  }

  int _numberOfOverFixtures(List<Fixture> previousFixtures) {
    var overFixtures = 0;

    for (final fixture in previousFixtures) {
      if ((fixture.homeScore! + fixture.awayScore!) > 2) {
        overFixtures++;
      }
    }

    return overFixtures;
  }

  List<Fixture> _getHomeTeamResults(String teamName, League league) {
    final recentResults = <Fixture>[];

    if (!results.containsKey(league)) {
      return recentResults;
    }

    final resultsForLeague = results[league] ?? [];
    var recentCount = 3;

    for (final resultForLeague in resultsForLeague) {
      if (resultForLeague.homeTeam == teamName) {
        recentResults.add(resultForLeague);
        recentCount--;

        if (recentCount == 0) {
          break;
        }
      }
    }

    return recentResults;
  }

  List<Fixture> _getAwayTeamResults(String teamName, League league) {
    final recentResults = <Fixture>[];

    if (!results.containsKey(league)) {
      return recentResults;
    }

    final resultsForLeague = results[league] ?? [];
    var recentCount = 3;

    for (final resultForLeague in resultsForLeague) {
      if (resultForLeague.awayTeam == teamName) {
        recentResults.add(resultForLeague);
        recentCount--;

        if (recentCount == 0) {
          break;
        }
      }
    }

    return recentResults;
  }
}
