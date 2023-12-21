import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:sepedaku/components/color.dart';
import 'package:sepedaku/components/locale/locale_keys.g.dart';
import 'package:sepedaku/model/transactionModel.dart';
import 'package:sepedaku/provider/motorProvider.dart';
import 'package:sepedaku/provider/simProvider.dart';
import 'package:sepedaku/provider/transactionProvider.dart';
import 'package:sepedaku/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sepedaku/screens/transactions/components/selectSim.dart';

class RentalNowScreen extends StatefulWidget {
  final int index;
  final int simIndex;
  const RentalNowScreen(
      {super.key, required this.index, required this.simIndex});

  @override
  State<RentalNowScreen> createState() => _RentalNowScreenState();
}

class _RentalNowScreenState extends State<RentalNowScreen> {
  DateTime? _selectedStartDateTime;
  DateTime? _selectedEndDateTime;
  late TextEditingController helmController;
  late TextEditingController lokasiController;

  @override
  void initState() {
    super.initState();
    helmController = TextEditingController();
    lokasiController = TextEditingController();
  }

  @override
  void dispose() {
    helmController.dispose();
    lokasiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<MotorProvider>(
      builder: (context, savedMotorProvider, _) => Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Checkout',
            style: GoogleFonts.poppins(),
          ),
        ),
        body: ListView(
          children: [
            Container(
              height: size.height * 0.25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Container(
                          margin: EdgeInsets.all(16),
                          child: Image.asset(
                              '${savedMotorProvider.savedMotors[widget.index].imageMotor}'))),
                  Expanded(
                    child: Container(
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
                              savedMotorProvider
                                  .savedMotors[widget.index].deskripsi
                                  .toString()
                                  .replaceAll(r'\n', '\n'),
                              style: GoogleFonts.poppins(),
                              maxLines: 7,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: size.height * 0.24,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: size.height * 0.05,
                    alignment: Alignment.centerLeft,
                    color: primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Text(
                        LocaleKeys.chooseSim,
                        style: GoogleFonts.poppins(
                            fontSize: 18, color: Colors.white),
                      ).tr(),
                    ),
                  ),
                  Expanded(
                    child: Consumer<SimProvider>(
                      builder: (context, simIndexSaved, _) {
                        if (simIndexSaved.savedSims.isNotEmpty) {
                          return Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    child: Image.file(File(
                                        '${simIndexSaved.savedSims[widget.simIndex].simImage}')),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 8),
                                            child: Text(
                                              simIndexSaved
                                                  .savedSims[widget.simIndex]
                                                  .name,
                                              style: GoogleFonts.poppins(
                                                  fontSize: 18,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            Navigator.pushReplacement(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return SelectSim(
                                                  index: widget.index);
                                            }));
                                          },
                                          icon: Icon(Icons.arrow_forward_ios),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          // Return a placeholder or an empty widget
                          return Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                      // child: Image.asset(
                                      //   simIndexSaved.savedSims[0].simImage,
                                      // ),
                                      ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          child: Container(
                                              // margin: EdgeInsets.symmetric(
                                              //     horizontal: 8),
                                              // child: Text(
                                              //   'SIM Edward Sunan Hutabarat',
                                              //   style: GoogleFonts.poppins(
                                              //       fontSize: 18,
                                              //       color: Colors.black),
                                              // ),
                                              ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            Navigator.pushReplacement(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return SelectSim(
                                                  index: widget.index);
                                            }));
                                          },
                                          icon: Icon(Icons.arrow_forward_ios),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: size.height * 0.14,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: size.height * 0.05,
                    alignment: Alignment.centerLeft,
                    color: primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Text(
                        LocaleKeys.startDate,
                        style: GoogleFonts.poppins(
                            fontSize: 18, color: Colors.white),
                      ).tr(),
                    ),
                  ),
                  TextFormField(
                    readOnly: true,
                    controller: TextEditingController(
                      text: _selectedStartDateTime != null
                          ? DateFormat.yMd()
                              .add_jm()
                              .format(_selectedStartDateTime!)
                          : '',
                    ),
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: LocaleKeys.hintStartDate.tr(),
                    ),
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2099),
                      );

                      if (pickedDate != null) {
                        TimeOfDay? pickedTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );

                        if (pickedTime != null) {
                          setState(() {
                            _selectedStartDateTime = DateTime(
                              pickedDate.year,
                              pickedDate.month,
                              pickedDate.day,
                              pickedTime.hour,
                              pickedTime.minute,
                            );
                          });
                        }
                      }
                    },
                  )
                ],
              ),
            ),
            Container(
              height: size.height * 0.14,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: size.height * 0.05,
                    alignment: Alignment.centerLeft,
                    color: primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Text(
                        LocaleKeys.finishDate,
                        style: GoogleFonts.poppins(
                            fontSize: 18, color: Colors.white),
                      ).tr(),
                    ),
                  ),
                  TextFormField(
                    readOnly: true,
                    controller: TextEditingController(
                      text: _selectedEndDateTime != null
                          ? DateFormat.yMd()
                              .add_jm()
                              .format(_selectedEndDateTime!)
                          : '',
                    ),
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: LocaleKeys.hintFinishDate.tr(),
                    ),
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2099),
                      );

                      if (pickedDate != null) {
                        TimeOfDay? pickedTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );

                        if (pickedTime != null) {
                          setState(() {
                            _selectedEndDateTime = DateTime(
                              pickedDate.year,
                              pickedDate.month,
                              pickedDate.day,
                              pickedTime.hour,
                              pickedTime.minute,
                            );
                          });
                        }
                      }
                    },
                  )
                ],
              ),
            ),
            Container(
              height: size.height * 0.14,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: size.height * 0.05,
                    alignment: Alignment.centerLeft,
                    color: primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Text(
                        'Request Helm',
                        style: GoogleFonts.poppins(
                            fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: helmController,
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(), hintText: 'Max 2!!!'),
                  )
                ],
              ),
            ),
            Container(
              height: size.height * 0.14,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: size.height * 0.05,
                    alignment: Alignment.centerLeft,
                    color: primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Text(
                        'Lokasi',
                        style: GoogleFonts.poppins(
                            fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: lokasiController,
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: 'Masukkan koordinat google map..'),
                  )
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
            height: size.height * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 235,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        LocaleKeys.totalPayment,
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w300),
                      ).tr(),
                      Text(
                        'Rp. ${savedMotorProvider.savedMotors[widget.index].harga}',
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    var transactionProvider = Provider.of<TransactionProvider>(
                        context,
                        listen: false);
                    int? helmRequest = int.tryParse(helmController.text);
                    var simProvider =
                        Provider.of<SimProvider>(context, listen: false);
                    final user = FirebaseAuth.instance.currentUser;
                    if (user != null) {
                      if (helmRequest == null ||
                          _selectedStartDateTime == null ||
                          _selectedEndDateTime == null ||
                          lokasiController.text.isEmpty) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Missing Information'),
                              content: Text(LocaleKeys.alertEmptyField.tr()),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                        return; // Return to prevent further execution
                      }
                      try {
                        TransactionModel trans = TransactionModel(
                            motor: savedMotorProvider
                                .savedMotors[widget.index].motor,
                            imageMotor: savedMotorProvider
                                .savedMotors[widget.index].imageMotor,
                            nama: simProvider.savedSims[widget.simIndex].name,
                            mulaiRental: _selectedStartDateTime!,
                            selesaiRental: _selectedEndDateTime!,
                            helm: helmRequest!,
                            totalPembayaran: savedMotorProvider
                                .savedMotors[widget.index].harga,
                            lokasi: lokasiController.text);
                        transactionProvider.addTransactionToFirebase(trans);
                        transactionProvider.addTransaction(trans);

                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return DashboardScreen();
                        }));
                      } catch (e) {
                        print('Error saving to Firestore: $e');
                      }
                    }
                  },
                  child: Text(
                    'Checkout Now',
                    style: GoogleFonts.poppins(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size.square(150),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero),
                      backgroundColor: primaryColor),
                )
              ],
            )),
      ),
    );
  }
}
