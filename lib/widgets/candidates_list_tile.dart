// Copyright 2022 Nikola Grujic. All rights reserved.
// Use of this source code is governed by a GNU-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:overs_app/overs_detector/candidate.dart';
import 'package:overs_app/utils/constants.dart';
import 'package:overs_app/utils/utils.dart';

/// TODO
/// Use factory constructors to define empty tile
/// and fixture tile
///

/// Widget for representing candidate fixture
class CandidatesListTile extends StatelessWidget {
  /// Creates new instance
  const CandidatesListTile({
    Key? key,
    required this.candidateFound,
    required this.candidate,
  }) : super(key: key);

  /// Indicator if any candidate is found
  final bool candidateFound;

  /// Candidate to be displayed in tile
  final Candidate? candidate;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: candidateFound
            ? Image.asset(
                'icons/flags/png/${leagueToFlagName(candidate!.candidateFixture.league)}',
                package: 'country_icons',
                height: 40,
                width: 40,
              )
            : const Text(''),
        title: Text(
          candidateFound
              ? candidate!.candidateFixture.teamsString()
              : 'Nothing found',
          style: kTileTextStyle,
        ),
        subtitle: Text(
          candidateFound
              ? '${candidate!.candidateFixture.leagueName}, '
                  '${candidate!.candidateFixture.timeString()}\n\n'
                  '${candidate!.historyString()}'
              : '',
          style: kTileTextStyle,
        ),
        trailing: Text(
          candidateFound ? candidate!.candidateFixture.overOddString : '',
          style: kTileTextStyle,
        ),
        tileColor: kBackgroundColorDarkGrey,
      ),
    );
  }
}
