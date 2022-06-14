import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vebis_app/constants/constants.dart';
import 'package:vebis_app/screens/Classroom.dart';


class BuildClassroomCard extends StatelessWidget {
   final String sinif_adi;
   final Function onpressed;
  const BuildClassroomCard({
    Key key, this.sinif_adi, this.onpressed,
  }) : super(key: key);

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
        padding: const EdgeInsets.only(
            left: 20.0, right: 20, top: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              sinif_adi,
              style: GoogleFonts.inter(
                  color: kMavi,
                  fontWeight: kMedium,
                  fontSize: kMidFontSize),
            ),
            Container(
                child: FlatButton(
                    color: kMavi,
                    shape: new RoundedRectangleBorder(
                        borderRadius:
                        new BorderRadius.circular(12.0)),
                    onPressed: onpressed,

                  
                    child: Text("Görüntüle",
                        style: GoogleFonts.inter(
                            color: Colors.white,
                            fontWeight: kMedium,
                            fontSize: kMidFontSize))))
          ],
        ),
      ),
    );
  }
}