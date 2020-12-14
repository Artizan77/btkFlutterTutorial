import 'package:chatapp/model/user_model.dart';

abstract class AuthBase {
  Future<User> currentUser();
  Future<User> singInAnonymously();
  Future<bool> signOut();
  Future<User> signInWithGoogle();
  Future<User> signInWithFacebook();
  Future<User> signInWithEmailAndPassword(String email, String password);
  Future<User> createUserWithEmailAndPassword(String email, String password);
}
