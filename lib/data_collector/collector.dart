import 'package:http/http.dart' as http;
import 'dart:core';
import 'dart:collection';
import 'dart:convert';
import 'fixture.dart';
import 'links.dart';
import 'constants.dart';
import 'enums.dart';

class Collector {
  //#region Fields

  List _fixtures;
  LinkedHashMap _results;

  //#endregion

  //#region Constructors

  Collector() {
    _fixtures = <Fixture>[];
    _results = LinkedHashMap<League, List<Fixture>>();
  }

  //#endregion

  //#region Getters

  List<Fixture> get fixtures => _fixtures;

  LinkedHashMap<League, List<Fixture>> get results => _results;

  //#endregion

  //#region Methods

  /// Download fixtures and results and store them in memory.
  ///
  /// Usage:
  ///
  /// ```
  /// var collector = Collector();
  /// await collector.collect().then((value) => _processCollectResponse(collector));
  /// ```
  ///
  Future<void> collect() async {
    await _download(uri: Links.Fixtures, storeCallback: _storeFixtures);

    await _download(uri: Links.England1, storeCallback: _storeResults);
    await _download(uri: Links.England2, storeCallback: _storeResults);
    await _download(uri: Links.Scotland1, storeCallback: _storeResults);
    await _download(uri: Links.Germany1, storeCallback: _storeResults);
    await _download(uri: Links.Germany2, storeCallback: _storeResults);
    await _download(uri: Links.Italy1, storeCallback: _storeResults);
    await _download(uri: Links.Italy2, storeCallback: _storeResults);
    await _download(uri: Links.Spain1, storeCallback: _storeResults);
    await _download(uri: Links.France1, storeCallback: _storeResults);
    await _download(uri: Links.France2, storeCallback: _storeResults);
    await _download(uri: Links.Netherlands1, storeCallback: _storeResults);
    await _download(uri: Links.Belgium1, storeCallback: _storeResults);
    await _download(uri: Links.Portugal1, storeCallback: _storeResults);
    await _download(uri: Links.Turkey1, storeCallback: _storeResults);
    await _download(uri: Links.Greece1, storeCallback: _storeResults);
  }

  Future<void> _download({String uri, Function storeCallback}) async {
    var url = Uri.parse(uri);
    http.Response response = await http.get(url);

    if (response.statusCode == Constants.StatusOK) {
      storeCallback(response.body);
    } else {
      print(response.statusCode);
    }
  }

  void _storeFixtures(String responseBody) {
    var lineSplitter = LineSplitter();
    List<String> lines = lineSplitter.convert(responseBody);

    String headerLine = lines[0];
    List<String> headerValues = headerLine.split(',');

    int dateIndex = _findColumnIndex(headerValues, Constants.DateColumnName);
    int homeTeamIndex = _findColumnIndex(headerValues, Constants.HomeTeamColumnName);
    int awayTeamIndex = _findColumnIndex(headerValues, Constants.AwayTeamColumnName);
    int leagueIndex = _findColumnIndex(headerValues, Constants.LeagueName);
    int overOddIndex = _findColumnIndex(headerValues, Constants.OverOddColumnName);

    int length = lines.length - 1;
    for (int i = 1; i <= length; i++) {
      List<String> values = lines[i].split(',');

      DateTime date = _createDate(values[dateIndex]);
      double overOdd = values[overOddIndex] == '' ? 0.0 : double.parse(values[overOddIndex]);

      var fixture = Fixture(homeTeam: values[homeTeamIndex],
                            awayTeam: values[awayTeamIndex],
                            date: date,
                            league: values[leagueIndex],
                            overOdd: overOdd,
                            finished: false);

      _fixtures.add(fixture);
    }
  }

  void _storeResults(String responseBody) {
    var lineSplitter = LineSplitter();
    List<String> lines = lineSplitter.convert(responseBody);

    String headerLine = lines[0];
    List<String> headerValues = headerLine.split(',');

    int dateIndex = _findColumnIndex(headerValues, Constants.DateColumnName);
    int homeTeamIndex = _findColumnIndex(headerValues, Constants.HomeTeamColumnName);
    int awayTeamIndex = _findColumnIndex(headerValues, Constants.AwayTeamColumnName);
    int homeScoreIndex = _findColumnIndex(headerValues, Constants.HomeScoreColumnName);
    int awayScoreIndex = _findColumnIndex(headerValues, Constants.AwayScoreColumnName);
    int leagueIndex = _findColumnIndex(headerValues, Constants.LeagueName);
    int overOddIndex = _findColumnIndex(headerValues, Constants.OverOddColumnName);

    int length = lines.length - 1;
    for (int i = 1; i <= length; i++) {
      List<String> values = lines[i].split(',');

      DateTime date = _createDate(values[dateIndex]);

      double overOdd = values[overOddIndex] == '' ? 0.0 : double.parse(values[overOddIndex]);

      var fixture = Fixture(homeTeam: values[homeTeamIndex],
                            awayTeam: values[awayTeamIndex],
                            homeScore: int.parse(values[homeScoreIndex]),
                            awayScore: int.parse(values[awayScoreIndex]),
                            date: date,
                            league: values[leagueIndex],
                            overOdd: overOdd,
                            finished: true);

      if (_results.containsKey(fixture.league)) {
        List<Fixture> fixtures = _results[fixture.league];
        fixtures.add(fixture);
        _results[fixture.league] = fixtures;
      } else {
        _results[fixture.league] = [fixture];
      }
    }
  }

  int _findColumnIndex(List<String> values, String columnName) {
    int length = values.length;

    for (int i = 0; i < length; i++) {
      if (values[i] == columnName) {
        return i;
      }
    }

    return -1;
  }

  DateTime _createDate(String value) {
    const int dayIndex = 0;
    const int monthIndex = 1;
    const int yearIndex = 2;

    List<String> values = value.split('/');

    return DateTime(int.parse(values[yearIndex]), int.parse(values[monthIndex]), int.parse(values[dayIndex]));
  }

  //#endregion
}
