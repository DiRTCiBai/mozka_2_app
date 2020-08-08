import 'package:flutter/material.dart';
import 'screens/swimmers_list.dart';
import 'screens/add_swimmers.dart';
import 'screens/individueel_data_swimmer.dart';
import 'screens/test_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: TestScreen.id,
      routes: {
        SwimmersList.id: (context) => SwimmersList(),
        AddSwimmers.id: (context) => AddSwimmers(),
        SwimmerData.id: (context) => SwimmerData(),
        TestScreen.id: (context) => TestScreen(),
      },
    );
  }
}
