import 'package:flutter/material.dart';
import 'package:overs_app/overs_detector/candidate.dart';
import 'package:overs_app/utils/utils.dart';

class CandidatesListTile extends StatelessWidget {
  final bool candidateFound;
  final Candidate candidate;
  final int fractionDigits = 2;

  CandidatesListTile({@required this.candidateFound, @required this.candidate});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading:
          candidateFound ? Image.asset('icons/flags/png/${leagueToFlagName(candidate.candidateFixture.league)}', package: 'country_icons', height: 40.0, width: 40.0) : Text(''),
        title: Text(
          candidateFound ? candidate.candidateFixture.teamsString() : 'Nothing found',
        ),
        subtitle: Text(
          candidateFound ? '${candidate.candidateFixture.leagueName}, ${candidate.candidateFixture.timeString()}' : '',
        ),
        trailing: Text(
          candidateFound ? candidate.candidateFixture.overOdd.toStringAsFixed(fractionDigits) : '',
        ),
      ),
    );
  }
}
