import 'package:sepedaku/components/backgroundAccount.dart';
import 'package:sepedaku/components/color.dart';
import 'package:sepedaku/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: BackgroundAccount(
      child: ListView(
        children: [
          HeaderProfileAccount(),
          Container(
            height: size.height * 0.55,
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FormAccount(
                  title: 'Username',
                  obscureText: false,
                  controller: TextEditingController(text: 'Edward'),
                  keyboardType: TextInputType.text,
                ),
                FormAccount(
                  title: 'Email',
                  obscureText: false,
                  controller: TextEditingController(text: 'edward@gmail.com'),
                  keyboardType: TextInputType.emailAddress,
                ),
                FormAccount(
                  title: 'Password',
                  obscureText: true,
                  controller: TextEditingController(text: 'Marinus24'),
                  keyboardType: TextInputType.visiblePassword,
                ),
                FormAccount(
                  title: 'Confirm Password',
                  controller: TextEditingController(text: 'Marinus24'),
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                ),
                RoundedButton(
                    text: 'Update',
                    press: () {},
                    color: primaryColor,
                    textColor: Colors.white,
                    height: 40,
                    width: 283),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

class HeaderProfileAccount extends StatelessWidget {
  const HeaderProfileAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 25),
      height: size.height * 0.38,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    )),
                Text(
                  "Edit Profile",
                  style: GoogleFonts.poppins(fontSize: 22, color: Colors.white),
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 134,
                    width: 134,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        "assets/images/cipung.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Change Picture',
                      style: GoogleFonts.poppins(
                          color: Colors.black, fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FormAccount extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  const FormAccount({
    required this.title,
    required this.controller,
    required this.keyboardType,
    required this.obscureText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style:
                GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          TextFormField(
            obscureText: obscureText,
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
        ],
      ),
    );
  }
}
