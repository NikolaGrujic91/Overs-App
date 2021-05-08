import 'dart:core';
import 'enums.dart';

class Fixture {
  //#region Fields

  String _homeTeam;
  String _awayTeam;
  int _homeScore;
  int _awayScore;
  DateTime _date;
  double _overOdd;
  bool _finished;
  League _league;
  String _leagueName;

  //#endregion

  //#region Constructors

  Fixture({String homeTeam, String awayTeam, int homeScore, int awayScore, DateTime date, String league, double overOdd, bool finished}) {
    _homeTeam = homeTeam;
    _awayTeam = awayTeam;
    _homeScore = homeScore;
    _awayScore = awayScore;
    _date = date;
    _league = stringToLeagueEnum(league);
    _leagueName = _getLeagueName(_league);
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
  League get league => _league;
  String get leagueName => _leagueName;

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

  String _getLeagueName(League league) {
    switch(league) {
      case League.England1:
        return 'Premier League';
      case League.England2:
        return 'Championship';
      case League.Scotland1:
        return 'Premiership';
      case League.Germany1:
        return 'Bundesliga';
      case League.Germany2:
        return '2. Bundesliga';
      case League.Italy1:
        return 'Serie A';
      case League.Italy2:
        return 'Serie B';
      case League.Spain1:
        return 'LaLiga';
      case League.France1:
        return 'Ligue 1';
      case League.France2:
        return 'Ligue 2';
      case League.Netherlands1:
        return 'Eredivisie';
      case League.Belgium1:
        return 'Jupiler League';
      case League.Portugal1:
        return 'Primeira Liga';
      case League.Turkey1:
        return 'Super Lig';
      case League.Greece1:
        return 'Super League';
      case League.None:
      default:
        return '';
    }
  }

  //#endregion
}
