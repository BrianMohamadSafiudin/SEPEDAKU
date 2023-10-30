import 'package:sepedaku/components/background.dart';
import 'package:sepedaku/screens/login/login_screen.dart';
import 'package:sepedaku/components/rounded_button.dart';
import 'package:sepedaku/screens/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
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
                  'MotoRental Malang City',
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
                  'innovative motorcycle rental application designed to make your travels effortless',
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
                text: "Login",
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
                text: "Register",
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
}
