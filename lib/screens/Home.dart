import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vebis_app/constants/constants.dart';
import 'package:vebis_app/widgets/Api.dart';
import 'package:vebis_app/widgets/BuildClassroomCard.dart';
import 'package:vebis_app/widgets/buildButton.dart';
import 'package:vebis_app/widgets/studentCard.dart';

import 'Classroom.dart';

class Home extends StatefulWidget {
  final String class_name;
  const Home({Key key, this.class_name}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final api = new Api();
  var response;
  @override
  void initState() {
    super.initState();
    get();
  }

  get() async {
    api.get('/teacher/dashboard').then((res) async {
      setState(() {
        response = jsonDecode(res.body);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print(response);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    "Öğretmen - Servet Tunçel",
                    style: GoogleFonts.inter(
                        fontSize: kMaxFontSize,
                        fontWeight: kSemiBold,
                        color: kBlack),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Bugünkü ilaçlar",
                  style: GoogleFonts.inter(
                      fontSize: kMidFontSize, fontWeight: kSemiBold),
                ),
                SizedBox(
                  height: 20,
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                 // scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: response != null ? response["medicines"].length : 0,

                  itemBuilder: (context, index) {
                   
                     return student_card(
                      name: response["medicines"][index]["student"]["name"],
                      last_name: response["medicines"][index]["student"]
                          ["last_name"],
                      number: response["medicines"][index]["student"]["number"],
                      should_be_hungry: response["medicines"][index]
                          ["should_be_hungry"],
                      title: response["medicines"][index]["title"],
                      description: response["medicines"][index]["decription"],
                      status: response["medicines"][index]["status"],
                     profile_photo: response["medicines"][index]["student"]["profile_photo"],
                      date: response["medicines"][index]["date"],
                      
                    );
                   
                  },
                ),
                Container(
                  width: size.width,
                  child: BuildButton(
                    buttonText: "+3 tane daha",
                    backgrandcolorButton: kPink,
                    buttonTextColor: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Sınıflarım",
                  style: GoogleFonts.inter(
                      fontWeight: kSemiBold, fontSize: kMidFontSize),
                ),
                SizedBox(
                  height: 15,
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                   // scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount:
                        response != null ? response["classes"].length : 0,
                    itemBuilder: (context, index) {
                      return BuildClassroomCard(
                          sinif_adi: response["classes"][index]["name"],
                          onpressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Classroom(
                                      class_id:response["classes"][index]["id"],
                                        class_name: response["classes"][index]
                                            ["name"])));
                          });
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
