import 'package:flutter/material.dart';
import 'file:///D:/AndroidstudioProjects/mozka_v2.1_app/lib/precences_database.dart';
import 'file:///D:/AndroidstudioProjects/mozka_v2.1_app/lib/swimmer_data.dart';
import 'file:///D:/AndroidstudioProjects/mozka_v2.1_app/lib/swimmer_database.dart';

import 'package:mozka_2_app/modules/filter_database.dart';
import 'package:mozka_2_app/modules/swimmer_database.dart';
import 'package:mozka_2_app/screens/add_comments_screen/main/add_comments_screen_main.dart';
import 'package:mozka_2_app/screens/training_home_screen/listview/function_training_database.dart';

import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

import 'screens/add_swimmer_screen/main_add_swimmer_screen.dart';
import 'screens/start/start_screen.dart';
import 'screens/list_of_swimmers_screen/main/list_of_swimmers_screen_main.dart';
import 'screens/precences_screen/main/precences_screen_main.dart';
import 'modules/swimmer_data.dart';
import 'screens/personal_swimmer_data_screen/main/personal_swimmer_data_screen_main.dart';
import 'screens/list_of_comments_screen/main/list_of_comments_screen_main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/registration_screen/main/registration_screen_main.dart';
import 'screens/home_screen/main_home_screen.dart';
import 'screens/login_screen/main/login_screen_main.dart';
import 'screens/training_home_screen/main/training_screen_main.dart';
import 'screens/search_bar_test/search_bar_test.dart';
import 'package:mozka_2_app/screens/add_comments_screen/main/add_comment2_screen_main.dart';
import 'screens/personal_precences_detail/main_personal_precences_detail.dart';
import 'screens/mozka_precences_screen/main.dart';
import 'modules/oefeningen_database.dart';
import 'modules/trainingen.dart';
import 'screens/training_screen/main_training_screen.dart';
import 'modules/filter_database.dart';
import 'screens/training_home_screen/add_training_screen/tabview/main_tabview.dart';
import 'screens/training_home_screen/add_training_screen/code_training/main_code_training.dart';
import 'screens/training_edit_screen/main_training_edit_screen.dart';

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
              StreamProvider<List<Trainingen>>.value(
                  value: TrainingenDatabase().trainingenDatabase),
              ChangeNotifierProvider(
                create: (context) => PrecencesDatabase(),
              ),
              ChangeNotifierProvider(
                create: (context) => OefeningenDatabase(),
              ),
              ChangeNotifierProvider(
                create: (context) => FilterDatabase(),
              ),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              initialRoute: MainSplashScreen.id,
              routes: {
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
                TrainingScreenMain.id: (context) => TrainingScreenMain(),
                SearchBarTest.id: (context) => SearchBarTest(),
                AddCommentsScreenMain2.id: (context) =>
                    AddCommentsScreenMain2(),
                PersonalPrecencesDetail.id: (context) =>
                    PersonalPrecencesDetail(),
                MozkaPrecencesScreen.id: (context) => MozkaPrecencesScreen(),
                MainTrainingScreen.id: (context) => MainTrainingScreen(),
                MainSplashScreen.id: (context) => MainSplashScreen(),
                MainTrainingTabBar.id: (context) => MainTrainingTabBar(),
                MainCodeTraining.id: (context) => MainCodeTraining(),
                MainTrainingEditScreen.id: (context) =>
                    MainTrainingEditScreen(),
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
