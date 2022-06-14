import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:vebis_app/constants/constants.dart';
import 'package:vebis_app/constants/inputStyle.dart';
import 'package:vebis_app/widgets/Api.dart';
import 'package:http/http.dart' as http;

import 'package:vebis_app/widgets/buildButton.dart';

import 'Home.dart';

class Login extends StatefulWidget {
  const Login({
    Key key,
  }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final api = new Api();
  String email;
  String password;
  String accessToken = "";
  var inputStyle = new InputStyle();

  @override
  initState() {
    super.initState();
    
  }



  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  post() {
    api.post('/login', {
      'email': email,
      'password': password,
    }).then((res) async {
      var response = jsonDecode(res.body);
      // print(response);
      if (response["access_token"] != null) {
        final data = await SharedPreferences.getInstance();
        accessToken = response["access_token"];
        data.setString("access_token", accessToken);
        //print(accessToken);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      } else {
        print("Böyle bir kulllanıcı yok");
      }

      // SharedPreferences,a kaydet
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text("Login",
                      style: GoogleFonts.inter(
                          color: kBlack,
                          fontSize: kMaxFontSize,
                          fontWeight: kSemiBold)),
                  SizedBox(
                    height: 100,
                  ),
                  TextFormField(
                      onSaved: (value) {
                        this.email = value;

                        print(email);
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: inputStyle.decoration("E-mail")),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                      onSaved: (value) {
                        password = value;
                        print(password);
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: inputStyle.decoration("Password")),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                      width: size.width,
                      height: 55,
                      child: BuildButton(
                        buttonText: 'Login',
                        backgrandcolorButton: kPurple,
                        buttonTextColor: Colors.white,
                        onpressed: () {
                          validateAndSave();
                          post();
                        },
                      )),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Forgot Pasword?",
                    style: GoogleFonts.inter(
                        color: kPurple,
                        fontWeight: kSemiBold,
                        fontSize: kMidFontSize),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don’t have an account yet?",
                          style: GoogleFonts.inter(
                              color: kGrey,
                              fontSize: kMidFontSize,
                              fontWeight: kMedium)),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Sign Up",
                          style: GoogleFonts.inter(
                              color: kPurple,
                              fontSize: kMidFontSize,
                              fontWeight: kMedium),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
