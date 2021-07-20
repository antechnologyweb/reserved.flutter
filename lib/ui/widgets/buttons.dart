import 'package:btime/constant_vars.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActionButton extends StatelessWidget {
  final onPressed;
  final text;
  final color;
  ActionButton({this.onPressed, this.text, this.color});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: color,
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0)),
      ),
      onPressed: onPressed,
      child: SizedBox(
        width: 150,
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.roboto(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color:
                    color == activeButtonColor ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
}
