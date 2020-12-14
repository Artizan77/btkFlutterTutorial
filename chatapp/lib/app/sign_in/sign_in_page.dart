import 'package:chatapp/app/sign_in/sign_with_email_password.dart';
import 'package:chatapp/common_widget/social_login_button.dart';
import 'package:chatapp/model/user_model.dart';
import 'package:chatapp/viewmodel/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  void _questLogin(BuildContext context) async {
    final _userModel = Provider.of<UserModel>(context);
    User _user = await _userModel.singInAnonymously();

    print("Oturum açan user id:" + _user.userID.toString());
  }

  void _signInWithGoogle(BuildContext context) async {
    final _userModel = Provider.of<UserModel>(context);
    User _user = await _userModel.signInWithGoogle();
    if (_user != null) print("Oturum açan user id:" + _user.userID.toString());
  }

  void _signInWithFacebook(BuildContext context) async {
    final _userModel = Provider.of<UserModel>(context);
    User _user = await _userModel.signInWithFacebook();
    if (_user != null) print("Oturum açan user id:" + _user.userID.toString());
  }

  void _signInWithEmailAndPassword(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => SignInEmailAndPassword(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat App"),
        elevation: 0,
      ),
      backgroundColor: Colors.grey.shade200,
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "Oturum Açın",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8,
            ),
            SocialLoginButton(
              buttonText: "Gmail ile Giriş Yap",
              textColor: Colors.black87,
              buttonColor: Colors.white,
              buttonIcon: Image.asset("images/google-logo.png"),
              onPressed: () => _signInWithGoogle(context),
            ),
            SocialLoginButton(
              buttonText: "Facebook ile Giriş Yap",
              buttonIcon: Image.asset("images/facebook-logo.png"),
              onPressed: () => _signInWithFacebook(context),
              buttonColor: Color(0xFF334D92),
            ),
            SocialLoginButton(
              onPressed: () => _signInWithEmailAndPassword(context),
              buttonIcon: Icon(
                Icons.email,
                color: Colors.white,
                size: 32,
              ),
              buttonText: "Email ve Şifre ile Giriş yap",
            ),
            SocialLoginButton(
              onPressed: () => _questLogin(context),
              buttonIcon: Icon(Icons.supervised_user_circle),
              buttonText: "Misafir Girişi",
              buttonColor: Colors.teal,
            ),
          ],
        ),
      ),
    );
  }
}
