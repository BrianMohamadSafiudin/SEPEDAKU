import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Header_LoginRegister extends StatelessWidget {
  final String judul, subJudul;
  const Header_LoginRegister({
    required this.judul,
    required this.subJudul,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            judul,
            style: GoogleFonts.poppins(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xff1F41BB)),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 26),
          Text(
            subJudul,
            style:
                GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
