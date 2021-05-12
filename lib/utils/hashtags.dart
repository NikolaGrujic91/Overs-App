import 'package:overs_app/data_collector/enums.dart';

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