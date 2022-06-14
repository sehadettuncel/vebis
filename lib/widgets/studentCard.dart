import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vebis_app/constants/constants.dart';

class student_card extends StatelessWidget {
  final String name;
  final String last_name;
  final int number;
  //final String sinif;
  final String profile_photo;
  final int should_be_hungry;
  final String title;
  final String description;
  final int status;
  final String date;
  
  

   const student_card({
    Key key, this.name ,this.last_name, this.number, this.should_be_hungry, this.title, this.description, this.status, this.profile_photo, this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin:EdgeInsets.only(bottom:15),
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
              CircleAvatar(
                  radius: 23,
                  backgroundColor: kGrey,
                  child: CircleAvatar(
                    radius: 23,
                    backgroundImage: NetworkImage(profile_photo),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$name $last_name ",
                      style: GoogleFonts.inter(
                          fontWeight: kSemiBold,
                          fontSize: kMidFontSize),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "$date - ${should_be_hungry==1 ? "aç karnına" : "tok karnına"}",
                      style: GoogleFonts.inter(
                          color: kGrey, fontWeight: kMedium),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("$title ${status==0 ? "verilmedi":"verildi"}",
                    style: GoogleFonts.inter(
                        fontWeight: kMedium,
                        fontSize: kMidFontSize)),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "$description",
                  style: GoogleFonts.inter(
                      color: kGrey, fontWeight: kMedium),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}