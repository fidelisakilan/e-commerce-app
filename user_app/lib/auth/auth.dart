import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  MyUser _userFromFireBaseUser(User user) {
    return user != null
        ? MyUser(uid: user.uid, displayName: user.displayName)
        : null;
  }

  Stream<MyUser> get user {
    return _auth
        .authStateChanges()
        .map((event) => _userFromFireBaseUser(event));
  }

  Future signInWithEmailAndPassword(String email, String pass) async {
    try {
      UserCredential result =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);
      User user = result.user;
      return _userFromFireBaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future registerWithEmailAndPassword(
      String email, String pass, String name) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: pass);
      _auth.currentUser.updateProfile(
        displayName: name,
      );
      User user = result.user;
      return _userFromFireBaseUser(user);
    } catch (e) {
      print(e.message);
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

class MyUser {
  final String uid;
  final String displayName;
  MyUser({this.uid, this.displayName});
}
