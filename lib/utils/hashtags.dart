// Copyright 2022 Nikola Grujic. All rights reserved.
// Use of this source code is governed by a GNU-style license that can be
// found in the LICENSE file.

import 'package:overs/data_collector/enums.dart';
import 'package:overs/overs_detector/candidate.dart';

/// Get league hashtag
String leagueToHashtag(League league) {
  switch (league) {
    case League.england1:
      return '#PL';
    case League.england2:
      return '#EFL';
    case League.scotland1:
      return '#SPFL';
    case League.germany1:
      return '#Bundesliga';
    case League.germany2:
      return '#Bundesliga2';
    case League.italy1:
      return '#SerieA';
    case League.italy2:
      return '#SerieB';
    case League.spain1:
      return '#LaLigaSantander';
    case League.france1:
      return '#Ligue1';
    case League.france2:
      return '#Ligue2';
    case League.netherlands1:
      return '#Eredivisie';
    case League.belgium1:
      return '#jupilerproleague';
    case League.portugal1:
      return '#LigaNOS';
    case League.turkey1:
      return '#SuperLig';
    case League.greece1:
      return '#slgr';
    case League.none:
      return '';
  }
}

///Get candidate fixture hashtag
String candidateToHashtag(Candidate candidate) {
  switch (candidate.candidateFixture.league) {
    case League.england1:
      return '#${_teamHashtagEngland1(candidate.candidateFixture.homeTeam)}'
          '${_teamHashtagEngland1(candidate.candidateFixture.awayTeam)}';
    case League.england2:
      return '';
    case League.scotland1:
      return '';
    case League.germany1:
      return '#${_teamHashtagGermany1(candidate.candidateFixture.homeTeam)}'
          '${_teamHashtagGermany1(candidate.candidateFixture.awayTeam)}';
    case League.germany2:
      return '';
    case League.italy1:
      return '#${_teamHashtagItaly1(candidate.candidateFixture.homeTeam)}'
          '${_teamHashtagItaly1(candidate.candidateFixture.awayTeam)}';
    case League.italy2:
      return '';
    case League.spain1:
      return '#${_teamHashtagSpain1(candidate.candidateFixture.homeTeam)}'
          '${_teamHashtagSpain1(candidate.candidateFixture.awayTeam)}';
    case League.france1:
      return '#${_teamHashtagFrance1(candidate.candidateFixture.homeTeam)}'
          '${_teamHashtagFrance1(candidate.candidateFixture.awayTeam)}';
    case League.france2:
      return '';
    case League.netherlands1:
      return '#${_teamHashtagNetherlands1(candidate.candidateFixture.homeTeam)}'
          '${_teamHashtagNetherlands1(candidate.candidateFixture.awayTeam)}';
    case League.belgium1:
      return '';
    case League.portugal1:
      return '#${_teamHashtagPortugal1(candidate.candidateFixture.homeTeam)}'
          '${_teamHashtagPortugal1(candidate.candidateFixture.awayTeam)}';
    case League.turkey1:
      return '#${_teamHashtagTurkey1(candidate.candidateFixture.homeTeam)}v'
          '${_teamHashtagTurkey1(candidate.candidateFixture.awayTeam)}';
    case League.greece1:
      return '';
    case League.none:
      return '';
  }
}

/// Get hashtag for England teams
String _teamHashtagEngland1(String teamName) {
  if (teamName == 'Fulham') {
    return 'FUL';
  } else if (teamName == 'Arsenal') {
    return 'ARS';
  } else if (teamName == 'Crystal Palace') {
    return 'CRY';
  } else if (teamName == 'Southampton') {
    return 'SOU';
  } else if (teamName == 'Chelsea') {
    return 'CHE';
  } else if (teamName == 'Man United') {
    return 'MUN';
  } else if (teamName == 'Leicester') {
    return 'LEI';
  } else if (teamName == 'Liverpool') {
    return 'LIV';
  } else if (teamName == 'Leeds') {
    return 'LEE';
  } else if (teamName == 'West Ham') {
    return 'WHU';
  } else if (teamName == 'Newcastle') {
    return 'LEI';
  } else if (teamName == 'West Brom') {
    return 'WBA';
  } else if (teamName == 'Tottenham') {
    return 'TOT';
  } else if (teamName == 'Everton') {
    return 'EVE';
  } else if (teamName == 'Burnley') {
    return 'BUR';
  } else if (teamName == 'Wolves') {
    return 'WOL';
  } else if (teamName == 'Brighton') {
    return 'BHA';
  } else if (teamName == 'Aston Villa') {
    return 'AVL';
  } else if (teamName == 'Sheffield United') {
    return 'SHU';
  } else if (teamName == 'Man City') {
    return 'MCI';
  }

  return '';
}

