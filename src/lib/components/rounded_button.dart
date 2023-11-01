import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final void Function()? press;
  final Color color, textColor;
  final double height, width;
  const RoundedButton({
    super.key,
    required this.text,
    required this.press,
    required this.color,
    required this.textColor,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: press,
      child: Text(
        text,
        style: GoogleFonts.poppins(
            color: textColor, fontWeight: FontWeight.w600, fontSize: 20),
      ).tr(),
      style: ElevatedButton.styleFrom(
          fixedSize: Size(width, height),
          backgroundColor: color,
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    );
  }
}
