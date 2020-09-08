import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mozka_2_app/versie_2/screens/login_screen/widgets/custom_emailfield.dart';
import 'package:mozka_2_app/versie_2/screens/login_screen/widgets/custom_passwordfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mozka_2_app/versie_2/screens/home_screen/main/home_screen_main.dart';
import 'package:loading_overlay/loading_overlay.dart';

bool _isLoading = false;

class LoginScreenMain extends StatefulWidget {
  static const String id = 'LoginScreenMain';

  @override
  _LoginScreenMainState createState() => _LoginScreenMainState();
}

class _LoginScreenMainState extends State<LoginScreenMain> {
  String email;
  bool _isLoading = false;
  String password;
  String error = '';

  @override
  Widget build(BuildContext context) {
    void CloseKeyboard() {
      FocusScopeNode currentFocus = FocusScope.of(context);

      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
      setState(() {
        _isLoading = true;
      });
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)),
        title: Text('Login'),
      ),
      body: LoadingOverlay(
        color: Colors.grey,
        isLoading: _isLoading,
        child: Column(
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
            Text(
              error,
              style: TextStyle(color: Colors.red),
            ),
            CustomSignInButton(
              email: email,
              password: password,
              onTap: () {
                CloseKeyboard();
                LogIn();
              },
            ),
          ],
        ),
      ),
    );
  }

  void LogIn() async {
    final auth = FirebaseAuth.instance;
    if (email != null && password != null) {
      try {
        final user = await auth.signInWithEmailAndPassword(
            email: email, password: password);

        if (user != null) {
          Navigator.pushNamed(context, HomeScreenMain.id);
        }
      } catch (e) {
        print(e);
        setState(() {
          error = 'wachtwoord of email is fout';
          _isLoading = false;
        });
      }
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }
}

class CustomSignInButton extends StatefulWidget {
  final String email;
  final String password;
  final Function onTap;

  CustomSignInButton({this.email, this.password, this.onTap});

  @override
  _CustomSignInButtonState createState() => _CustomSignInButtonState();
}

class _CustomSignInButtonState extends State<CustomSignInButton> {
  final auth = FirebaseAuth.instance;

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
        onTap: widget.onTap,
      ),
    );
  }
}
