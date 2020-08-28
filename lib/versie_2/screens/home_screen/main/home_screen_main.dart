import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mozka_2_app/versie_2/screens/start/start_screen.dart';
import 'package:mozka_2_app/versie_2/screens/list_of_swimmers_screen/main/list_of_swimmers_screen_main.dart';
import 'package:mozka_2_app/versie_2/screens/precences_screen/main/precences_screen_main.dart';

class HomeScreenMain extends StatelessWidget {
  static const String id = 'HomeScreenMain';
  final _auth = FirebaseAuth.instance;
  User loggedInUser;

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
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            _auth.signOut();
            Navigator.popUntil(context, ModalRoute.withName(StartScreenV2.id));
          },
        ),
        title: Text('Home'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          FlatButton(
            child: Text('Zwemmers'),
            onPressed: () =>
                Navigator.pushNamed(context, ListOfSwimmersScreenMain.id),
          ),
          FlatButton(
            child: Text('Aanwezigheden'),
            onPressed: () =>
                Navigator.pushNamed(context, PrecencesScreenMain.id),
          ),
        ],
      ),
    );
  }
}
