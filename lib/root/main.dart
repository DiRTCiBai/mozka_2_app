import 'package:flutter/material.dart';
import 'package:mozka_2_app/modules/precences_database.dart';
import 'package:mozka_2_app/modules/swimmer_data.dart';
import 'package:mozka_2_app/root/swimmer_database.dart';
import '../screens/add_swimmer_screen.dart';
import '../screens/swimmer_personal_data_screen.dart';
import '../screens/start_screen.dart';
import 'package:provider/provider.dart';
import 'package:mozka_2_app/screens/swimmer_list/swimmer_list.dart';
import 'package:flutter/services.dart';
import 'package:mozka_2_app/screens/test/testscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MultiProvider(
      providers: [
//        StreamProvider<List<TestData>>.value(value: TestDatabase().testlist),
        StreamProvider<List<SwimmerData>>.value(
            value: SwimmerDataBase().swimerlist),
        ChangeNotifierProvider(
          create: (context) => PrecencesDatabase(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: StartScreen.id,
        routes: {
          AddSwimmers.id: (context) => AddSwimmers(),
          SwimmerPersonalDataScreen.id: (context) =>
              SwimmerPersonalDataScreen(),
          StartScreen.id: (context) => StartScreen(),
          SpeedDialList.id: (context) => SpeedDialList(),
          TestDonutPie.id: (context) => TestDonutPie(),
        },
      ),
    );
  }
}
