import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login_flutter/models/userclass.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user object based on firerbase object
  Userclass? _userFromFirebaseUser(User? user) {
    return user != null ? Userclass(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<Userclass?> get user {
    return _auth
        .authStateChanges()
        //.map((User? user) => _userFromFirebaseUser(user!));
        .map(_userFromFirebaseUser);
  }

  //  sign with anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user!;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email & password
  Future signInemailpassword() async {
    try {} catch (e) {}
  }
  // register with email and password

  //sign out
  Future signout() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
