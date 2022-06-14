import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vebis_app/constants/constants.dart';
import 'package:vebis_app/widgets/Api.dart';

import 'package:vebis_app/widgets/BuildAppBar.dart';
import 'package:vebis_app/widgets/PointButton.dart';
import 'package:vebis_app/widgets/StudentCreatedCard.dart';
import 'package:vebis_app/widgets/StudentReportCard.dart';
import 'package:vebis_app/widgets/buildButton.dart';

class GenerateReport extends StatefulWidget {
  final String activity_name;
  final String activity_id;
  final String class_id;

  const GenerateReport({Key key, this.activity_name, this.activity_id, this.class_id}) : super(key: key);

  @override
  _GenerateReportState createState() => _GenerateReportState();
}

class _GenerateReportState extends State<GenerateReport> {
  String getText() {
    return '${_dateTime.year}-${_dateTime.month}-${_dateTime.day}';
  }
    final api = new Api();
  var response;
  @override
  void initState() {
    super.initState();
    get();
  }

  get() async {
    api.post('/get-create-report', {
      "activity_id" : widget.activity_id,
      "classroom_id": widget.class_id,
      "date": getText(),
    }).then((res) async {
      setState(() {
        response = jsonDecode(res.body);
      });
      print(response);
    });
  }
DateTime _dateTime = DateTime.now();

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar(widget.activity_name),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Rapor oluştur",
                  style: GoogleFonts.inter(
                      fontSize: kMaxFontSize, fontWeight: kMedium),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Rapor Tarihi",
                  style: GoogleFonts.inter(
                      fontSize: kMidFontSize, fontWeight: kMedium),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 5,
                            color: Colors.grey[300]),
                      ],
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade200, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          getText(),
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w300,
                              fontSize: kMidFontSize,
                              color: kGrey),
                        ),
                        TextButton(
                          onPressed: () {
                            showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2001),
                                    lastDate: DateTime(2222))
                                .then((date) {
                              setState(() {
                                
                                _dateTime = date;
                                get();
                              });
                            });
                          },
                          child: Icon(
                            Icons.date_range,
                            color: kPurple,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: response!=null ? response.length : 0,
                    itemBuilder: (context, index) {
                     
                        return StudentReportCard(student: response[index], date: getText(), activity_id:widget.activity_id);
                      
                      
                      
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
