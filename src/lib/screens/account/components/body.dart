import 'package:firebase_auth/firebase_auth.dart';
import 'package:sepedaku/auth.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:sepedaku/components/backgroundAccount.dart';
import 'package:sepedaku/components/color.dart';
import 'package:sepedaku/components/locale/locale_keys.g.dart';
import 'package:sepedaku/components/rounded_button.dart';
import 'package:sepedaku/screens/account/components/profile.dart';
import 'package:sepedaku/screens/account/components/saveScan.dart';
import 'package:sepedaku/screens/account/components/scan.dart';
import 'package:sepedaku/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  final User? user = Auth().currentUser;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackgroundAccount(
        child: Column(
      children: [
        HeaderBodyAccount(),
        SizedBox(height: size.height * 0.05),
        Container(
          height: size.height * 0.5,
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: MenuAccount(),
        ),
      ],
    ));
  }
}

class MenuAccount extends StatelessWidget {
  MenuAccount({Key? key}) : super(key: key);

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ButtonAccount(
          press: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditProfileScreen(),
                ));
          },
          icon: Icons.person,
          title: LocaleKeys.editProfile,
        ),
        SizedBox(height: 16),
        ButtonAccount(
          press: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ScanScreen(),
                ));
          },
          icon: Icons.qr_code_scanner,
          title: LocaleKeys.scanSIM,
        ),
        SizedBox(height: 16),
        ButtonAccount(
          press: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SaveScanScreen(),
                ));
          },
          icon: Icons.save,
          title: LocaleKeys.simSaved,
        ),
        Spacer(),
        RoundedButton(
          text: LocaleKeys.logout,
          press: () {
            // Panggil metode signOut saat tombol "Sign Out" ditekan
            signOut().then((_) {
              // Navigasi ke layar sambutan (welcome screen)
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      WelcomeScreen(), // Ganti dengan nama layar sambutan yang sesuai
                ),
                (route) => false, // Hapus semua tumpukan layar sebelumnya
              );
            });
          },
          color: Color(0xffff0000),
          textColor: Colors.white,
          height: 40,
          width: 283,
        )
      ],
    );
  }
}

class HeaderBodyAccount extends StatelessWidget {
  const HeaderBodyAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 45),
      height: size.height * 0.28,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              LocaleKeys.account,
              style: GoogleFonts.poppins(fontSize: 22, color: Colors.white),
            ).tr(),
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
          ],
        ),
      ),
    );
  }
}

class ButtonAccount extends StatelessWidget {
  final void Function() press;
  final IconData icon;
  final String title;
  const ButtonAccount({
    super.key,
    required this.press,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          press();
        },
        style: ElevatedButton.styleFrom(
            fixedSize: Size.fromHeight(50), backgroundColor: primaryColor),
        child: Row(
          children: [
            Icon(icon),
            SizedBox(width: 8),
            Text(
              title,
              style: GoogleFonts.poppins(fontSize: 18),
            ).tr()
          ],
        ));
  }
}
