// Copyright 2022 Nikola Grujic. All rights reserved.
// Use of this source code is governed by a GNU-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:overs/overs_detector/overs_detector.dart';
import 'package:overs/utils/constants.dart';
import 'package:provider/provider.dart';

/// Widget representing run button
class RunIconButton extends StatefulWidget {
  /// Creates new instance
  const RunIconButton({Key? key}) : super(key: key);

  @override
  State<RunIconButton> createState() => _RunIconButtonState();
}

class _RunIconButtonState extends State<RunIconButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.play_arrow),
      color: kTextColorWhite,
      disabledColor: kDisabledColor,
      tooltip: 'Find candidates',
      onPressed: _pressed
          ? null
          : () async {
              if (!_pressed) {
                _setPressed(pressed: true);
                final oversDetector =
                    Provider.of<OversDetector>(context, listen: false);
                await oversDetector
                    .run()
                    .then((value) => _setPressed(pressed: false));
              }
            },
    );
  }

  void _setPressed({required bool pressed}) {
    setState(() {
      _pressed = pressed;
    });
  }
}
