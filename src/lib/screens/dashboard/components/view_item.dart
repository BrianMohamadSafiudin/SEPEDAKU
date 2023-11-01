import 'package:easy_localization/easy_localization.dart';
import 'package:sepedaku/components/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sepedaku/components/locale/locale_keys.g.dart';

class ViewItemScreen extends StatelessWidget {
  const ViewItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: primaryColor,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back))),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: Container(
              height: size.height * 0.5,
              width: double.infinity,
              margin: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                        child: Center(
                            child: Image.asset('assets/images/kawasaki.png'))),
                  ),
                  Text(
                    'Kawasaki ZX 25R - N 9933 KL',
                    style: GoogleFonts.poppins(fontSize: 26),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Text(LocaleKeys.orderby).tr(),
                          Text(' Edward Sunan Hutabarat'),
                        ],
                      ),
                      Text(
                        'Rp. 250.000',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '28/10/2023 18:00',
                    style: GoogleFonts.poppins(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '-',
                    style: GoogleFonts.poppins(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '29/10/2023 18:00',
                    style: GoogleFonts.poppins(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
