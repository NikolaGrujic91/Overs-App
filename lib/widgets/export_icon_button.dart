// Copyright 2022 Nikola Grujic. All rights reserved.
// Use of this source code is governed by a GNU-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:overs/overs_detector/overs_detector.dart';
import 'package:overs/utils/constants.dart';
import 'package:overs/utils/exporter.dart';
import 'package:provider/provider.dart';

/// Widget that represents export button
class ExportIconButton extends StatefulWidget {
  /// Create new instance
  const ExportIconButton({Key? key}) : super(key: key);

  @override
  State<ExportIconButton> createState() => _ExportIconButtonState();
}

class _ExportIconButtonState extends State<ExportIconButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.import_export),
      color: kTextColorWhite,
      disabledColor: kDisabledColor,
      tooltip: 'Export candidates',
      onPressed: _pressed
          ? null
          : () async {
              if (!_pressed) {
                final oversDetector =
                    Provider.of<OversDetector>(context, listen: false);
                _setPressed(pressed: true);
                await export(oversDetector.candidates)
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
