import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:google_sign_in/google_sign_in.dart';

enum UserStatus { Idle, NotLoggedIn, LoggingIn, LoggedIn }

class UserRepository with ChangeNotifier {
  FirebaseAuth _firebaseAuth;
  FirebaseUser _firebaseUser;
  UserStatus _userStatus = UserStatus.Idle;
  GoogleSignIn _googleSignIn;

  UserRepository() {
    _firebaseAuth = FirebaseAuth.instance;
    _googleSignIn = GoogleSignIn();
    _firebaseAuth.onAuthStateChanged.listen(_onAuthStateChanged);
  }

  UserStatus get userStatus => _userStatus;

  set userStatus(UserStatus value) {
    _userStatus = value;
  }

  FirebaseUser get firebaseUser => _firebaseUser;

  set firebaseUser(FirebaseUser value) {
    _firebaseUser = value;
  }

  FirebaseAuth get firebaseAuth => _firebaseAuth;

  set firebaseAuth(FirebaseAuth value) {
    _firebaseAuth = value;
  }

  Future<bool> signIn(String mail, String password) async {
    try {
      _userStatus = UserStatus.LoggingIn;
      notifyListeners();
      await _firebaseAuth.signInWithEmailAndPassword(email: mail, password: password);
      return true;
    } catch (e) {
      _userStatus = UserStatus.NotLoggedIn;
      debugPrint("Giriş yaparken hata: $e");
      return false;
    }
  }

  signInWithGoogle() async {
    try {
      _userStatus = UserStatus.LoggingIn;
      notifyListeners();
      final GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.getCredential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);
      await _firebaseAuth.signInWithCredential(authCredential);
      return true;
    } catch (e) {
      _userStatus = UserStatus.NotLoggedIn;
      notifyListeners();
      debugPrint("Google ile giriş hatası: $e");
    }
  }

  Future signOut() async {
    _firebaseAuth.signOut();
    _googleSignIn.signOut();
    _userStatus = UserStatus.NotLoggedIn;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  Future<void> _onAuthStateChanged(FirebaseUser user) async {
    if (await user == null) {
      _userStatus = UserStatus.NotLoggedIn;
    } else {
      _firebaseUser = user;
      _userStatus = UserStatus.LoggedIn;
    }
    notifyListeners();
  }
}
