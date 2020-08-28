import 'package:flutter/material.dart';
import 'package:mozka_2_app/modules/derest/precences_database.dart';
import 'package:mozka_2_app/modules/derest/swimmer_data.dart';
import 'package:mozka_2_app/root/swimmer_database.dart';
import 'package:mozka_2_app/screens/tabview_swimmers_list/add_swimmer_screen/main/main_add_swimmer_screen.dart';
import 'package:mozka_2_app/versie_2/modules/swimmer_database.dart';
import 'package:mozka_2_app/versie_2/screens/add_comments_screen/main/add_comments_screen_main.dart';
import 'package:mozka_2_app/versie_2/screens/edit_swimmer_data_screen/main/edit_swimmer_data_screen_main.dart';
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
import 'versie_2/screens/precences_screen/main/precences_screen_main.dart';
import 'versie_2/modules/swimmer_data.dart';
import 'versie_2/screens/personal_swimmer_data_screen/main/personal_swimmer_data_screen_main.dart';
import 'versie_2/screens/list_of_comments_screen/main/list_of_comments_screen_main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'versie_2/screens/registration_screen/main/registration_screen_main.dart';
import 'versie_2/screens/home_screen/main/home_screen_main.dart';
import 'versie_2/screens/login_screen/main/login_screen_main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: Text('doet het niet'),
              ),
            ),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MultiProvider(
            providers: [
//        StreamProvider<List<TestData>>.value(value: TestDatabase().testlist),
              StreamProvider<List<SwimmerData>>.value(
                  value: SwimmerDataBase().swimerlist),
              StreamProvider<List<SwimmerData2>>.value(
                  value: SwimmerListDatabase().swimerDatabase),
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
                MainListOfSwimmersScreen.id: (context) =>
                    MainListOfSwimmersScreen(),
                MainAddSwimmerScreen.id: (context) => MainAddSwimmerScreen(),
                TestDonutPie.id: (context) => TestDonutPie(),
                TabViewScreen.id: (context) => TabViewScreen(),
                AddSwimmerScreenMain.id: (context) => AddSwimmerScreenMain(),
                StartScreenV2.id: (context) => StartScreenV2(),
                ListOfSwimmersScreenMain.id: (context) =>
                    ListOfSwimmersScreenMain(),
                PrecencesScreenMain.id: (context) => PrecencesScreenMain(),
                PersonalSwimmerDataSCreenMain.id: (context) =>
                    PersonalSwimmerDataSCreenMain(),
                AddCommentsScreenMain.id: (context) => AddCommentsScreenMain(),
                ListOfCommentsMain.id: (context) => ListOfCommentsMain(),
                RegistrationScreenMain.id: (context) =>
                    RegistrationScreenMain(),
                HomeScreenMain.id: (context) => HomeScreenMain(),
                LoginScreenMain.id: (context) => LoginScreenMain(),
              },
            ),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return MaterialApp(
          home: Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}
