import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sepedaku/components/locale/locale_keys.g.dart';

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
        LocaleKeys.loginwithgoogle,
        style: GoogleFonts.poppins(color: Colors.black),
      ).tr(),
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
