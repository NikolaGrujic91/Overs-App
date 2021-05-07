import 'package:flutter/material.dart';
import 'package:overs_app/overs_detector/overs_detector.dart';

class CandidatesListTile extends StatelessWidget {
  final OversDetector oversDetector;
  final int index;
  final int fractionDigits = 2;

  CandidatesListTile({@required this.oversDetector, @required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Text(
          oversDetector.fixtures[index].league,
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        title: Text(
            //oversDetector.candidates.length == 0 ? 'Nothing found' : oversDetector.candidates[index].toShortString(),
            oversDetector.fixtures[index].teamsString()),
        subtitle: Text(
          oversDetector.fixtures[index].timeString(),
        ),
        trailing: Text(oversDetector.fixtures[index].overOdd.toStringAsFixed(fractionDigits)),
      ),
    );
  }
}
