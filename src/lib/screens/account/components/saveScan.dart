import 'package:easy_localization/easy_localization.dart';
import 'package:sepedaku/components/color.dart';
import 'package:sepedaku/components/locale/locale_keys.g.dart';
import 'package:sepedaku/screens/account/account_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sepedaku/screens/account/components/detailScan.dart';

class SaveScanScreen extends StatelessWidget {
  const SaveScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return AccountScreen();
            }));
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          LocaleKeys.simSaved,
          style: GoogleFonts.poppins(fontSize: 20),
        ).tr(),
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: size.height * 0.9,
          child: GridView.builder(
            itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, childAspectRatio: 3, mainAxisSpacing: 5),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DetailScanScreen();
                  }));},
                child: Card(
                  child: Container(
                    margin: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/images/sim.png",
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'SIM Edward Sunan Hutabarat',
                              style: GoogleFonts.poppins(
                                  fontSize: 18, color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
