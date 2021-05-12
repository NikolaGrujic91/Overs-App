import 'package:overs_app/data_collector/enums.dart';
import 'package:overs_app/overs_detector/candidate.dart';

String leagueToHashtag(League league) {
  switch (league) {
    case League.England1:
      return '#PL';
    case League.England2:
      return '#EFL';
    case League.Scotland1:
      return '#SPFL';
    case League.Germany1:
      return '#Bundesliga';
    case League.Germany2:
      return '#Bundesliga2';
    case League.Italy1:
      return '#SerieA';
    case League.Italy2:
      return '#SerieB';
    case League.Spain1:
      return '#LaLigaSantander';
    case League.France1:
      return '#Ligue1';
    case League.France2:
      return '#Ligue2';
    case League.Netherlands1:
      return '#Eredivisie';
    case League.Belgium1:
      return '#jupilerproleague';
    case League.Portugal1:
      return '#PrimeiraLiga';
    case League.Turkey1:
      return '#SuperLig';
    case League.Greece1:
      return '#slgr';
    case League.None:
    default:
      return '';
  }
}

String candidateToHashtag(Candidate candidate) {
  switch (candidate.candidateFixture.league) {
    case League.England1:
      return '#${_teamHashtagEngland1(candidate.candidateFixture.homeTeam)}${_teamHashtagEngland1(candidate.candidateFixture.awayTeam)}';
    case League.England2:
      return '';
    case League.Scotland1:
      return '';
    case League.Germany1:
      return '#${_teamHashtagGermany1(candidate.candidateFixture.homeTeam)}${_teamHashtagGermany1(candidate.candidateFixture.awayTeam)}';
    case League.Germany2:
      return '';
    case League.Italy1:
      return '';
    case League.Italy2:
      return '';
    case League.Spain1:
      return '#${_teamHashtagSpain1(candidate.candidateFixture.homeTeam)}${_teamHashtagSpain1(candidate.candidateFixture.awayTeam)}';
    case League.France1:
      return '';
    case League.France2:
      return '';
    case League.Netherlands1:
      return '';
    case League.Belgium1:
      return '';
    case League.Portugal1:
      return '';
    case League.Turkey1:
      return '';
    case League.Greece1:
      return '';
    case League.None:
    default:
      return '';
  }
}

String _teamHashtagEngland1(String teamName) {
  if (teamName == 'Fulham') {
    return 'FUL';
  }
  else if (teamName == 'Arsenal') {
    return 'ARS';
  }
  else if (teamName == 'Crystal Palace') {
    return 'CRY';
  }
  else if (teamName == 'Southampton') {
    return 'SOU';
  }
  else if (teamName == 'Chelsea') {
    return 'CHE';
  }
  else if (teamName == 'Man United') {
    return 'MUN';
  }
  else if (teamName == 'Leicester') {
    return 'LEI';
  }
  else if (teamName == 'Liverpool') {
    return 'LIV';
  }
  else if (teamName == 'Leeds') {
    return 'LEE';
  }
  else if (teamName == 'West Ham') {
    return 'WHU';
  }
  else if (teamName == 'Newcastle') {
    return 'LEI';
  }
  else if (teamName == 'West Brom') {
    return 'WBA';
  }
  else if (teamName == 'Tottenham') {
    return 'TOT';
  }
  else if (teamName == 'Everton') {
    return 'EVE';
  }
  else if (teamName == 'Burnley') {
    return 'BUR';
  }
  else if (teamName == 'Wolves') {
    return 'WOL';
  }
  else if (teamName == 'Brighton') {
    return 'BHA';
  }
  else if (teamName == 'Aston Villa') {
    return 'AVL';
  }
  else if (teamName == 'Sheffield United') {
    return 'SHU';
  }
  else if (teamName == 'Man City') {
    return 'MCI';
  }
  return '';
}

String _teamHashtagGermany1(String teamName) {
  if (teamName == 'Bayern Munich') {
    return 'FCB';
  }
  else if (teamName == 'Schalke 04') {
    return 'S04';
  }
  else if (teamName == 'Ein Frankfurt') {
    return 'SGE';
  }
  else if (teamName == 'Bielefeld') {
    return 'DSC';
  }
  else if (teamName == 'FC Koln') {
    return 'KOE';
  }
  else if (teamName == 'Hoffenheim') {
    return 'TSG';
  }
  else if (teamName == 'Stuttgart') {
    return 'VFB';
  }
  else if (teamName == 'Freiburg') {
    return 'SCF';
  }
  else if (teamName == 'Union Berlin') {
    return 'FCU';
  }
  else if (teamName == 'Augsburg') {
    return 'FCA';
  }
  else if (teamName == 'Werder Bremen') {
    return 'SVW';
  }
  else if (teamName == 'Hertha') {
    return 'BSC';
  }
  else if (teamName == 'Dortmund') {
    return 'BVB';
  }
  else if (teamName == 'M\'gladbach') {
    return 'BMG';
  }
  else if (teamName == 'RB Leipzig') {
    return 'RBL';
  }
  else if (teamName == 'Mainz') {
    return 'M05';
  }
  else if (teamName == 'Wolfsburg') {
    return 'WOB';
  }
  else if (teamName == 'Leverkusen') {
    return 'B04';
  }
  return '';
}

String _teamHashtagSpain1(String teamName) {
  if (teamName == 'Betis') {
    return 'RealBetis';
  }
  else if (teamName == 'Granada') {
    return 'Granada';
  }
  else if (teamName == 'Real Madrid') {
    return 'RealMadrid';
  }
  else if (teamName == 'Sevilla') {
    return 'Sevilla';
  }
  else if (teamName == 'Villarreal') {
    return 'Villarreal';
  }
  else if (teamName == 'Celta') {
    return 'Celta';
  }
  else if (teamName == 'Valladolid') {
    return 'RealValladolid';
  }
  else if (teamName == 'Getafe') {
    return 'Getafe';
  }
  else if (teamName == 'Eibar') {
    return 'Eibar';
  }
  else if (teamName == 'Ath Bilbao') {
    return 'Athletic';
  }
  else if (teamName == 'Osasuna') {
    return 'Osasuna';
  }
  else if (teamName == 'Cadiz') {
    return 'Cadiz';
  }
  else if (teamName == 'Huesca') {
    return 'Huesca';
  }
  else if (teamName == 'Barcelona') {
    return 'Barça';
  }
  else if (teamName == 'Ath Madrid') {
    return 'Atleti';
  }
  else if (teamName == 'Alaves') {
    return 'Alavés';
  }
  else if (teamName == 'Levante') {
    return 'Levante';
  }
  else if (teamName == 'Sociedad') {
    return 'RealSociedad';
  }
  else if (teamName == 'Elche') {
    return 'Elche';
  }
  else if (teamName == 'Valencia') {
    return 'FCValencia';
  }
  return '';
}