/// Get hashtag for Germany teams
String _teamHashtagGermany1(String teamName) {
  if (teamName == 'Bayern Munich') {
    return 'FCB';
  } else if (teamName == 'Schalke 04') {
    return 'S04';
  } else if (teamName == 'Ein Frankfurt') {
    return 'SGE';
  } else if (teamName == 'Bielefeld') {
    return 'DSC';
  } else if (teamName == 'FC Koln') {
    return 'KOE';
  } else if (teamName == 'Hoffenheim') {
    return 'TSG';
  } else if (teamName == 'Stuttgart') {
    return 'VFB';
  } else if (teamName == 'Freiburg') {
    return 'SCF';
  } else if (teamName == 'Union Berlin') {
    return 'FCU';
  } else if (teamName == 'Augsburg') {
    return 'FCA';
  } else if (teamName == 'Werder Bremen') {
    return 'SVW';
  } else if (teamName == 'Hertha') {
    return 'BSC';
  } else if (teamName == 'Dortmund') {
    return 'BVB';
  } else if (teamName == "M'gladbach") {
    return 'BMG';
  } else if (teamName == 'RB Leipzig') {
    return 'RBL';
  } else if (teamName == 'Mainz') {
    return 'M05';
  } else if (teamName == 'Wolfsburg') {
    return 'WOB';
  } else if (teamName == 'Leverkusen') {
    return 'B04';
  }

  return '';
}

/// Get hashtag for Spain teams
String _teamHashtagSpain1(String teamName) {
  if (teamName == 'Betis') {
    return 'RealBetis';
  } else if (teamName == 'Granada') {
    return 'Granada';
  } else if (teamName == 'Real Madrid') {
    return 'RealMadrid';
  } else if (teamName == 'Sevilla') {
    return 'Sevilla';
  } else if (teamName == 'Villarreal') {
    return 'Villarreal';
  } else if (teamName == 'Celta') {
    return 'Celta';
  } else if (teamName == 'Valladolid') {
    return 'RealValladolid';
  } else if (teamName == 'Getafe') {
    return 'Getafe';
  } else if (teamName == 'Eibar') {
    return 'Eibar';
  } else if (teamName == 'Ath Bilbao') {
    return 'Athletic';
  } else if (teamName == 'Osasuna') {
    return 'Osasuna';
  } else if (teamName == 'Cadiz') {
    return 'Cadiz';
  } else if (teamName == 'Huesca') {
    return 'Huesca';
  } else if (teamName == 'Barcelona') {
    return 'Bar??a';
  } else if (teamName == 'Ath Madrid') {
    return 'Atleti';
  } else if (teamName == 'Alaves') {
    return 'Alav??s';
  } else if (teamName == 'Levante') {
    return 'Levante';
  } else if (teamName == 'Sociedad') {
    return 'RealSociedad';
  } else if (teamName == 'Elche') {
    return 'Elche';
  } else if (teamName == 'Valencia') {
    return 'FCValencia';
  }

  return '';
}

/// Get hashtag for Italy teams
String _teamHashtagItaly1(String teamName) {
  if (teamName == 'Torino') {
    return 'Torino';
  } else if (teamName == 'Milan') {
    return 'Milan';
  } else if (teamName == 'Sassuolo') {
    return 'Sassuolo';
  } else if (teamName == 'Juventus') {
    return 'Juve';
  } else if (teamName == 'Sampdoria') {
    return 'Samp';
  } else if (teamName == 'Spezia') {
    return 'Spezia';
  } else if (teamName == 'Lazio') {
    return 'Lazio';
  } else if (teamName == 'Parma') {
    return 'Parma';
  } else if (teamName == 'Inter') {
    return 'Inter';
  } else if (teamName == 'Roma') {
    return 'Roma';
  } else if (teamName == 'Bologna') {
    return 'Bologna';
  } else if (teamName == 'Genoa') {
    return 'Genoa';
  } else if (teamName == 'Atalanta') {
    return 'Atalanta';
  } else if (teamName == 'Benevento') {
    return 'Benevento';
  } else if (teamName == 'Cagliari') {
    return 'Cagliari';
  } else if (teamName == 'Fiorentina') {
    return 'Fiorentina';
  } else if (teamName == 'Napoli') {
    return 'Napoli';
  } else if (teamName == 'Udinese') {
    return 'Udinese';
  } else if (teamName == 'Verona') {
    return 'Verona';
  } else if (teamName == 'Crotone') {
    return 'Crotone';
  }

  return '';
}

/// Get hashtag for France teams
String _teamHashtagFrance1(String teamName) {
  if (teamName == 'Rennes') {
    return 'SRFC';
  } else if (teamName == 'Paris SG') {
    return 'PSG';
  } else if (teamName == 'Reims') {
    return 'SDR';
  } else if (teamName == 'Monaco') {
    return 'ASM';
  } else if (teamName == 'Strasbourg') {
    return 'RCSA';
  } else if (teamName == 'Montpellier') {
    return 'MHSC';
  } else if (teamName == 'Nice') {
    return 'OGCN';
  } else if (teamName == 'Brest') {
    return 'SB29';
  } else if (teamName == 'Metz') {
    return 'FCM';
  } else if (teamName == 'Nimes') {
    return 'NO';
  } else if (teamName == 'Angers') {
    return 'SCO';
  } else if (teamName == 'Dijon') {
    return 'DFCO';
  } else if (teamName == 'St Etienne') {
    return 'ASSE';
  } else if (teamName == 'Marseille') {
    return 'OM';
  } else if (teamName == 'Lyon') {
    return 'OL';
  } else if (teamName == 'Lorient') {
    return 'FCL';
  } else if (teamName == 'Nantes') {
    return 'FCN';
  } else if (teamName == 'Bordeaux') {
    return 'FCGB';
  } else if (teamName == 'Lens') {
    return 'RCL';
  } else if (teamName == 'Lille') {
    return 'LOSC';
  }

  return '';
}

