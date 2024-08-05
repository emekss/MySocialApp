/*
AUTHENTICATION SERVICE

- Login
- Register
- Logout
- Delete account (required to publish app to app store)


*/

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //get instance of the auth
  final _auth = FirebaseAuth.instance;

  //get current user $ uid
  User? getCurrentUser() => _auth.currentUser;
  String getCurrentUid() => _auth.currentUser!.uid;

  // login -> email & pw
  Future<UserCredential> loginEmailPassword(String email, password) async {
    //attempt login
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      return userCredential;
    }

    //catch errors
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // register -> email & pw
  Future<UserCredential> registerEmailPassword(String email, password) async {
    //attempt register
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential;
    }

    //catch errors
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // logout
  Future<void> logout() async {
    await _auth.signOut();
  }
}
