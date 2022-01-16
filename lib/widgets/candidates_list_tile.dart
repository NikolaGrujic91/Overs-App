// Copyright 2022 Nikola Grujic. All rights reserved.
// Use of this source code is governed by a GNU-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:overs_app/overs_detector/candidate.dart';
import 'package:overs_app/utils/constants.dart';
import 'package:overs_app/utils/utils.dart';

/// Widget for representing candidate fixture
class CandidatesListTile extends StatelessWidget {
  /// Creates new instance
  const CandidatesListTile({
    Key? key,
    required this.candidateFound,
    this.candidate,
  }) : super(key: key);

  /// Creates a empty tile
  factory CandidatesListTile.empty() => const CandidatesListTile(
        candidateFound: false,
      );

  /// Creates a tile with fixture info from candidate
  factory CandidatesListTile.fixture({required Candidate candidate}) =>
      CandidatesListTile(
        candidateFound: true,
        candidate: candidate,
      );

  /// Indicator if any candidate is found
  final bool candidateFound;

  /// Candidate to be displayed in tile
  final Candidate? candidate;

  @override
  Widget build(BuildContext context) {
    return candidateFound ? _fixtureTile() : _emptyTile();
  }

  Widget _emptyTile() {
    return const ListTile(
      title: Text(
        'Nothing found',
        style: kTileTextStyle,
      ),
      tileColor: kBackgroundColorDarkGrey,
    );
  }

  Widget _fixtureTile() {
    return ListTile(
      leading: Image.asset(
        'icons/flags/png/${leagueToFlagName(candidate!.candidateFixture.league)}',
        package: 'country_icons',
        height: 40,
        width: 40,
      ),
      title: Text(
        candidate!.candidateFixture.teamsString(),
        style: kTileTextStyle,
      ),
      subtitle: Text(
        '${candidate!.candidateFixture.leagueName}, '
        '${candidate!.candidateFixture.timeString()}\n\n'
        '${candidate!.historyString()}',
        style: kTileTextStyle,
      ),
      trailing: Text(
        candidate!.candidateFixture.overOddString,
        style: kTileTextStyle,
      ),
      tileColor: kBackgroundColorDarkGrey,
    );
  }
}
