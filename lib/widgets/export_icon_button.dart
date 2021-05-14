import 'package:flutter/material.dart';
import 'package:overs_app/utils/exporter.dart';

class ExportIconButton extends StatefulWidget {
  @override
  _ExportIconButtonState createState() => _ExportIconButtonState();
}

class _ExportIconButtonState extends State<ExportIconButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.import_export),
      color: _pressed ? Colors.orange : Colors.black,
      disabledColor: Colors.black,
      tooltip: 'Export candidates',
      onPressed: _pressed
          ? null
          : () async {
              if (!_pressed) {
                _setPressed(pressed: true);
                await Exporter.export(context).then((value) => _setPressed(pressed: false));
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
