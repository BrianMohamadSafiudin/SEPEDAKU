import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import 'package:sepedaku/components/color.dart';
import 'package:sepedaku/components/locale/locale_keys.g.dart';
import 'package:sepedaku/provider/motorProvider.dart';
import 'package:sepedaku/screens/transactions/components/rentalNow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewItemScreen extends StatelessWidget {
  final int index;
  const ViewItemScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Consumer<MotorProvider>(
        builder: (context, savedMotorProvider, _) => ListView(
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
                                        '${savedMotorProvider.savedMotors[index].imageMotor}'))),
                          ),
                          Text(
                            '${savedMotorProvider.savedMotors[index].motor}',
                            style: GoogleFonts.poppins(fontSize: 26),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Rp. ${savedMotorProvider.savedMotors[index].harga}',
                                style: TextStyle(
                                    fontSize: 20, color: primaryColor),
                              ),
                              Text(
                                  'Stok : ${savedMotorProvider.savedMotors[index].stok}',
                                  style: TextStyle(
                                      fontSize: 20, color: primaryColor))
                            ],
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
                      Text(savedMotorProvider.savedMotors[index].deskripsi
                          .toString()
                          .replaceAll(r'\n', '\n')),
                    ]),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return RentalNowScreen(index: index, simIndex: 0);
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
