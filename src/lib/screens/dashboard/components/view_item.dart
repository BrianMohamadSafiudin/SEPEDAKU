import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import 'package:sepedaku/components/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sepedaku/components/locale/locale_keys.g.dart';
import 'package:sepedaku/provider/transactionProvider.dart';

class ViewItemScreen extends StatelessWidget {
  final int index;
  const ViewItemScreen({super.key, required this.index});

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
      body: Consumer<TransactionProvider>(builder: (context, trans, _) {
        return Column(
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
                              child: Image.asset(
                                  trans.savedTransactions[index].imageMotor))),
                    ),
                    Text(
                      trans.savedTransactions[index].motor,
                      style: GoogleFonts.poppins(fontSize: 26),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(LocaleKeys.orderby.tr() + ' :'),
                            Text('${trans.savedTransactions[index].nama}'),
                          ],
                        ),
                        Text(
                          'Rp. ${trans.savedTransactions[index].totalPembayaran}',
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
                      '${DateFormat('dd-MM-yyyy HH:mm').format(trans.savedTransactions[index].mulaiRental)}',
                      style: GoogleFonts.poppins(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '-',
                      style: GoogleFonts.poppins(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${DateFormat('dd-MM-yyyy HH:mm').format(trans.savedTransactions[index].selesaiRental)}',
                      style: GoogleFonts.poppins(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Text('-\n COD ${trans.savedTransactions[index].lokasi}')
                  ],
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}
