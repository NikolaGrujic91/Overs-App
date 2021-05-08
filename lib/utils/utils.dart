import 'package:overs_app/data_collector/enums.dart';

League stringToLeagueEnum(String value) {
  if (value == 'E0') {
    return League.England1;
  }

  if (value == 'E1') {
    return League.England2;
  }

  if (value == 'SC0') {
    return League.Scotland1;
  }

  if (value == 'D1') {
    return League.Germany1;
  }

  if (value == 'D2') {
    return League.Germany2;
  }

  if (value == 'I1') {
    return League.Italy1;
  }

  if (value == 'I2') {
    return League.Italy2;
  }

  if (value == 'SP1') {
    return League.Spain1;
  }

  if (value == 'F1') {
    return League.France1;
  }

  if (value == 'F2') {
    return League.France2;
  }

  if (value == 'N1') {
    return League.Netherlands1;
  }

  if (value == 'B1') {
    return League.Belgium1;
  }

  if (value == 'P1') {
    return League.Portugal1;
  }

  if (value == 'T1') {
    return League.Turkey1;
  }

  if (value == 'G1') {
    return League.Greece1;
  }

  return League.None;
}

String leagueToLeagueName(League league) {
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

String leagueToFlagName(League league) {
  switch(league) {
    case League.England1:
      return 'gb-eng.png';
    case League.England2:
      return 'gb-eng.png';
    case League.Scotland1:
      return 'gb-sct.png';
    case League.Germany1:
      return 'de.png';
    case League.Germany2:
      return 'de.png';
    case League.Italy1:
      return 'it.png';
    case League.Italy2:
      return 'it.png';
    case League.Spain1:
      return 'es.png';
    case League.France1:
      return 'fr.png';
    case League.France2:
      return 'fr.png';
    case League.Netherlands1:
      return 'nl.png';
    case League.Belgium1:
      return 'be.png';
    case League.Portugal1:
      return 'pt.png';
    case League.Turkey1:
      return 'tr.png';
    case League.Greece1:
      return 'gr.png';
    case League.None:
    default:
      return '';
  }
}