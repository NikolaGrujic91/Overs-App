// Copyright 2022 Nikola Grujic. All rights reserved.
// Use of this source code is governed by a GNU-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:overs_app/utils/constants.dart';
import 'package:overs_app/widgets/candidates_list.dart';
import 'package:overs_app/widgets/export_icon_button.dart';
import 'package:overs_app/widgets/run_icon_button.dart';

/// Widget representing main screen
class MainScreen extends StatelessWidget {
  /// Creates new instance
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Overs',
          style: kTileTextStyle,
        ),
        backgroundColor: kAppBarColor,
        actions: const <Widget>[
          RunIconButton(),
          ExportIconButton(),
        ],
      ),
      backgroundColor: kBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CandidatesList(),
        ],
      ),
    );
  }
}
