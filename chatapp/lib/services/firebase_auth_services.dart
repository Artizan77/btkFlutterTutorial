import 'package:chatapp/model/user_model.dart';
import 'package:chatapp/services/auth_base.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService implements AuthBase {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<User> currentUser() async {
    try {
      FirebaseUser user = await _firebaseAuth.currentUser();
      return _userFromFirebase(user);
    } catch (e) {
      print("Error current user" + e.toString());
      return null;
    }
  }

  User _userFromFirebase(FirebaseUser user) {
    if (user == null) return null;
    return User(userID: user.uid);
  }

  @override
  Future<bool> signOut() async {
    try {
      final _googleSignIn = GoogleSignIn();
      await _googleSignIn.signOut();

      final _facebookLogin = FacebookLogin();
      await _facebookLogin.logOut();

      await _firebaseAuth.signOut();
      return true;
    } catch (e) {
      print("Error signout" + e.toString());
      return false;
    }
  }

  @override
  Future<User> singInAnonymously() async {
    try {
      AuthResult result = await _firebaseAuth.signInAnonymously();
      return _userFromFirebase(result.user);
    } catch (e) {
      print("Error Firebase_Auth signInAnonymously" + e.toString());
      return null;
    }
  }

  @override
  Future<User> signInWithGoogle() async {
    GoogleSignIn _googleSignIn = GoogleSignIn();
    GoogleSignInAccount _googleUser = await _googleSignIn.signIn();

    if (_googleUser != null) {
      GoogleSignInAuthentication _googleAuth = await _googleUser.authentication;
      if (_googleAuth.idToken != null && _googleAuth.accessToken != null) {
        AuthResult result = await _firebaseAuth.signInWithCredential(
            GoogleAuthProvider.getCredential(
                idToken: _googleAuth.idToken,
                accessToken: _googleAuth.accessToken));

        FirebaseUser _user = result.user;
        return _userFromFirebase(_user);
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  @override
  Future<User> signInWithFacebook() async {
    final _facebookLogin = FacebookLogin();
    FacebookLoginResult _facebookResult = await _facebookLogin
        .logInWithReadPermissions(['public_profile', 'email']);
    switch (_facebookResult.status) {
      case FacebookLoginStatus.loggedIn:
        if (_facebookResult.accessToken != null) {
          AuthResult _firebaseResult = await _firebaseAuth.signInWithCredential(
            FacebookAuthProvider.getCredential(
                accessToken: _facebookResult.accessToken.token),
          );

          FirebaseUser _user = _firebaseResult.user;
          return _userFromFirebase(_user);
        }

        break;

      case FacebookLoginStatus.cancelledByUser:
        print("User cancelled to Facebook Login");
        break;

      case FacebookLoginStatus.error:
        print("Error :" + _facebookResult.errorMessage);
        break;
    }
    return null;
  }

  @override
  Future<User> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return _userFromFirebase(result.user);
    } catch (e) {
      print(
          "Error Firebase_Auth createUserWithEmailAndPassword" + e.toString());
      return null;
    }
  }

  @override
  Future<User> signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return _userFromFirebase(result.user);
    } catch (e) {
      print("Error Firebase_Auth signInWithEmailAndPassword" + e.toString());
      return null;
    }
  }
}
