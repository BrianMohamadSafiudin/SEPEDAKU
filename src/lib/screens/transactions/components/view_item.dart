import 'package:easy_localization/easy_localization.dart';
import 'package:sepedaku/components/color.dart';
import 'package:sepedaku/components/locale/locale_keys.g.dart';
import 'package:sepedaku/screens/transactions/components/rentalNow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewItemScreen extends StatelessWidget {
  const ViewItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Column(children: [
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
                                  child: Image.asset(
                                      'assets/images/kawasaki.png'))),
                        ),
                        Text(
                          'Kawasaki ZX 25R - N 9933 KL',
                          style: GoogleFonts.poppins(fontSize: 26),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Rp. 250.000',
                          style: TextStyle(fontSize: 20, color: primaryColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  )),
            ],
          ),
          Card(
            child: Container(
              margin: EdgeInsets.all(8),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Deskripsi',
                      style: GoogleFonts.poppins(
                          fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 8),
                    Text(
                        'Kawasaki ZX-25R motor sport 250 cc tahun 2020\n\nKondisi:\n\nMesin: Sehat dan terawat\nRangka: Tidak ada penyok atau karat\nSuspensi: Empuk dan tidak bocor\nRem: Aman dan berfungsi dengan baik\nBan: Masih tebal dan tidak ada tambalan'),
                  ]),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return RentalNowScreen();
            }));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.motorcycle),
              SizedBox(width: 12),
              Text(
                LocaleKeys.rentalNow,
                style: GoogleFonts.poppins(fontSize: 18),
              ).tr(),
              SizedBox(width: 12),
              Icon(Icons.motorcycle),
            ],
          ),
          style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              fixedSize: Size.fromHeight(55),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
        ),
      ),
    );
  }
}
