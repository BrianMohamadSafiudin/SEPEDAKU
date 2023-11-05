import 'package:easy_localization/easy_localization.dart';
import 'package:sepedaku/components/background.dart';
import 'package:sepedaku/components/locale/locale_keys.g.dart';
import 'package:sepedaku/screens/login/login_screen.dart';
import 'package:sepedaku/components/rounded_button.dart';
import 'package:sepedaku/screens/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatefulWidget {
  const Body({Key? key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String selectedLanguage = 'id';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            alignment: Alignment.topRight,
            child: DropdownButton<String>(
              underline: Container(height: 0),
              dropdownColor: Color(0xffEAEEFF),
              elevation: 0,
              icon: Icon(null),
              value: selectedLanguage,
              items: <String>['en', 'id'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Image.asset(
                      value == 'en'
                          ? 'assets/images/inggris.png'
                          : 'assets/images/indonesia.png',
                      width: 40,
                      height: 40,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedLanguage = newValue!;
                  context.setLocale(Locale(selectedLanguage));
                });
              },
            ),
          ),
          SizedBox(height: 23),
          Image.asset(
            "assets/images/motor.png",
            height: size.height * 0.35,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Text(
                  LocaleKeys.title,
                  style: GoogleFonts.poppins(
                    fontSize: 35,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff1F41BB),
                  ),
                  textAlign: TextAlign.center,
                ).tr(),
                SizedBox(height: 23),
                Text(
                  LocaleKeys.subtitle,
                  style: GoogleFonts.poppins(fontSize: 14),
                  textAlign: TextAlign.center,
                ).tr(),
              ],
            ),
          ),
          SizedBox(height: 23),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundedButton(
                text: LocaleKeys.login,
                press: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LoginScreen();
                  }));
                },
                color: Color(0xff1F41BB),
                textColor: Colors.white,
                height: 55,
                width: 329,
              ),
              RoundedButton(
                text: LocaleKeys.register,
                press: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return RegisterScreen();
                  }));
                },
                color: Colors.transparent,
                textColor: Colors.black,
                height: 55,
                width: 329,
              )
            ],
          ),
          SizedBox(height: 23),
        ],
      ),
    );
  }
}
