// Copyright 2022 Nikola Grujic. All rights reserved.
// Use of this source code is governed by a GNU-style license that can be
// found in the LICENSE file.

import 'package:overs/data_collector/enums.dart';

/// Convert string to league enum
League stringToLeagueEnum(String value) {
  if (value == 'E0') {
    return League.england1;
  }

  if (value == 'E1') {
    return League.england2;
  }

  if (value == 'SC0') {
    return League.scotland1;
  }

  if (value == 'D1') {
    return League.germany1;
  }

  if (value == 'D2') {
    return League.germany2;
  }

  if (value == 'I1') {
    return League.italy1;
  }

  if (value == 'I2') {
    return League.italy2;
  }

  if (value == 'SP1') {
    return League.spain1;
  }

  if (value == 'F1') {
    return League.france1;
  }

  if (value == 'F2') {
    return League.france2;
  }

  if (value == 'N1') {
    return League.netherlands1;
  }

  if (value == 'B1') {
    return League.belgium1;
  }

  if (value == 'P1') {
    return League.portugal1;
  }

  if (value == 'T1') {
    return League.turkey1;
  }

  if (value == 'G1') {
    return League.greece1;
  }

  return League.none;
}

/// Convert league enum to league name
String leagueToLeagueName(League league) {
  switch (league) {
    case League.england1:
      return 'Premier League';
    case League.england2:
      return 'Championship';
    case League.scotland1:
      return 'Premiership';
    case League.germany1:
      return 'Bundesliga';
    case League.germany2:
      return '2. Bundesliga';
    case League.italy1:
      return 'Serie A';
    case League.italy2:
      return 'Serie B';
    case League.spain1:
      return 'LaLiga';
    case League.france1:
      return 'Ligue 1';
    case League.france2:
      return 'Ligue 2';
    case League.netherlands1:
      return 'Eredivisie';
    case League.belgium1:
      return 'Jupiler League';
    case League.portugal1:
      return 'Primeira Liga';
    case League.turkey1:
      return 'Super Lig';
    case League.greece1:
      return 'Super League';
    case League.none:
      return '';
  }
}

/// Convert league enum to flag name
String leagueToFlagName(League league) {
  switch (league) {
    case League.england1:
      return 'gb-eng.png';
    case League.england2:
      return 'gb-eng.png';
    case League.scotland1:
      return 'gb-sct.png';
    case League.germany1:
      return 'de.png';
    case League.germany2:
      return 'de.png';
    case League.italy1:
      return 'it.png';
    case League.italy2:
      return 'it.png';
    case League.spain1:
      return 'es.png';
    case League.france1:
      return 'fr.png';
    case League.france2:
      return 'fr.png';
    case League.netherlands1:
      return 'nl.png';
    case League.belgium1:
      return 'be.png';
    case League.portugal1:
      return 'pt.png';
    case League.turkey1:
      return 'tr.png';
    case League.greece1:
      return 'gr.png';
    case League.none:
      return '';
  }
}
