import 'package:sepedaku/components/background.dart';
import 'package:sepedaku/components/button_loginGoogle.dart';
import 'package:sepedaku/components/header_loginRegister.dart';
import 'package:sepedaku/screens/login/login_screen.dart';
import 'package:sepedaku/screens/register/components/form.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
              margin: EdgeInsets.symmetric(vertical: 29),
              child: Header_LoginRegister(
                  judul: "Register", subJudul: "Create Account!")),
          FormRegister(),
          SizedBox(height: 12),
          Column(
            children: [
              Text(
                "Or",
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
                "Already have an account? ",
                style: GoogleFonts.poppins(
                    fontSize: 14, fontWeight: FontWeight.w600),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return LoginScreen();
                    }));
                  },
                  child: Text(
                    "Sign in",
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff1F41BB),
                        decoration: TextDecoration.underline),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
