import 'package:facedetection/models/user.dart';
import 'package:facedetection/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //  auth change user stream
  Stream<UserId> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  //  create user base on firebaseUser
  UserId _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? UserId(uid: user.uid) : null;
  }

//sign in with email and password
  Future signInEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (err) {
      print('Error in signInEmailAndPassword - ' + err.toString());
      return null;
    }
  }

// sign up with email and password
  Future signUpEmailAndPassword(String email, String password, String name, String lastname) async {
    try {
      AuthResult result =
          await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;

      await DatabaseService(uid: user.uid).createUser(name, lastname);

      return _userFromFirebaseUser(user);
    } catch (err) {
      print('Error in signUpEmailAndPassword - ' + err.toString());
      return null;
    }
  }

// sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (err) {
      print('Error in signOut - ' + err.toString());
      return null;
    }
  }
}
