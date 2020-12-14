import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Blog Uygulaması",
      home: Iskele(),
    );
  }
}

class Iskele extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blog"),
      ),
      body: AnaEkran(),
    );
  }
}

class AnaEkran extends StatefulWidget {
  @override
  _AnaEkranState createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  String blogYazisi = ' Welcome to my blog';

  yaziGoster() {
    setState(() {
      blogYazisi = "Dedi naber";
    });
  }

  baskaGoster() {
    setState(() {
      blogYazisi = "Dedim iyidir";
    });
  }

  enBaskaGoster() {
    setState(() {
      blogYazisi = "Dedi ne dedi";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(blogYazisi),
            RaisedButton(
              onPressed: yaziGoster,
              child: Text("Naber"),
            ),
            RaisedButton(
              onPressed: baskaGoster,
              child: Text("İyidir"),
            ),
            RaisedButton(
              onPressed: enBaskaGoster,
              child: Text("Kim ne dedi dedi"),
            )
          ],
        ),
      ),
    );
  }
}
