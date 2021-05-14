import 'package:flutter/material.dart';
import 'package:overs_app/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:overs_app/overs_detector/overs_detector.dart';
import 'package:overs_app/screens/main_screen.dart';

void main() {
  runApp(OversApp());
}

class OversApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OversDetector>(
      create: (context) => OversDetector(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          highlightColor: kBackgroundColorDarkGrey,
        ),
        home: MainScreen(),
      ),
    );
  }
}
