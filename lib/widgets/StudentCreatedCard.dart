import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vebis_app/constants/constants.dart';
import 'package:vebis_app/widgets/StudentCreatedCard.dart';

import 'PointButton.dart';
import 'buildButton.dart';

class StudentCreatedCard extends StatefulWidget {
  final student;
  const StudentCreatedCard({
    Key key,
    this.student,
  }) : super(key: key);

  @override
  State<StudentCreatedCard> createState() => _StudentCreatedCardState();
}

class _StudentCreatedCardState extends State<StudentCreatedCard> {
  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
            Text("Katılım Durumu:"+"${widget.student['point']}",
                style: GoogleFonts.inter(
                    fontWeight: kMedium, fontSize: kMidFontSize)),
            SizedBox(
              height: 10,
            ),
            
           
            Text("Öğretmen Yorumu:"+"${widget.student['comment']}",
                style: GoogleFonts.inter(
                    fontWeight: kMedium, fontSize: kMidFontSize)),
           
           
        
          ],
        ),
      ),
    );
    
  } 
 
}
