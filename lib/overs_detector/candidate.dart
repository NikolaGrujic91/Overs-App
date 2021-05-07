import 'dart:collection';
import 'package:overs_app/data_collector/fixture.dart';

class Candidate {
  //#region Fields

  Fixture _candidateFixture;
  List<Fixture> _homeTeamPreviousFixtures;
  List<Fixture> _awayTeamPreviousFixtures;

  //#endregion

  //#region Constructors

  Candidate({Fixture candidateFixture, List<Fixture> homeTeamPreviousFixtures, List<Fixture> awayTeamPreviousFixtures}) {
    _candidateFixture = candidateFixture;
    _homeTeamPreviousFixtures = homeTeamPreviousFixtures;
    _awayTeamPreviousFixtures = awayTeamPreviousFixtures;
  }

  //#endregion

  //#region Getters

  Fixture get candidateFixture => _candidateFixture;
  UnmodifiableListView<Fixture> get homeTeamPreviousFixtures => _homeTeamPreviousFixtures;
  UnmodifiableListView<Fixture> get awayTeamPreviousFixtures => _awayTeamPreviousFixtures;

  //#endregion

  //#region Methods

  String toShortString() {
    return _candidateFixture.toString();
  }

  @override
  String toString() {
    var stringBuffer = StringBuffer();

    stringBuffer.writeln(_candidateFixture.toString());

    stringBuffer.writeln('Home team recent results:');
    for (var fixture in _homeTeamPreviousFixtures) {
      stringBuffer.writeln(fixture.toString());
    }

    stringBuffer.writeln('Away team recent results:');
    for (var fixture in _awayTeamPreviousFixtures) {
      stringBuffer.writeln(fixture.toString());
    }

    stringBuffer.writeln();
    return stringBuffer.toString();
  }

  //#endregion
}
