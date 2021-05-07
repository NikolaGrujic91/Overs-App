import 'dart:core';

class Fixture {
  //#region Fields

  String _homeTeam;
  String _awayTeam;
  int _homeScore;
  int _awayScore;
  DateTime _date;
  double _overOdd;
  bool _finished;
  String _league;

  //#endregion

  //#region Constructors

  Fixture({String homeTeam, String awayTeam, int homeScore, int awayScore, DateTime date, String league, double overOdd, bool finished}) {
    _homeTeam = homeTeam;
    _awayTeam = awayTeam;
    _homeScore = homeScore;
    _awayScore = awayScore;
    _date = date;
    _league = league;
    _overOdd = overOdd;
    _finished = finished;
  }

  //#endregion

  //#region Getters

  String get homeTeam => _homeTeam;
  String get awayTeam => _awayTeam;
  int get homeScore => _homeScore;
  int get awayScore => _awayScore;
  DateTime get date => _date;
  double get overOdd => _overOdd;
  bool get finished => _finished;
  String get league => _league;

  //#endregion

  //#region Methods

  String teamsString() {
    return '$_homeTeam - $_awayTeam';
  }

  String timeString() {
    return '${_date.day}.${_date.month}.${_date.year}.';
  }

  @override
  String toString() {
    return _finished
        ? '$_league ${_date.toLocal()} $_homeTeam - $_awayTeam $_homeScore : $_awayScore Over odd: $_overOdd\n'
        : '$_league ${_date.toLocal()} $_homeTeam - $_awayTeam Over odd: $_overOdd\n';
  }

  //#endregion
}
