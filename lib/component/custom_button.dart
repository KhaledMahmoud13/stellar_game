import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final void Function() action;
  final Color color;
  final Color borderColor;

  const RoundedButton({
    super.key,
    required this.text,
    required this.action,
    required this.color,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        action();
      },
      child: Container(
        width: 150,
        height: 40,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: borderColor,
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}