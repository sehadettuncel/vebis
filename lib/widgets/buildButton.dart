import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vebis_app/constants/constants.dart';


class BuildButton extends StatefulWidget {
  final String buttonText;
  final Color backgrandcolorButton;
  final Color buttonTextColor;
  final Function onpressed;

  const BuildButton({
    Key key,
    this.buttonText,
    this.backgrandcolorButton,
    this.buttonTextColor, this.onpressed,
  }) : super(key: key);

  @override
  _BuildButtonState createState() => _BuildButtonState();
}

class _BuildButtonState extends State<BuildButton> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
 

    return Form(
      key: _formKey,
      child: FlatButton(
        color: widget.backgrandcolorButton,
        onPressed: widget.onpressed,
        child: Text(
          widget.buttonText,
          style: GoogleFonts.inter(
              fontSize: kMidFontSize,
              fontWeight: kMedium,
              color: widget.buttonTextColor),
        ),
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(12.0)),
      ),
    );
  }
}
