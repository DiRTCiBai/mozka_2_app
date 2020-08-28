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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          FlatButton(
            child: Text('Registreer'),
            onPressed: () =>
                Navigator.pushNamed(context, RegistrationScreenMain.id),
          ),
          FlatButton(
            child: Text('Login'),
            onPressed: () => Navigator.pushNamed(context, LoginScreenMain.id),
          ),
        ],
      ),
    );
  }
}
