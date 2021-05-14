import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:overs_app/overs_detector/overs_detector.dart';
import 'package:overs_app/utils/constants.dart';

class RunIconButton extends StatefulWidget {
  @override
  _RunIconButtonState createState() => _RunIconButtonState();
}

class _RunIconButtonState extends State<RunIconButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.play_arrow),
      color: kTextColorWhite,
      disabledColor: Colors.black,
      tooltip: 'Find candidates',
      onPressed: _pressed
          ? null
          : () async {
              if (!_pressed) {
                _setPressed(pressed: true);
                var oversDetector = Provider.of<OversDetector>(context, listen: false);
                await oversDetector.run().then((value) => _setPressed(pressed: false));
              }
            },
    );
  }

  void _setPressed({bool pressed}) {
    setState(() {
      _pressed = pressed;
    });
  }
}
