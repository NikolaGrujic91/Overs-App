import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:overs_app/overs_detector/overs_detector.dart';

class RunButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      width: double.infinity,
      child: ElevatedButton(
        child: Text(
          'Run',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () async {
          var oversDetector = Provider.of<OversDetector>(context, listen: false);
          await oversDetector.run().then((value) => print(oversDetector.candidates));
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.orange,
        ),
      ),
    );
  }
}
