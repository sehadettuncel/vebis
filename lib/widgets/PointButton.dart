import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vebis_app/constants/constants.dart';

class pointButton extends StatefulWidget {
  final int student_point;
  final BorderRadius radius;
  final int number;
  final Function onPressed;

  pointButton({
    Key key,
    this.radius,
    this.number,
    this.student_point,
    this.onPressed,
  }) : super(key: key);

  @override
  State<pointButton> createState() => _pointButtonState();
}

class _pointButtonState extends State<pointButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.number == widget.student_point ? kPurple : Colors.white,
        borderRadius: widget.radius,
        border: Border.all(color: kPurple, width: 1),
      ),
      width: 40,
      height: 40,
      child: Center(
        child: TextButton(
          onPressed: () {
            widget.onPressed();
          },
          child: Text(
          "${widget.number}",
            style: GoogleFonts.inter(
                color: widget.number == widget.student_point
                    ? Colors.white
                    : kPurple),
          ),
        ),
      ),
    );
  }
}
