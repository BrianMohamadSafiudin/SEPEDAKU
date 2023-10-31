import 'package:sepedaku/components/background.dart';
import 'package:sepedaku/components/button_loginGoogle.dart';
import 'package:sepedaku/components/header_loginRegister.dart';
import 'package:sepedaku/components/lang/language_translations.dart';
import 'package:sepedaku/screens/login/components/form.dart';
import 'package:sepedaku/screens/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatefulWidget {
  final String selectedLanguage;

  const Body({Key? key, required this.selectedLanguage}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late String selectedLanguage;

  @override
  void initState() {
    super.initState();
    selectedLanguage = widget.selectedLanguage;
  }

  @override
  Widget build(BuildContext context) {
    return Background(
        child: ListView(
      shrinkWrap: true,
      children: <Widget>[
        Container(
            margin: EdgeInsets.symmetric(vertical: 29),
            child: Header_LoginRegister(
                judul: getTranslatedValue('titleLogin'),
                subJudul: getTranslatedValue('subtitleLogin'))),
        FormLogin(),
        SizedBox(height: 12),
        Column(
          children: [
            Text(
              getTranslatedValue('or'),
              style: GoogleFonts.poppins(
                  fontSize: 14, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 12),
            ButtonLoginGoogle()
          ],
        ),
        SizedBox(height: 29),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              getTranslatedValue('dont have account'),
              style: GoogleFonts.poppins(
                  fontSize: 14, fontWeight: FontWeight.w600),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return RegisterScreen();
                    },
                  ));
                },
                child: Text(
                  getTranslatedValue('signup'),
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff1F41BB),
                      decoration: TextDecoration.underline),
                ))
          ],
        )
      ],
    ));
  }

  String getTranslatedValue(String key) {
    return languages[selectedLanguage]![key] ?? 'Translation not found';
  }
}
