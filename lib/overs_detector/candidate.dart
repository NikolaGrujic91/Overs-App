// Copyright 2022 Nikola Grujic. All rights reserved.
// Use of this source code is governed by a GNU-style license that can be
// found in the LICENSE file.

import 'package:overs_app/data_collector/fixture.dart';

/// Class represents a potential candidate fixture
class Candidate {
  /// Create new instance
  Candidate({
    required this.candidateFixture,
    required this.homeTeamPreviousFixtures,
    required this.awayTeamPreviousFixtures,
  });

  /// Candidate fixture
  Fixture candidateFixture;

  /// Previous 3 fixtures of home team at home
  List<Fixture> homeTeamPreviousFixtures;

  /// Previous 3 fixtures of away team at guest
  List<Fixture> awayTeamPreviousFixtures;

  /// Return history
  String historyString() {
    final stringBuffer = StringBuffer()
      ..writeln('Home team recent results at home:');

    for (final fixture in homeTeamPreviousFixtures) {
      stringBuffer.writeln(
        '${fixture.teamsString()} '
        '${fixture.homeScore} : ${fixture.awayScore}',
      );
    }

    stringBuffer.writeln('\nAway team recent results as guest:');

    for (final fixture in awayTeamPreviousFixtures) {
      stringBuffer.writeln(
        '${fixture.teamsString()} '
        '${fixture.homeScore} : ${fixture.awayScore}',
      );
    }

    stringBuffer.writeln('\n');

    return stringBuffer.toString();
  }

  @override
  String toString() {
    final stringBuffer = StringBuffer()
      ..writeln(candidateFixture.toString())
      ..writeln('Home team recent results:');

    for (final fixture in homeTeamPreviousFixtures) {
      stringBuffer.writeln(fixture.toString());
    }

    stringBuffer.writeln('Away team recent results:');

    for (final fixture in awayTeamPreviousFixtures) {
      stringBuffer.writeln(fixture.toString());
    }

    stringBuffer.writeln('\n');

    return stringBuffer.toString();
  }
}
