import 'package:easy_localization/easy_localization.dart';
import 'package:sepedaku/components/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonBottomAppBar extends StatelessWidget {
  final void Function()? press;
  final IconData icon;
  final String title;
  final bool isActive;
  const ButtonBottomAppBar(
      {super.key,
      required this.press,
      required this.icon,
      required this.title,
      this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: press,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isActive ? primaryColor : Colors.grey,
          ),
          Text(
            title,
            style: GoogleFonts.poppins(color: isActive ? primaryColor : Colors.grey, fontSize: 11),
          ).tr()
        ],
      ),
      style:
          ElevatedButton.styleFrom(backgroundColor: Colors.white, elevation: 0),
    );
  }
}
