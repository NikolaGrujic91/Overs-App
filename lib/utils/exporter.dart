// Copyright 2022 Nikola Grujic. All rights reserved.
// Use of this source code is governed by a GNU-style license that can be
// found in the LICENSE file.

import 'dart:io';
import 'package:overs_app/overs_detector/candidate.dart';
import 'package:overs_app/utils/hashtags.dart';
import 'package:path_provider/path_provider.dart';

/// Export candidates formatted fot Twitter posts
Future<File> export(List<Candidate> candidates) async {
  final file = await _localFile();

  final stringBuffer = StringBuffer();

  for (final candidate in candidates) {
    stringBuffer.writeln(candidate.candidateFixture.teamsString());
    stringBuffer.writeln(
      '${candidate.candidateFixture.leagueName}, '
      '${candidate.candidateFixture.timeString()}',
    );
    stringBuffer.writeln(
      'Over 2.5 goals odd: ${candidate.candidateFixture.overOddString}',
    );
    stringBuffer.writeln();
    stringBuffer.writeln(
      '#bettingtips #bettingpicks #betting #sport #football '
      '#bettingtwitter #FreePicks #sportpicks #bestbets',
    );
    stringBuffer.writeln(
      '#bettingodds #odds #soccertips #soccerpicks #soccerbetting '
      '#tipster #footballbets',
    );
    stringBuffer.writeln(
      '${leagueToHashtag(candidate.candidateFixture.league)} '
      '${candidateToHashtag(candidate)}',
    );
    stringBuffer.writeln(
      '------------------------------------------------------------------'
      '-----------------------------',
    );
    stringBuffer.writeln();
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
