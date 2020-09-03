import 'package:flutter/material.dart';

class AddTrainingScreenMain extends StatelessWidget {
  static const String id = 'AddTrainingScreenMain';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)),
        title: Text('Training'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: double.infinity,
          ),
          Text('oef1'),
          Text('oef1'),
          Text('oef1'),
          Text('oef1'),
          Text('oef1'),
        ],
      ),
    );
  }
}
