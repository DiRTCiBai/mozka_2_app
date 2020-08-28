import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mozka_2_app/versie_2/screens/home_screen/main/home_screen_main.dart';

class RegistrationScreenMain extends StatelessWidget {
  static const String id = 'RegistrationScreenMain';

  final _auth = FirebaseAuth.instance;

  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)),
        title: Text('Registreer'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'email',
            ),
            onChanged: (value) {
              email = value;
            },
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'wachtwoord',
            ),
            onChanged: (value) {
              password = value;
            },
          ),
          FlatButton(
            child: Text('registreer'),
            onPressed: () async {
              try {
                final user = await _auth.createUserWithEmailAndPassword(
                    email: email, password: password);
                if (user != null) {
                  Navigator.pushNamed(context, HomeScreenMain.id);
                }
              } catch (e) {
                print(e);
              }
            },
          ),
        ],
      ),
    );
  }
}
