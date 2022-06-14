import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vebis_app/constants/constants.dart';

Widget BuildAppBar(String name) {
  return AppBar(elevation: 0,
  title: Text(
  name,
  style: GoogleFonts.inter(color: kBlack, fontWeight: kSemiBold),
  ),
  iconTheme: IconThemeData(color: kBlack),
  backgroundColor: Colors.white,
  );
}


