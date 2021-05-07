import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:overs_app/overs_detector/overs_detector.dart';

class RunButton extends StatefulWidget {
  @override
  _RunButtonState createState() => _RunButtonState();
}

class _RunButtonState extends State<RunButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      width: double.infinity,
      child: ElevatedButton(
        child: Text(
          _pressed ? 'Calculating...' : 'Run',
          style: TextStyle(
            color: _pressed ? Colors.orange : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: _pressed
            ? () {}
            : () async {
                if (!_pressed) {
                  _setPressed(pressed: true);
                  var oversDetector = Provider.of<OversDetector>(context, listen: false);
                  await oversDetector.run().then((value) => _setPressed(pressed: false));
                }
              },
        style: ElevatedButton.styleFrom(
          primary: _pressed ? Colors.black : Colors.orange,
        ),
      ),
    );
  }

  void _setPressed({bool pressed}) {
    setState(() {
      _pressed = pressed;
    });
  }
}
