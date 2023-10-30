import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonLoginGoogle extends StatelessWidget {
  const ButtonLoginGoogle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: SvgPicture.asset("assets/icons/google.svg"),
      label: Text(
        "Login with google",
        style: GoogleFonts.poppins(color: Colors.black),
      ),
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(8)),
          fixedSize: Size(305, 50)),
    );
  }
}
