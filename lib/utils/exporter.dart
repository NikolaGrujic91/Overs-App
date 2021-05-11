import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:overs_app/overs_detector/overs_detector.dart';
import 'package:overs_app/overs_detector/candidate.dart';

class Exporter {
  static Future<File> export(BuildContext context) async {
    final file = await _localFile();

    var oversDetector = Provider.of<OversDetector>(context, listen: false);
    var stringBuffer = StringBuffer();

    for (Candidate candidate in oversDetector.candidates) {
      stringBuffer.writeln(candidate.candidateFixture.teamsString());
      stringBuffer.writeln('${candidate.candidateFixture.leagueName}, ${candidate.candidateFixture.timeString()}');
      stringBuffer.writeln('Over 2.5 goals odd: ${candidate.candidateFixture.overOddString}');
      stringBuffer.writeln();
    }

    return file.writeAsString(stringBuffer.toString());
  }

  static Future<File> _localFile() async {
    final path = await _localPath();
    var file = File('$path/export.txt').create(recursive: true);
    return file;
  }

  static Future<String> _localPath() async {
    final directory = await getTemporaryDirectory();
    return directory.path;
  }
}
