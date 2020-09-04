import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mozka_2_app/versie_2/screens/login_screen/widgets/custom_signin_button.dart';
import 'package:mozka_2_app/versie_2/screens/login_screen/widgets/custom_emailfield.dart';
import 'package:mozka_2_app/versie_2/screens/login_screen/widgets/custom_passwordfield.dart';

class LoginScreenMain extends StatefulWidget {
  static const String id = 'LoginScreenMain';

  @override
  _LoginScreenMainState createState() => _LoginScreenMainState();
}

class _LoginScreenMainState extends State<LoginScreenMain> {
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
            child: Image(
              width: 300,
              image: AssetImage('images/MozkaLogo.png'),
            ),
          ),
          CustomEmailField(
            onChanged: (value) {
              setState(() {
                email = value;
              });
            },
          ),
          CustomPasswordField(
            onChanged: (value) {
              setState(() {
                password = value;
              });
            },
          ),
          CustomSignInButton(
            email: email,
            password: password,
          ),
        ],
      ),
    );
  }
}
