import 'package:flutter/material.dart';
import 'package:overs_app/overs_detector/candidate.dart';

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
          candidateFound ? FlutterLogo() : '',
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
