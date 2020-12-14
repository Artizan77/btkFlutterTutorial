import 'package:chatapp/common_widget/social_login_button.dart';
import 'package:chatapp/model/user_model.dart';
import 'package:chatapp/viewmodel/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum FormType { Register, Login }

class SignInEmailAndPassword extends StatefulWidget {
  @override
  _SignInEmailAndPasswordState createState() => _SignInEmailAndPasswordState();
}

class _SignInEmailAndPasswordState extends State<SignInEmailAndPassword> {
  String _email, _password;
  String _buttonText, _linkText;
  var _formType = FormType.Login;

  final _formKey = GlobalKey<FormState>();

  void _formSubmit() async {
    _formKey.currentState.save();
    debugPrint("email :" + _email + " password :" + _password);
    final _userModel = Provider.of<UserModel>(context);

    if (_formType == FormType.Login) {
      User _loginUser =
          await _userModel.signInWithEmailAndPassword(_email, _password);
      if (_loginUser != null)
        print("Oturum açan user id:" + _loginUser.userID.toString());
    } else {
      User _createdUser =
          await _userModel.createUserWithEmailAndPassword(_email, _password);
      if (_createdUser != null)
        print("Oturum açan user id:" + _createdUser.userID.toString());
    }
  }

  void _changePage() {
    setState(() {
      _formType =
          _formType == FormType.Login ? FormType.Register : FormType.Login;
    });
  }

  @override
  Widget build(BuildContext context) {
    _buttonText = _formType == FormType.Login ? "Login" : "Register";
    _linkText =
        _formType == FormType.Login ? "Have not an account? Join Us." : "Login";
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[],
        title: Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail),
                    hintText: 'Email',
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (newValue) {
                    _email = newValue;
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail),
                    hintText: 'Password',
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (newValue) {
                    _password = newValue;
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                SocialLoginButton(
                  buttonText: _buttonText,
                  onPressed: () => _formSubmit(),
                  radius: 10,
                  buttonColor: Theme.of(context).primaryColor,
                ),
                SizedBox(
                  height: 10,
                ),
                FlatButton(
                  onPressed: () => _changePage(),
                  child: Text(_linkText),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
