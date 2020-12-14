import 'package:chatapp/model/user_model.dart';
import 'package:chatapp/services/auth_base.dart';

class FakeAuthenticationService implements AuthBase {
  String userID = "12312312321321";

  @override
  Future<User> currentUser() async {
    return await Future.value(User(userID: userID));
  }

  @override
  Future<bool> signOut() {
    return Future.value(true);
  }

  @override
  Future<User> singInAnonymously() async {
    return await Future.delayed(
      Duration(seconds: 2),
      () => User(userID: userID),
    );
  }

  @override
  Future<User> signInWithGoogle() {
    return null;
  }

  @override
  Future<User> signInWithFacebook() {
    return null;
  }

  @override
  Future<User> createUserWithEmailAndPassword(String email, String password) {
    return null;
  }

  @override
  Future<User> signInWithEmailAndPassword(String email, String password) {
    return null;
  }
}
