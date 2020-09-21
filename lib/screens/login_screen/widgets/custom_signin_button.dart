import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'file:///D:/AndroidstudioProjects/mozka_v2.1_app/lib/screens/home_screen/main_home_screen.dart';

class CustomSignInButton extends StatelessWidget {
  final String email;
  final String password;
  final auth = FirebaseAuth.instance;

  CustomSignInButton({this.email, this.password});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          print(this.password);
          try {
            final user = await auth.signInWithEmailAndPassword(
                email: email, password: password);

            if (user != null) {
              Navigator.pushNamed(context, HomeScreenMain.id);
            }
          } catch (e) {
            print(e);
          }
        },
      ),
    );
  }
}
