import 'package:flutter/material.dart';
import 'package:mozka_2_app/versie_2/modules/trainingen.dart';

class MainTrainingScreen extends StatelessWidget {
  final String trainingen;

  MainTrainingScreen({this.trainingen});

  static const String id = 'MainTrainingScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)),
        title: Text('Training'),
      ),
      body: Center(child: Text(trainingen)),
    );
  }
}
