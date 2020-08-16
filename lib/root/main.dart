import 'package:flutter/material.dart';
import 'package:mozka_2_app/modules/precences_database.dart';
import 'package:mozka_2_app/modules/swimmer_data.dart';
import 'package:mozka_2_app/root/swimmer_database.dart';
import '../screens/addlist/list_swimmer_screen.dart';
import '../screens/add_swimmer_screen.dart';
import '../screens/swimmer_personal_data_screen.dart';
import '../screens/presences/precences_screen.dart';
import '../screens/start_screen.dart';
import 'package:provider/provider.dart';
import '../test_test/testdata.dart';
import '../test_test/test.dart';

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
//        StreamProvider<List<TestData>>.value(value: TestDatabase().testlist),
        StreamProvider<List<SwimmerData>>.value(
            value: SwimmerDataBase().swimerlist),
        ChangeNotifierProvider(
          create: (context) => PrecencesDatabase(),
        ),
      ],
      child: MaterialApp(
        initialRoute: StartScreen.id,
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
