import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vebis_app/constants/constants.dart';

import 'package:vebis_app/screens/GenerateReport.dart';


import 'Api.dart';
import 'buildButton.dart';

class BuildActivityCard extends StatefulWidget {
  final String activity_name;
  final String activity_id;
  final String class_id;
  

  const BuildActivityCard({
    Key key,
    this.activity_name, this.activity_id, this.class_id, 
  }) : super(key: key);

  @override
  State<BuildActivityCard> createState() => _BuildActivityCardState();
}

class _BuildActivityCardState extends State<BuildActivityCard> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20.0, right: 20, top: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.activity_name,
              style: GoogleFonts.inter(
                  color: kMavi, fontWeight: kMedium, fontSize: kMidFontSize),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: 40,
                  child: BuildButton(
                    buttonText: "Rapor Oluştur",
                    backgrandcolorButton: kMavi,
                    buttonTextColor: Colors.white,
                    onpressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GenerateReport(
                                    activity_id : widget.activity_id,
                                    activity_name: widget.activity_name,
                                    class_id : widget.class_id,
                                  )));
                    },
                  )),
            )
          ],
        ),
      ),
    );
  }
}
