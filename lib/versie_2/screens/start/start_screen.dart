import 'package:flutter/material.dart';
import 'package:mozka_2_app/versie_2/screens/list_of_swimmers_screen/main/list_of_swimmers_screen_main.dart';
import 'package:mozka_2_app/versie_2/screens/login_screen/main/login_screen_main.dart';
import 'package:mozka_2_app/versie_2/screens/precences_screen/main/precences_screen_main.dart';
import 'package:mozka_2_app/versie_2/screens/registration_screen/main/registration_screen_main.dart';

class StartScreenV2 extends StatelessWidget {
  static const String id = 'StartScreenV2';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Start'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: double.infinity,
          ),
          Container(
            padding: EdgeInsets.only(bottom: 30),
//            child: Image(
//              image: AssetImage('images/mozka.icon.jpg'),
//            ),
            child: Text(
              'Mozka',
              style: TextStyle(fontSize: 60, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: GestureDetector(
              child: Container(
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                  color: Colors.blue,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      'Registreer',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ),
              onTap: () =>
                  Navigator.pushNamed(context, RegistrationScreenMain.id),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: GestureDetector(
              child: Container(
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                  color: Colors.lightBlueAccent,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ),
              onTap: () => Navigator.pushNamed(context, LoginScreenMain.id),
            ),
          ),
        ],
      ),
    );
  }
}
