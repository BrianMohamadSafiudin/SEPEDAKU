import 'package:provider/provider.dart';
import 'package:sepedaku/components/background.dart';
import 'package:sepedaku/components/lang/language.provider.dart';
import 'package:sepedaku/screens/login/login_screen.dart';
import 'package:sepedaku/components/rounded_button.dart';
import 'package:sepedaku/screens/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sepedaku/components/lang/language_translations.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String selectedLanguage = 'en'; // Bahasa default

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
                  Provider.of<LanguageProvider>(context, listen: false)
                    .changeLanguage(selectedLanguage);
                });
              },
            ),
          ),
          SizedBox(
            height: 23,
          ),
          Image.asset(
            "assets/images/motor.png",
            height: size.height * 0.35,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Text(
                  getTranslatedValue('title'),
                  style: GoogleFonts.poppins(
                      fontSize: 35,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff1F41BB)),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 23,
                ),
                Text(
                  getTranslatedValue('subtitle'),
                  style: GoogleFonts.poppins(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 23,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundedButton(
                text: getTranslatedValue('login'),
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
                text: getTranslatedValue('register'),
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
          SizedBox(
            height: 23,
          ),
        ],
      ),
    );
  }

  String getTranslatedValue(String key) {
    return languages[selectedLanguage]![key] ?? 'Translation not found';
  }
}
