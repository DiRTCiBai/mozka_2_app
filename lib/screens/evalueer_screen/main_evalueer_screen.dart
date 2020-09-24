import 'package:flutter/material.dart';
import 'widget_custom_dropdownbutton.dart';

class MainEvalueerScreen extends StatelessWidget {
  static const String id = 'MainEvalueerScreen';

  List<String> hoofdCriteria = [
    'Vlinder',
    'Rug',
    'School',
    'Crawl',
    'Starten '
  ];
  List<String> subCriteria = [
    'Armen',
    'Benen',
    'Keerpunt',
    'Tijden',
    'Conditie'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)),
        title: Text('Evalueer'),
      ),
      body: Column(
        children: <Widget>[
          CustomDropDownButton(itemList: hoofdCriteria),
          CustomDropDownButton(itemList: subCriteria),
          SizedBox(width: double.infinity),
        ],
      ),
    );
  }
}
