import 'package:flutter/material.dart';
import 'package:mozka_2_app/modules/derest/precences_database.dart';
import 'package:mozka_2_app/modules/derest/swimmer_data.dart';
import 'package:mozka_2_app/root/swimmer_database.dart';
import 'package:mozka_2_app/screens/tabview_swimmers_list/add_swimmer_screen/main/main_add_swimmer_screen.dart';
import 'screens/personal_swimmer_data/main/main_swimmer_personal_data_screen.dart';
import 'screens/start_screen/main/main_start_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:mozka_2_app/screens/test/testscreen.dart';
import 'package:mozka_2_app/screens/tabview_swimmers_list/list_of_precences_screen/main/main_list_of_precences_screen.dart';
import 'package:mozka_2_app/screens/tabview_swimmers_list/list_of_swimmers_screen/main/main_list_of_swimmers_screen.dart';
import 'package:mozka_2_app/screens/test/testscreen.dart';
import 'package:mozka_2_app/screens/tabview_swimmers_list/main_screen/main_tabview_screen.dart';
import 'versie_2/screens/add_swimmer_screen/main/add_swimmer_screen_main.dart';
import 'versie_2/screens/start/start_screen.dart';
import 'versie_2/screens/list_of_swimmers_screen/main/list_of_swimmers_screen_main.dart';

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
        initialRoute: StartScreenV2.id,
        routes: {
          SwimmerPersonalDataScreen.id: (context) =>
              SwimmerPersonalDataScreen(),
          StartScreen.id: (context) => StartScreen(),
          TestDonutPie.id: (context) => TestDonutPie(),
          MainListOfPrecencesScreen.id: (context) =>
              MainListOfPrecencesScreen(),
          MainListOfSwimmersScreen.id: (context) => MainListOfSwimmersScreen(),
          MainAddSwimmerScreen.id: (context) => MainAddSwimmerScreen(),
          TestDonutPie.id: (context) => TestDonutPie(),
          TabViewScreen.id: (context) => TabViewScreen(),
          AddSwimmerScreenMain.id: (context) => AddSwimmerScreenMain(),
          StartScreenV2.id: (context) => StartScreenV2(),
          ListOfSwimmersScreenMain.id: (context) => ListOfSwimmersScreenMain(),
        },
      ),
    );
  }
}
