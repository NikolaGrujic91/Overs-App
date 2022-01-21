// Copyright 2022 Nikola Grujic. All rights reserved.
// Use of this source code is governed by a GNU-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:overs/overs_detector/candidate.dart';
import 'package:overs/overs_detector/overs_detector.dart';
import 'package:overs/utils/constants.dart';
import 'package:overs/utils/utils.dart';
import 'package:provider/provider.dart';

/// Helper class that stores ExpansionPanel state information
class _Item {
  /// Creates new instance
  _Item({
    required this.headerLeading,
    required this.headerTitle,
    required this.headerSubtitle,
    required this.headerTrailing,
    required this.expandedValue,
    this.isExpanded = false,
  });

  /// Header leading value
  String headerLeading;

  /// Header title value
  String headerTitle;

  /// Header subtitle value
  String headerSubtitle;

  /// Header trailing value
  String headerTrailing;

  /// Expanded value
  String expandedValue;

  /// Is expanded flag
  bool isExpanded;
}

/// Widget representing candidates list
class CandidatesList extends StatefulWidget {
  /// Creates new instance
  const CandidatesList({Key? key}) : super(key: key);

  @override
  State<CandidatesList> createState() => _CandidatesListState();
}

class _CandidatesListState extends State<CandidatesList> {
  List<_Item> _data = [];
  bool _isExpanding = false;
  final String _flagPath = 'icons/flags/png/';
  final String _iconsPackage = 'country_icons';
  final double _imageSize = 40;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<OversDetector>(
        builder: (context, oversDetector, child) {
          return Container(
            child: _buildPanel(oversDetector),
          );
        },
      ),
    );
  }

  Widget _buildPanel(OversDetector oversDetector) {
    /// Allow generating items if _data is empty or panel is not expanding
    if (_data.isEmpty || !_isExpanding) {
      _data = _generateItems(oversDetector.candidates);
      _isExpanding = false;
    }

    return ExpansionPanelList(
      expansionCallback: _expansionCallback,
      children: _data.map<ExpansionPanel>((_Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              leading: Image.asset(
                item.headerLeading,
                package: _iconsPackage,
                height: _imageSize,
                width: _imageSize,
              ),
              title: Text(item.headerTitle),
              subtitle: Text(item.headerSubtitle),
              trailing: Text(item.headerTrailing),
              tileColor: kBackgroundColor,
            );
          },
          body: ListTile(
            subtitle: Text(item.expandedValue),
            tileColor: kBackgroundColor,
          ),
          isExpanded: item.isExpanded,
          backgroundColor: kBackgroundColor,
        );
      }).toList(),
    );
  }

  void _expansionCallback(int index, bool isExpanded) {
    setState(() {
      _data[index].isExpanded = !isExpanded;
      _isExpanding = true;
    });
  }

  List<_Item> _generateItems(List<Candidate> candidates) {
    final numberOfItems = candidates.length;

    return List<_Item>.generate(numberOfItems, (int index) {
      final candidateFixture = candidates[index].candidateFixture;

      return _Item(
        headerLeading: '$_flagPath${leagueToFlagName(candidateFixture.league)}',
        headerTitle: candidateFixture.teamsString(),
        headerSubtitle: '${candidateFixture.leagueName}, '
            '${candidateFixture.timeString()}',
        headerTrailing: candidateFixture.overOddString,
        expandedValue: candidates[index].historyString(),
      );
    });
  }
}
