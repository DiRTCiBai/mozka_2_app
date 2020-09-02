import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:mozka_2_app/versie_2/screens/add_comments_screen/main/add_comments_screen_main.dart';
import 'package:mozka_2_app/versie_2/screens/list_of_comments_screen/widgets/get_comments.dart';
import 'package:mozka_2_app/versie_2/screens/start/start_screen.dart';
import 'package:mozka_2_app/versie_2/screens/list_of_swimmers_screen/main/list_of_swimmers_screen_main.dart';
import 'package:mozka_2_app/versie_2/screens/precences_screen/main/precences_screen_main.dart';
import 'package:mozka_2_app/versie_2/screens/home_screen/main/home_screen_main.dart';
import 'package:mozka_2_app/versie_2/screens/precences_screen/main/precences_screen_main.dart';
import 'package:mozka_2_app/versie_2/screens/training_screen/main/training_screen_main.dart';
import 'package:mozka_2_app/versie_2/screens/search_bar_test/search_bar_test.dart';

class HomeScreenMain extends StatefulWidget {
  static const String id = 'HomeScreenMain';

  @override
  _HomeScreenMainState createState() => _HomeScreenMainState();
}

class _HomeScreenMainState extends State<HomeScreenMain> {
  final _auth = FirebaseAuth.instance;

  User loggedInUser;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      if (index == 1) {
        Navigator.pushNamed(context, ListOfSwimmersScreenMain.id);
        _selectedIndex = 0;
      }
      if (index == 2) {
        Navigator.pushNamed(context, TrainingScreenMain.id);
        _selectedIndex = 0;
      }
    });
  }

  void GetCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        leading: IconButton(
//          icon: Icon(Icons.arrow_back),
//          onPressed: () {
//            _auth.signOut();
//            Navigator.popUntil(context, ModalRoute.withName(StartScreenV2.id));
//          },
//        ),
//        title: Text('Home'),
//      ),
      floatingActionButton: SpeedDial(
        closeManually: false,
        curve: Curves.bounceIn,
        overlayOpacity: 0.5,
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
            child: Icon(Icons.check),
            backgroundColor: Colors.red,
            label: 'Aanwezigheden',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () => Navigator.pushNamed(context, PrecencesScreenMain.id),
          ),
          SpeedDialChild(
            child: Icon(Icons.message),
            backgroundColor: Colors.green,
            label: 'Opmerking',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () => Navigator.pushNamed(context, AddCommentsScreenMain.id),
          ),
          SpeedDialChild(
            child: Icon(Icons.check_box),
            backgroundColor: Colors.deepPurpleAccent,
            label: 'Evalueer',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () {},
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: double.infinity,
          ),
//          Padding(
//            padding: const EdgeInsets.only(top: 10, bottom: 10),
//            child: GestureDetector(
//              child: Container(
//                width: 350,
//                decoration: BoxDecoration(
//                  borderRadius: BorderRadius.all(
//                    Radius.circular(30),
//                  ),
//                  color: Colors.blueAccent,
//                ),
//                child: Padding(
//                  padding: const EdgeInsets.all(10.0),
//                  child: Center(
//                    child: Text(
//                      'Zwemmers',
//                      style: TextStyle(color: Colors.white, fontSize: 20),
//                    ),
//                  ),
//                ),
//              ),
//              onTap: () =>
//                  Navigator.pushNamed(context, ListOfSwimmersScreenMain.id),
//            ),
//          ),
//          Padding(
//            padding: const EdgeInsets.only(top: 10.0, bottom: 10),
//            child: GestureDetector(
//              child: Container(
//                width: 350,
//                decoration: BoxDecoration(
//                  borderRadius: BorderRadius.all(
//                    Radius.circular(30),
//                  ),
//                  color: Colors.lightBlue,
//                ),
//                child: Padding(
//                  padding: const EdgeInsets.all(10.0),
//                  child: Center(
//                    child: Text(
//                      'Aanwezigheden',
//                      style: TextStyle(color: Colors.white, fontSize: 20),
//                    ),
//                  ),
//                ),
//              ),
//              onTap: () => Navigator.pushNamed(context, PrecencesScreenMain.id),
//            ),
//          ),
//          Padding(
//            padding: const EdgeInsets.only(top: 10.0, bottom: 10),
//            child: GestureDetector(
//              onTap: () {
//                _auth.signOut();
//                Navigator.popUntil(
//                    context, ModalRoute.withName(StartScreenV2.id));
//              },
//              child: Container(
//                width: 350,
//                decoration: BoxDecoration(
//                  borderRadius: BorderRadius.all(
//                    Radius.circular(30),
//                  ),
//                  color: Colors.lightBlueAccent,
//                ),
//                child: Padding(
//                  padding: const EdgeInsets.all(10.0),
//                  child: Center(
//                    child: Text(
//                      'Af melden',
//                      style: TextStyle(color: Colors.white, fontSize: 20),
//                    ),
//                  ),
//                ),
//              ),
//            ),
//          ),

          Image(
            width: 300,
            image: AssetImage('images/MozkaLogo.png'),
          ),

          GestureDetector(
            child: Text('Searchbar'),
            onTap: () {
              Navigator.pushNamed(context, SearchBarTest.id);
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text('Zwemmers'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            title: Text('Training'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
