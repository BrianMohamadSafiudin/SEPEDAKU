import 'package:easy_localization/easy_localization.dart';
import 'package:sepedaku/components/form_inputEemail.dart';
import 'package:sepedaku/components/form_inputPassword.dart';
import 'package:sepedaku/components/locale/locale_keys.g.dart';
import 'package:sepedaku/components/rounded_button.dart';
import 'package:sepedaku/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormLogin extends StatelessWidget {
  const FormLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        height: size.height * 0.52,
        child: Column(
          children: [
            Spacer(),
            FormInputEmail(),
            SizedBox(height: 26),
            FormInputPassword(label: "Password"),
            Container(
              alignment: Alignment(1, 1),
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    LocaleKeys.forgotPassword,
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Color(0xff1F41BB),
                        fontWeight: FontWeight.w600),
                  ).tr()),
            ),
            Spacer(),
            RoundedButton(
                text: LocaleKeys.signin,
                press: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DashboardScreen();
                  }));
                },
                color: Color(0xff1F41BB),
                textColor: Colors.white,
                height: 60,
                width: 357),
          ],
        ),
      ),
    );
  }
}
