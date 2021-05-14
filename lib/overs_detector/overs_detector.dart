import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:overs_app/data_collector/enums.dart';
import 'package:overs_app/data_collector/fixture.dart';
import 'package:overs_app/data_collector/collector.dart';
import 'candidate.dart';

class OversDetector extends ChangeNotifier {
  //#region Fields

  List<Candidate> _candidates;
  List<Fixture> _fixtures;
  LinkedHashMap<League, List<Fixture>> _results;

  //#endregion

  //#region Constructors

  OversDetector() {
    _candidates = <Candidate>[];
    _fixtures = <Fixture>[];
    _results = LinkedHashMap<League, List<Fixture>>();
  }

  //#endregion

  //#region Getters

  /// List of fixtures that fulfill over 2.5 goals requirements.
  UnmodifiableListView<Candidate> get candidates => UnmodifiableListView(_candidates);

  UnmodifiableListView<Fixture> get fixtures => UnmodifiableListView(_fixtures);

  //#endregion

  //#region Methods

  /// Execute algorithm for finding fixtures that fulfill over 2.5 goals requirements.
  ///
  /// Usage:
  ///
  /// ```
  /// var oversDetector = OversDetector();
  /// await oversDetector.run().then((value) => print(oversDetector.candidates));
  /// ```
  ///
  Future<void> run() async {
    var collector = Collector();
    await collector.collect().then((value) => _processCollectResponse(collector)).then((value) => _run());
  }

  void _processCollectResponse(Collector collector) {
    _fixtures = collector.fixtures;
    _results = collector.results;
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
  /// 2. The PREVIOUS game... must have had 2 or more goals in total for the entire game.
  ///
  /// 3. The away team MUST have scored in 2 or 3 of the last 3 games.
  ///
  /// 4. 2 or 3 of the 3 previous games must have ended over 2.5.
  void _run() {
    for (Fixture fixture in _fixtures) {
      if (!_checkOverOdd(fixture.overOdd)) {
        continue;
      }

      List<Fixture> homeTeamPreviousFixtures = _getHomeTeamResults(fixture.homeTeam, fixture.league);

      if (_numberOfGoals(homeTeamPreviousFixtures) < 7) {
        continue;
      }

      if (_numberOfOverFixtures(homeTeamPreviousFixtures) < 2) {
        continue;
      }

      List<Fixture> awayTeamPreviousFixtures = _getAwayTeamResults(fixture.awayTeam, fixture.league);

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

      var candidate = Candidate(candidateFixture: fixture, homeTeamPreviousFixtures: homeTeamPreviousFixtures, awayTeamPreviousFixtures: awayTeamPreviousFixtures);
      _candidates.add(candidate);
    }

    _candidates.sort((c1, c2) => c1.candidateFixture.date.compareTo(c2.candidateFixture.date));
    notifyListeners();
  }

  int _teamScored(List<Fixture> awayTeamPreviousFixtures) {
    int scored = 0;

    for (Fixture fixture in awayTeamPreviousFixtures) {
      if (fixture.awayScore > 0) {
        scored++;
      }
    }

    return scored;
  }

  bool _checkOverOdd(double fixtureOverOdd) {
    return 1.60 <= fixtureOverOdd && fixtureOverOdd <= 2.20;
  }

  int _numberOfGoals(List<Fixture> previousFixtures) {
    int totalGoals = 0;

    for (Fixture fixture in previousFixtures) {
      totalGoals += fixture.homeScore + fixture.awayScore;
    }

    return totalGoals;
  }

  int _numberOfOverFixtures(List<Fixture> previousFixtures) {
    int overFixtures = 0;

    for (Fixture fixture in previousFixtures) {
      if ((fixture.homeScore + fixture.awayScore) > 2) {
        overFixtures++;
      }
    }

    return overFixtures;
  }

  List<Fixture> _getHomeTeamResults(String teamName, League league) {
    var recentResults = <Fixture>[];

    if (_results.containsKey(league)) {
      List<Fixture> results = _results[league];

      int recentCount = 3;
      int count = results.length;

      for (int i = count - 1; i >= 0; i--) {
        if (results[i].homeTeam == teamName) {
          recentResults.add(results[i]);
          recentCount--;

          if (recentCount == 0) {
            break;
          }
        }
      }
    }

    return recentResults;
  }

  List<Fixture> _getAwayTeamResults(String teamName, League league) {
    var recentResults = <Fixture>[];

    if (_results.containsKey(league)) {
      List<Fixture> results = _results[league];

      int recentCount = 3;
      int count = results.length;

      for (int i = count - 1; i >= 0; i--) {
        if (results[i].awayTeam == teamName) {
          recentResults.add(results[i]);
          recentCount--;

          if (recentCount == 0) {
            break;
          }
        }
      }
    }

    return recentResults;
  }

  //#endregion
}
