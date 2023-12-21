import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sepedaku/components/color.dart';
import 'package:sepedaku/components/locale/locale_keys.g.dart';
import 'package:sepedaku/provider/simProvider.dart';
import 'package:sepedaku/screens/transactions/components/rentalNow.dart';

class SelectSim extends StatefulWidget {
  final int index;
  const SelectSim({super.key, required this.index});

  @override
  State<SelectSim> createState() => _SelectSimState();
}

class _SelectSimState extends State<SelectSim> {
  int _selectedSimIndex = -1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Provider.of<SimProvider>(context, listen: false).fetchSavedSims();
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
          actions: _selectedSimIndex != -1
              ? [
                  IconButton(
                    icon: Icon(Icons.check),
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return RentalNowScreen(
                            index: widget.index, simIndex: _selectedSimIndex);
                      }));
                      print('Tombol Tambah Ditekan ${_selectedSimIndex}');
                    },
                  ),
                ]
              : null,
          title: Text(
            LocaleKeys.simSaved,
            style: GoogleFonts.poppins(fontSize: 20),
          ).tr(),
          backgroundColor: primaryColor,
        ),
        body: Consumer<SimProvider>(
            builder: (context, savedSimProvider, _) => SingleChildScrollView(
                child: savedSimProvider.savedSims.length == 0
                    ? Container(
                        height: size.height * 0.9,
                        alignment: Alignment.center,
                        child: Text(
                            'Silahkan Scan SIM di halaman akun terlebih dahulu!!!'),
                      )
                    : Container(
                        height: size.height * 0.9,
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,
                                  childAspectRatio: 3,
                                  mainAxisSpacing: 5),
                          itemCount: savedSimProvider.savedSims.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  _selectedSimIndex = index;
                                });
                              },
                              child: Card(
                                color: _selectedSimIndex == index
                                    ? Colors.grey
                                    : null,
                                child: Container(
                                  margin: EdgeInsets.all(16),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Radio<int>(
                                        value: index,
                                        activeColor: primaryColor,
                                        groupValue: _selectedSimIndex,
                                        onChanged: (value) {
                                          setState(() {
                                            _selectedSimIndex = value!;
                                          });
                                        },
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Image.file(File(
                                              savedSimProvider
                                                  .savedSims[index].simImage)),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 16),
                                          child: Text(
                                            savedSimProvider
                                                .savedSims[index].name,
                                            style: GoogleFonts.poppins(
                                                fontSize: 18,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        )))));
  }
}
