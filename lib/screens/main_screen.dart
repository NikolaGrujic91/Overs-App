import 'package:flutter/material.dart';
import 'package:overs_app/widgets/candidates_list.dart';
import 'package:overs_app/widgets/run_icon_button.dart';
import 'package:overs_app/widgets/export_icon_button.dart';

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
          RunIconButton(),
          ExportIconButton(),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CandidatesList(),
        ],
      ),
    );
  }
}
