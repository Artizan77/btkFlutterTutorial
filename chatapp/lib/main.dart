import 'package:chatapp/app/langing_page.dart';
import 'package:chatapp/locator.dart';
import 'package:chatapp/viewmodel/user_model.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: null,
      builder: (context) => UserModel(),
      child: MaterialApp(
          title: 'Chat App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: LandingPage()),
    );
  }
}
