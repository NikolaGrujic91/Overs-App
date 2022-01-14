// Copyright 2022 Nikola Grujic. All rights reserved.
// Use of this source code is governed by a GNU-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:overs_app/overs_detector/overs_detector.dart';
import 'package:overs_app/widgets/candidates_list_tile.dart';
import 'package:provider/provider.dart';

/// Widget for representing list of candidate fixtures
class CandidatesList extends StatelessWidget {
  /// Creates new instance
  CandidatesList({Key? key}) : super(key: key);

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scrollbar(
        isAlwaysShown: true,
        controller: _scrollController,
        child: Consumer<OversDetector>(
          builder: (context, oversDetector, child) {
            return ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(10),
              itemCount: oversDetector.candidates.isEmpty
                  ? 1
                  : oversDetector.candidates.length,
              itemBuilder: (context, index) {
                return CandidatesListTile(
                  candidateFound: oversDetector.candidates.isNotEmpty,
                  candidate: oversDetector.candidates.isNotEmpty
                      ? oversDetector.candidates[index]
                      : null,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
