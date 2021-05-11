import 'package:flutter/material.dart';
import 'package:overs_app/widgets/run_button.dart';
import 'package:overs_app/widgets/candidates_list.dart';
import 'package:overs_app/utils/exporter.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Overs',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.orange,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.import_export),
            tooltip: 'Export candidates',
            onPressed: () async {
              await Exporter.export(context);
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CandidatesList(),
          RunButton(),
        ],
      ),
    );
  }
}
