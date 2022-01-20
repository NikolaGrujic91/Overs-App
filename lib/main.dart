// Copyright 2022 Nikola Grujic. All rights reserved.
// Use of this source code is governed by a GNU-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:overs/overs_detector/overs_detector.dart';
import 'package:overs/screens/main_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const OversApp());
}

/// Main widget
class OversApp extends StatelessWidget {
  /// Creates new instance
  const OversApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OversDetector>(
      create: (context) => OversDetector(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: const MainScreen(),
      ),
    );
  }
}
