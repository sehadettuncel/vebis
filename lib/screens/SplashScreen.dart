import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vebis_app/constants/constants.dart';
import 'package:vebis_app/widgets/Api.dart';

import 'Home.dart';
import 'package:http/http.dart' as http;

import 'LoginPage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    login();
  }

  login() async {
    final data = await SharedPreferences.getInstance();
    String getData = data.getString("access_token");
    if (getData != null) {
      final response =
          await http.get(Uri.parse("https://api.vebisapp.com/login"));
      if (response.statusCode == 200) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      }
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
      print("Yanlış bilgi");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: kPink,
      body: Center(
        child: Text("Vebis", style: TextStyle(color: Colors.white, fontSize:24, fontWeight:kSemiBold),),
      ),
    );
  }
}
