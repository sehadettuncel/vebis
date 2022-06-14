import 'package:flutter/material.dart';

import 'package:vebis_app/screens/Home.dart';
import 'package:vebis_app/screens/SplashScreen.dart';

import 'screens/LoginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Vebis App",
      theme: ThemeData(fontFamily: 'inter'),
      initialRoute: "/splashscreen",
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        "/splashscreen":(BuildContext context) => new SplashScreen(),
        "/login": (BuildContext context) => new Login(),
        "/home" : (BuildContext context) => new Home(),

      },
    );
  }
}