/// Get hashtag for Netherlands teams
String _teamHashtagNetherlands1(String teamName) {
  if (teamName == 'Willem II') {
    return 'WIL';
  } else if (teamName == 'PSV Eindhoven') {
    return 'PSV';
  } else if (teamName == 'Zwolle') {
    return 'PEC';
  } else if (teamName == 'Den Haag') {
    return 'ADO';
  } else if (teamName == 'Feyenoord') {
    return 'FEY';
  } else if (teamName == 'Ajax') {
    return 'AJA';
  } else if (teamName == 'FC Emmen') {
    return 'EMM';
  } else if (teamName == 'Groningen') {
    return 'GRO';
  } else if (teamName == 'VVV Venlo') {
    return 'VVV';
  } else if (teamName == 'Waalwijk') {
    return 'RKC';
  } else if (teamName == 'AZ Alkmaar') {
    return 'AZ';
  } else if (teamName == 'For Sittard') {
    return 'FOR';
  } else if (teamName == 'Heerenveen') {
    return 'HEE';
  } else if (teamName == 'Utrecht') {
    return 'UTR';
  } else if (teamName == 'Twente') {
    return 'TWE';
  } else if (teamName == 'Heracles') {
    return 'HER';
  } else if (teamName == 'Sparta Rotterdam') {
    return 'SPA';
  } else if (teamName == 'Vitesse') {
    return 'VIT';
  }

  return '';
}

/// Get hashtag for Turkey teams
String _teamHashtagTurkey1(String teamName) {
  if (teamName == 'Yeni Malatyaspor') {
    return 'YMS';
  } else if (teamName == 'Hatayspor') {
    return 'HTY';
  } else if (teamName == 'Kasimpasa') {
    return 'KAS';
  } else if (teamName == 'Ankaragucu') {
    return 'ANK';
  } else if (teamName == 'Genclerbirligi') {
    return 'GB';
  } else if (teamName == 'Goztep') {
    return 'G??Z';
  } else if (teamName == 'Gaziantep') {
    return 'GFK';
  } else if (teamName == 'Rizespor') {
    return 'RiZ';
  } else if (teamName == 'Fenerbahce') {
    return 'FB';
  } else if (teamName == 'Sivasspor') {
    return 'SiV';
  } else if (teamName == 'Denizlispor') {
    return 'DNZ';
  } else if (teamName == 'Galatasaray') {
    return 'GS';
  } else if (teamName == 'Buyuksehyr') {
    return 'iBFK';
  } else if (teamName == 'Kayserispor') {
    return 'KYS';
  } else if (teamName == 'Besiktas') {
    return 'BJK';
  } else if (teamName == 'Karagumruk') {
    return 'FKG';
  } else if (teamName == 'Alanyaspor') {
    return 'ALY';
  } else if (teamName == 'Erzurum BB') {
    return 'ERZ';
  } else if (teamName == 'Konyaspor') {
    return 'KON';
  } else if (teamName == 'Trabzonspor') {
    return 'TS';
  } else if (teamName == 'Ad. Demirspor') {
    return 'ADS';
  }

  return '';
}

/// Get hashtag for Portugal teams
String _teamHashtagPortugal1(String teamName) {
  if (teamName == 'Maritimo') {
    return 'CSM';
  } else if (teamName == 'Guimaraes') {
    return 'VSC';
  } else if (teamName == 'Belenenses') {
    return 'BFS';
  } else if (teamName == 'Santa Clara') {
    return 'CDSC';
  } else if (teamName == 'Famalicao') {
    return 'FCF';
  } else if (teamName == 'Nacional') {
    return 'CDN';
  } else if (teamName == 'Rio Ave') {
    return 'RAFC';
  } else if (teamName == 'Porto') {
    return 'FCP';
  } else if (teamName == 'Benfica') {
    return 'SLB';
  } else if (teamName == 'Sp Lisbon') {
    return 'SCP';
  } else if (teamName == 'Farense') {
    return 'SCF';
  } else if (teamName == 'Tondela') {
    return 'CDT';
  } else if (teamName == 'Boavista') {
    return 'BFC';
  } else if (teamName == 'Portimonense') {
    return 'PSC';
  } else if (teamName == 'Sp Braga') {
    return 'SCB';
  } else if (teamName == 'Moreirense') {
    return 'MFC';
  } else if (teamName == 'Pacos Ferreira') {
    return 'FCPF';
  } else if (teamName == 'Gil Vicente') {
    return 'GVFC';
  }

  return '';
}
