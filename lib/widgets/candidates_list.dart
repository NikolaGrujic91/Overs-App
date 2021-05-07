import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:overs_app/overs_detector/overs_detector.dart';
import 'candidates_list_tile.dart';

class CandidatesList extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Consumer<OversDetector>(
      builder: (context, oversDetector, child) {
        return Expanded(
          child: Scrollbar(
            isAlwaysShown: true,
            controller: _scrollController,
            child: ListView.builder(
              controller: _scrollController,
              padding: EdgeInsets.all(10.0),
              itemCount: oversDetector.candidates.length == 0 ? 1 : oversDetector.candidates.length,
              itemBuilder: (context, index) {
                return CandidatesListTile(
                  candidateFound: oversDetector.candidates.length > 0,
                  candidate: oversDetector.candidates.length > 0 ? oversDetector.candidates[index] : null,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
