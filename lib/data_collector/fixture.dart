// Copyright 2022 Nikola Grujic. All rights reserved.
// Use of this source code is governed by a GNU-style license that can be
// found in the LICENSE file.

import 'dart:core';
import 'package:overs_app/data_collector/enums.dart';
import 'package:overs_app/utils/utils.dart';

/// Class represents a single fixture between two teams
class Fixture {
  /// Create new instance
  Fixture({
    required this.homeTeam,
    required this.awayTeam,
    this.homeScore,
    this.awayScore,
    required this.date,
    required this.league,
    required this.leagueName,
    required this.overOdd,
    required this.overOddString,
    required this.finished,
  });

  /// Creates instance for upcoming fixture
  factory Fixture.upcoming({
    required String homeTeam,
    required String awayTeam,
    required DateTime date,
    required League league,
    required double overOdd,
  }) =>
      Fixture(
        homeTeam: homeTeam,
        awayTeam: awayTeam,
        date: date,
        league: league,
        leagueName: leagueToLeagueName(league),
        overOdd: overOdd,
        overOddString: overOdd.toStringAsFixed(2),
        finished: false,
      );

  /// Creates instance for a fixture that has already finished
  factory Fixture.result({
    required String homeTeam,
    required String awayTeam,
    required int homeScore,
    required int awayScore,
    required DateTime date,
    required League league,
    required double overOdd,
  }) =>
      Fixture(
        homeTeam: homeTeam,
        awayTeam: awayTeam,
        homeScore: homeScore,
        awayScore: awayScore,
        date: date,
        league: league,
        leagueName: leagueToLeagueName(league),
        overOdd: overOdd,
        overOddString: overOdd.toStringAsFixed(2),
        finished: true,
      );

  /// Home team name
  String homeTeam;

  /// Away team name
  String awayTeam;

  /// Home team score
  int? homeScore;

  /// Away team score
  int? awayScore;

  /// Fixture date
  DateTime date;

  /// Over >2.5 goals odd
  double overOdd;

  /// Over >2.5 goals odd (string)
  String overOddString;

  /// Indicator if fixture is already finished
  bool finished;

  /// League enum
  League league;

  /// League name
  String leagueName;

  /// Returns string in format Home Team - Away Team
  String teamsString() {
    return '$homeTeam - $awayTeam';
  }

  /// Returns fixture date
  String timeString() {
    return '${date.day}.${date.month}.${date.year}.';
  }

  @override
  String toString() {
    return finished
        ? '$league ${date.toLocal()} $homeTeam - $awayTeam '
            '$homeScore : $awayScore Over odd: $overOdd\n'
        : '$league ${date.toLocal()} $homeTeam - $awayTeam '
            'Over odd: $overOdd\n';
  }
}
