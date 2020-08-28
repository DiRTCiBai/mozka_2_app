import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mozka_2_app/versie_2/screens/home_screen/main/home_screen_main.dart';

class LoginScreenMain extends StatelessWidget {
  static const String id = 'LoginScreenMain';

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
        title: Text('Login'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
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
          Container(
            padding: EdgeInsets.only(bottom: 10),
            width: 350,
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                hintText: 'test@email.com',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onChanged: (value) {
                email = value;
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            width: 350,
            child: TextField(
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                hintText: 'wachtwoord',
              ),
              onChanged: (value) {
                password = value;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
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
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
              onTap: () async {
                try {
                  final user = await _auth.signInWithEmailAndPassword(
                      email: email, password: password);

                  if (user != null) {
                    Navigator.pushNamed(context, HomeScreenMain.id);
                  }
                } catch (e) {
                  print(e);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
