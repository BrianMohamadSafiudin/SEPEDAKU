import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import 'package:sepedaku/components/locale/locale_keys.g.dart';
import 'package:sepedaku/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sepedaku/provider/simProvider.dart';

class DetailSaveScanScreen extends StatelessWidget {
  final String imagePath;
  final int currentIndex;
  const DetailSaveScanScreen(
      {super.key, required this.imagePath, required this.currentIndex});

  void deleteScan(BuildContext context) {
    Provider.of<SimProvider>(context, listen: false).removeSim(currentIndex);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 12),
                height: size.height * 0.3,
                child: Image.file(File(imagePath)),
              ),
              Container(
                height: size.height * 0.53,
                child: FormScan(
                  currentIndex: currentIndex,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
            height: size.height * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RoundedButton(
                    text: LocaleKeys.back,
                    press: () {
                      Navigator.pop(context);
                    },
                    color: Colors.white,
                    textColor: Colors.black,
                    height: 45,
                    width: 141),
                RoundedButton(
                    text: LocaleKeys.delete.tr(),
                    press: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(LocaleKeys.alertDelete).tr(),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(LocaleKeys.no).tr()),
                              TextButton(
                                  onPressed: () {
                                    deleteScan(context);
                                    Navigator.pop(context);
                                  },
                                  child: Text(LocaleKeys.yes).tr())
                            ],
                          );
                        },
                      );
                    },
                    color: Colors.red,
                    textColor: Colors.white,
                    height: 45,
                    width: 141),
              ],
            )));
  }
}

class FormScan extends StatelessWidget {
  final int currentIndex;
  const FormScan({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<SimProvider>(builder: (context, simProvider, _) {
      return Form(
          child: SingleChildScrollView(
        child: Column(
          children: [
            // Text(currentIndex.toString()),
            Container(
              height: size.height * 0.1,
              child: ChildInForm(
                  title: LocaleKeys.licenseDriver,
                  textController:
                      simProvider.savedSims[currentIndex].driverLicense),
            ),
            Container(
              height: size.height * 0.1,
              child: ChildInForm(
                  title: LocaleKeys.numberSIM,
                  textController:
                      simProvider.savedSims[currentIndex].simNumber),
            ),
            Container(
              height: size.height * 0.1,
              child: ChildInForm(
                  title: LocaleKeys.name,
                  textController: simProvider.savedSims[currentIndex].name),
            ),
            Container(
              height: size.height * 0.1,
              child: ChildInForm(
                  title: LocaleKeys.birth,
                  textController:
                      simProvider.savedSims[currentIndex].dateBirth),
            ),
            Container(
              height: size.height * 0.1,
              child: ChildInForm(
                  title: LocaleKeys.gender,
                  textController: simProvider.savedSims[currentIndex].gender),
            ),
            Container(
              height: size.height * 0.1,
              child: ChildInForm(
                  title: LocaleKeys.address,
                  textController: simProvider.savedSims[currentIndex].address),
            ),
            Container(
              height: size.height * 0.1,
              child: ChildInForm(
                  title: LocaleKeys.job,
                  textController: simProvider.savedSims[currentIndex].work),
            ),
            Container(
              height: size.height * 0.1,
              child: ChildInForm(
                  title: 'Domisili',
                  textController: simProvider.savedSims[currentIndex].domisili),
            ),
            Container(
              height: size.height * 0.1,
              child: ChildInForm(
                  title: LocaleKeys.driverLicensePeriod,
                  textController:
                      simProvider.savedSims[currentIndex].simPeriod),
            ),
          ],
        ),
      ));
    });
  }
}

class ChildInForm extends StatelessWidget {
  final String title, textController;
  const ChildInForm({
    super.key,
    required this.title,
    required this.textController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(),
        ).tr(),
        TextFormField(
          controller: TextEditingController(text: textController),
          readOnly: true,
        )
      ],
    );
  }
}
