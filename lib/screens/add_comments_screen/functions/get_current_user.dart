import 'package:firebase_auth/firebase_auth.dart';

final _auth = FirebaseAuth.instance;

Future<User> GetCurrentUser() async {
  try {
    final user = _auth.currentUser;
    if (user != null) {
      print(user.email);
      return user;
    }
  } catch (e) {
    print(e);
  }
}
