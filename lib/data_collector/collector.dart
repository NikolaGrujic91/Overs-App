// Copyright 2022 Nikola Grujic. All rights reserved.
// Use of this source code is governed by a GNU-style license that can be
// found in the LICENSE file.

import 'dart:collection';
import 'dart:convert';
import 'dart:core';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:overs_app/data_collector/constants.dart';
import 'package:overs_app/data_collector/enums.dart';
import 'package:overs_app/data_collector/fixture.dart';
import 'package:overs_app/data_collector/links.dart';
import 'package:overs_app/utils/utils.dart';

/// Class for collecting data
class Collector {
  /// Creates new instance
  Collector();

  /// List of fixtures
  List<Fixture> fixtures = [];

  /// Results per league
  LinkedHashMap<League, List<Fixture>> results =
      LinkedHashMap<League, List<Fixture>>();

  final int _fractionDigits = 2;

  int _dateIndex = -1;
  int _homeTeamIndex = -1;
  int _awayTeamIndex = -1;
  int _homeScoreIndex = -1;
  int _awayScoreIndex = -1;
  int _leagueIndex = -1;
  int _overOddIndex = -1;

  /// Download fixtures and results and store them in memory.
  ///
  /// Usage:
  ///
  /// ```
  /// var collector = Collector();
  /// await collector.collect().then((value) =>
  ///                                       _processCollectResponse(collector));
  /// ```
  ///
  Future<void> collect() async {
    await _download(uri: kFixtures, storeCallback: _storeFixtures);

    await _download(uri: kEngland1, storeCallback: _storeResults);
    await _download(uri: kEngland2, storeCallback: _storeResults);
    await _download(uri: kScotland1, storeCallback: _storeResults);
    await _download(uri: kGermany1, storeCallback: _storeResults);
    await _download(uri: kGermany2, storeCallback: _storeResults);
    await _download(uri: kItaly1, storeCallback: _storeResults);
    await _download(uri: kItaly2, storeCallback: _storeResults);
    await _download(uri: kSpain1, storeCallback: _storeResults);
    await _download(uri: kFrance1, storeCallback: _storeResults);
    await _download(uri: kFrance2, storeCallback: _storeResults);
    await _download(uri: kNetherlands1, storeCallback: _storeResults);
    await _download(uri: kBelgium1, storeCallback: _storeResults);
    await _download(uri: kPortugal1, storeCallback: _storeResults);
    await _download(uri: kTurkey1, storeCallback: _storeResults);
    await _download(uri: kGreece1, storeCallback: _storeResults);
  }

  Future<void> _download({
    required String uri,
    required Function(String responseBody) storeCallback,
  }) async {
    final url = Uri.parse(uri);
    final response = await http.get(url);

    if (response.statusCode == kStatusOK) {
      storeCallback(response.body);
    } else {
      debugPrint(response.statusCode.toString());
    }
  }

  void _storeFixtures(String responseBody) {
    const lineSplitter = LineSplitter();
    final lines = lineSplitter.convert(responseBody);

    final headerLine = lines[0];
    final headerValues = headerLine.split(',');

    _dateIndex = _findColumnIndex(headerValues, kDateColumnName);
    _homeTeamIndex = _findColumnIndex(headerValues, kHomeTeamColumnName);
    _awayTeamIndex = _findColumnIndex(headerValues, kAwayTeamColumnName);
    _leagueIndex = _findColumnIndex(headerValues, kLeagueName);
    _overOddIndex = _findColumnIndex(headerValues, kOverOddColumnName);

    for (var i = 1; i <= lines.length - 1; i++) {
      final values = lines[i].split(',');

      if (_isEmptyLine(values)) {
        continue;
      }

      final date = _createDate(values[_dateIndex]);
      final overOdd = values[_overOddIndex] == ''
          ? 0.0
          : double.parse(values[_overOddIndex]);

      final league = stringToLeagueEnum(values[_leagueIndex]);

      final fixture = Fixture(
        homeTeam: values[_homeTeamIndex],
        awayTeam: values[_awayTeamIndex],
        date: date,
        league: league,
        leagueName: leagueToLeagueName(league),
        overOdd: overOdd,
        overOddString: overOdd.toStringAsFixed(_fractionDigits),
        finished: false,
      );

      fixtures.add(fixture);
    }
  }

  void _storeResults(String responseBody) {
    const lineSplitter = LineSplitter();
    final lines = lineSplitter.convert(responseBody);

    final headerLine = lines[0];
    final headerValues = headerLine.split(',');

    _dateIndex = _findColumnIndex(headerValues, kDateColumnName);
    _homeTeamIndex = _findColumnIndex(headerValues, kHomeTeamColumnName);
    _awayTeamIndex = _findColumnIndex(headerValues, kAwayTeamColumnName);
    _homeScoreIndex = _findColumnIndex(headerValues, kHomeScoreColumnName);
    _awayScoreIndex = _findColumnIndex(headerValues, kAwayScoreColumnName);
    _leagueIndex = _findColumnIndex(headerValues, kLeagueName);
    _overOddIndex = _findColumnIndex(headerValues, kOverOddColumnName);

    for (var i = 1; i <= lines.length - 1; i++) {
      final values = lines[i].split(',');

      if (_isEmptyLine(values)) {
        continue;
      }

      final date = _createDate(values[_dateIndex]);

      final overOdd = values[_overOddIndex] == ''
          ? 0.0
          : double.parse(values[_overOddIndex]);

      final league = stringToLeagueEnum(values[_leagueIndex]);

      final fixture = Fixture(
        homeTeam: values[_homeTeamIndex],
        awayTeam: values[_awayTeamIndex],
        homeScore: int.parse(values[_homeScoreIndex]),
        awayScore: int.parse(values[_awayScoreIndex]),
        date: date,
        league: league,
        leagueName: leagueToLeagueName(league),
        overOdd: overOdd,
        overOddString: overOdd.toStringAsFixed(_fractionDigits),
        finished: true,
      );

      if (results.containsKey(fixture.league)) {
        final fixturesCopy = results[fixture.league] as List<Fixture>
          ..add(fixture);
        results[fixture.league] = fixturesCopy;
      } else {
        results[fixture.league] = [fixture];
      }
    }
  }

  int _findColumnIndex(List<String> values, String columnName) {
    final length = values.length;

    for (var i = 0; i < length; i++) {
      if (values[i] == columnName) {
        return i;
      }
    }

    return -1;
  }

  bool _isEmptyLine(List<String> values) {
    if (values.isEmpty) {
      return true;
    }

    if (values[_dateIndex] == '' ||
        values[_homeTeamIndex] == '' ||
        values[_awayTeamIndex] == '' ||
        values[_leagueIndex] == '') {
      return true;
    }

    return false;
  }

  DateTime _createDate(String value) {
    const dayIndex = 0;
    const monthIndex = 1;
    const yearIndex = 2;

    final values = value.split('/');

    return DateTime(
      int.parse(values[yearIndex]),
      int.parse(values[monthIndex]),
      int.parse(values[dayIndex]),
    );
  }
}
