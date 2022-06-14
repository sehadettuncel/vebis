import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vebis_app/constants/constants.dart';
import 'package:vebis_app/widgets/StudentCreatedCard.dart';

import 'Api.dart';
import 'PointButton.dart';
import 'buildButton.dart';

class StudentReportCard extends StatefulWidget {
  final student;
  final date;
  final activity_id;
  const StudentReportCard({
    Key key,
    this.student,
    this.date, this.activity_id,
  }) : super(key: key);

  @override
  State<StudentReportCard> createState() => _StudentReportCardState();
}

class _StudentReportCardState extends State<StudentReportCard> {
  final api = new Api();
  var response;
  post() {
    api.post('/create-report', {
      "student_id": widget.student["student_id"],
      "comment": widget.student["comment"],
      "point": widget.student["point"],
      "date": widget.date,
      "activity_id": widget.activity_id,
    }).then((res) async {
      setState(() {
        widget.student["created"]=true;
        
      });
    });
  }

  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    if(widget.student["created"]==true){
      return StudentCreatedCard(student: widget.student);
    }
    return Container(
      width: double.infinity,
      height: 350,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(blurRadius: 12, spreadRadius: 5, color: Colors.grey[300]),
          ],
          border: Border.all(color: Colors.grey.shade200, width: 1),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              widget.student['full_name'],
              style: GoogleFonts.inter(
                  fontWeight: kSemiBold, fontSize: kMidFontSize),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Katılım Durumu",
                style: GoogleFonts.inter(
                    fontWeight: kMedium, fontSize: kMidFontSize)),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: pointButton(
                    number: 1,
                    student_point: widget.student["point"],
                    radius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                    onPressed: () {
                      setState(() {
                        widget.student["point"] = 1;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: pointButton(
                    number: 2,
                    student_point: widget.student["point"],
                    onPressed: () {
                      setState(() {
                        widget.student["point"] = 2;
                      });
                    },
                  ),
                ),
                Expanded(
                    child: pointButton(
                  number: 3,
                  student_point: widget.student["point"],
                  onPressed: () {
                    setState(() {
                      widget.student["point"] = 3;
                    });
                  },
                )),
                Expanded(
                    child: pointButton(
                  number: 4,
                  student_point: widget.student["point"],
                  onPressed: () {
                    setState(() {
                      widget.student["point"] = 4;
                    });
                  },
                )),
                Expanded(
                  child: pointButton(
                    number: 5,
                    student_point: widget.student["point"],
                    onPressed: () {
                      setState(() {
                        widget.student["point"] = 5;
                      });
                    },
                    radius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text("Öğretmen Yorumu",
                style: GoogleFonts.inter(
                    fontWeight: kMedium, fontSize: kMidFontSize)),
            SizedBox(
              height: 10,
            ),
            Form(
              key: globalFormKey,
              child: TextFormField(
                  onSaved: (value) {setState(() {
                    widget.student["comment"] = value;
                  });
                    
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 16),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: Colors.black54, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide:
                          BorderSide(color: Colors.grey.shade200, width: 1),
                    ),
                  )),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              height: 50,
              child: BuildButton(
                buttonText: "${widget.student['full_name']} için Raporu Gönder",
                backgrandcolorButton: kPink,
                buttonTextColor: Colors.white,
                onpressed: () {
                  validateAndSave();
                  post();
                  print(widget.student);

                  // TODO: yorumu, puanı ve ogrencı ıd'sını ve rapor tarıhını alıp
                  // bır endpoınte post request atacaksın
                  // daha sonra request sonucu status code 200 donerse
                  // bu kartı created=true olan gorunume donustureceksın
                  // 200 donmezse ekranda hata mesajı uyarısı gosterebılırsın
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;

    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
