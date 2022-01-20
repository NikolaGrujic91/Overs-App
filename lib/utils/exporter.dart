// Copyright 2022 Nikola Grujic. All rights reserved.
// Use of this source code is governed by a GNU-style license that can be
// found in the LICENSE file.

import 'dart:io';
import 'package:overs/overs_detector/candidate.dart';
import 'package:overs/utils/hashtags.dart';
import 'package:path_provider/path_provider.dart';

/// Export candidates formatted fot Twitter posts
Future<File> export(List<Candidate> candidates) async {
  final file = await _localFile();

  final stringBuffer = StringBuffer();

  for (final candidate in candidates) {
    stringBuffer.writeln(
      '${candidate.candidateFixture.teamsString()}\n'
      '${candidate.candidateFixture.leagueName} '
      '${candidate.candidateFixture.timeString()}\n'
      'Over 2.5 goals odd: ${candidate.candidateFixture.overOddString}\n'
      '#bettingtips #bettingpicks #betting #sport #football '
      '#bettingtwitter #FreePicks #sportpicks #bestbets\n'
      '#bettingodds #odds #soccertips #soccerpicks #soccerbetting '
      '#tipster #footballbets\n'
      '${leagueToHashtag(candidate.candidateFixture.league)} '
      '${candidateToHashtag(candidate)}\n'
      '------------------------------------------------------------------'
      '-----------------------------\n',
    );
  }

  return file.writeAsString(stringBuffer.toString());
}

Future<File> _localFile() async {
  final path = await _localPath();
  final file = File('$path/export.txt').create(recursive: true);

  return file;
}

Future<String> _localPath() async {
  final directory = await getTemporaryDirectory();

  return directory.path;
}
