import 'package:flutter/material.dart';
import 'screens/list_swimmer_screen.dart';
import 'screens/add_swimmer_screen.dart';
import 'screens/swimmer_personal_data_screen.dart';
import 'screens/presences/aanwezigheden_screen.dart';
import 'screens/start_screen.dart';
import 'package:provider/provider.dart';
import 'test_test/testdatabase.dart';
import 'test_test/testdata.dart';
import 'test_test/test.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TestData(),
        ),
        StreamProvider<List<TestData>>.value(value: TestDatabase().testlist),
      ],
      child: MaterialApp(
        initialRoute: TestScreen.id,
        routes: {
          SwimmersList.id: (context) => SwimmersList(),
          AddSwimmers.id: (context) => AddSwimmers(),
          SwimmerPersonalDataScreen.id: (context) =>
              SwimmerPersonalDataScreen(),
          PrecencesScreen.id: (context) => PrecencesScreen(),
          StartScreen.id: (context) => StartScreen(),
          TestScreen.id: (context) => TestScreen(),
        },
      ),
    );
  }
}
