import 'package:burcrehberi/burc_detay.dart';
import 'package:flutter/material.dart';

import 'burc_liste.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Burç Rehberi',
      debugShowCheckedModeBanner: false,
      initialRoute: "/burcListesi",
      routes: {
        "/": (context) => BurcListesi(),
        "/burcListesi": (context) => BurcListesi(),
      },
      onGenerateRoute: (RouteSettings settings) {
        List<String> pathElemanlari = settings.name.split("/");
        if (pathElemanlari[1] == 'burcDetay') {
          return MaterialPageRoute(
            builder: (context) => BurcDetay(int.parse(
              pathElemanlari[2],
            )),
          );
        }
        return null;
      },
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
    );
  }
}
