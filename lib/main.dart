import 'package:flutter/material.dart';
import 'screens/list_swimmer_screen.dart';
import 'screens/add_swimmer_screen.dart';
import 'screens/swimmer_personal_data_screen.dart';
import 'screens/aanwezigheden_screen.dart';
import 'screens/start_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: StartScreen.id,
      routes: {
        SwimmersList.id: (context) => SwimmersList(),
        AddSwimmers.id: (context) => AddSwimmers(),
        SwimmerPersonalDataScreen.id: (context) => SwimmerPersonalDataScreen(),
        AanwezighedenScreen.id: (context) => AanwezighedenScreen(),
        StartScreen.id: (context) => StartScreen(),
      },
    );
  }
}
