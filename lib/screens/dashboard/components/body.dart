// import 'package:cobaprojek_ocr/screens/dashboard/components/background.dart';
import 'package:sepedaku/components/color.dart';
import 'package:sepedaku/screens/dashboard/components/rental_in_progress.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              height: size.height * 0.5,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [primaryColor, Color(0xff0BB4EF)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 43),
                  Text(
                    'Welcome,',
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w200),
                  ),
                  Text(
                    'Edward!',
                    style: GoogleFonts.poppins(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 11),
                  Container(
                    height: 230,
                    width: 343,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        color: Colors.white),
                  )
                ],
              ),
            ),
          ],
        ),
        RentalInProgress(),
      ],
    );
  }
}
