import 'package:flutter/material.dart';
import 'screens/swimmers_list.dart';
import 'screens/add_swimmers.dart';
import 'screens/individueel_data_swimmer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SwimmersList.id,
      routes: {
        SwimmersList.id: (context) => SwimmersList(),
        AddSwimmers.id: (context) => AddSwimmers(),
        SwimmerData.id: (context) => SwimmerData(),
      },
    );
  }
}
