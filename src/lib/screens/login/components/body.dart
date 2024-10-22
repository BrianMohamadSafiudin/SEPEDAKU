import 'package:easy_localization/easy_localization.dart';
import 'package:sepedaku/components/background.dart';
import 'package:sepedaku/components/button_loginGoogle.dart';
import 'package:sepedaku/components/header_loginRegister.dart';
import 'package:sepedaku/components/locale/locale_keys.g.dart';
import 'package:sepedaku/screens/login/components/form.dart';
import 'package:sepedaku/screens/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatelessWidget {
  const Body({Key? key});

  @override
  Widget build(BuildContext context) {
    return Background(
        child: ListView(
      shrinkWrap: true,
      children: <Widget>[
        Container(
            margin: EdgeInsets.symmetric(vertical: 29),
            child: Header_LoginRegister(
                judul: LocaleKeys.titleLogin,
                subJudul: LocaleKeys.subtitleLogin)),
        FormLogin(),
        SizedBox(height: 12),
        Column(
          children: [
            Text(
              LocaleKeys.or,
              style: GoogleFonts.poppins(
                  fontSize: 14, fontWeight: FontWeight.w600),
            ).tr(),
            SizedBox(height: 12),
            ButtonLoginGoogle()
          ],
        ),
        SizedBox(height: 29),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              LocaleKeys.donthaveaccount,
              style: GoogleFonts.poppins(
                  fontSize: 14, fontWeight: FontWeight.w600),
            ).tr(),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return RegisterScreen();
                  },
                ));
              },
              child: Text(
                LocaleKeys.signup,
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff1F41BB),
                    decoration: TextDecoration.underline),
              ).tr(),
            )
          ],
        )
      ],
    ));
  }
}
