import 'dart:io';

import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:sepedaku/components/color.dart';
import 'package:sepedaku/components/locale/locale_keys.g.dart';
import 'package:sepedaku/components/rounded_button.dart';
import 'package:sepedaku/model/simModel.dart';
import 'package:sepedaku/provider/simProvider.dart';
import 'package:sepedaku/screens/account/components/saveScan.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailScanScreen extends StatelessWidget {
  final XFile? imageSim;
  const DetailScanScreen({super.key, this.imageSim});

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
                child: imageSim != null
                    ? Image.file(File(imageSim!.path))
                    : Center(child: Text('Tidak ada gambar!'))),
            Container(
              height: size.height * 0.53,
              child: FormScan(),
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
                  text: LocaleKeys.save,
                  press: () async {
                    var savedSimProvider =
                        Provider.of<SimProvider>(context, listen: false);
                    final user = FirebaseAuth.instance.currentUser;

                    if (user != null) {
                      try {
                        var simCollectionRef = FirebaseFirestore.instance
                            .collection('sim')
                            .doc(user.uid)
                            .collection('simUser');
                        var newSimDocRef = simCollectionRef.doc();
                        SimModel sim = SimModel(
                          simImage: imageSim!.path,
                          driverLicense: 'C',
                          simNumber: '1002-9108-2828',
                          name: 'Edward Sunan Hutabarat',
                          dateBirth: 'Batam, 30-08-1999',
                          gender: 'Pria',
                          address: 'Kampung Seraya',
                          work: 'Wiraswasta',
                          simPeriod: '12 - 06 - 2028',
                        );

                        await newSimDocRef.set(sim.toMap());
                        savedSimProvider.addSim(sim);

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return SaveScanScreen();
                          }),
                        );
                      } catch (e) {
                        print('Error saving to Firestore: $e');
                      }
                    } else {
                      print('User not authenticated');
                    }
                  },
                  color: primaryColor,
                  textColor: Colors.white,
                  height: 45,
                  width: 141),
            ],
          )),
    );
  }
}

class FormScan extends StatelessWidget {
  const FormScan({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: size.height * 0.1,
            child: ChildInForm(
                title: LocaleKeys.licenseDriver, textController: 'C'),
          ),
          Container(
            height: size.height * 0.1,
            child: ChildInForm(
                title: LocaleKeys.numberSIM, textController: '1002-9108-2828'),
          ),
          Container(
            height: size.height * 0.1,
            child:
                ChildInForm(title: LocaleKeys.name, textController: 'Edward'),
          ),
          Container(
            height: size.height * 0.1,
            child: ChildInForm(
                title: LocaleKeys.birth, textController: 'Batam, 30-08-1999'),
          ),
          Container(
            height: size.height * 0.1,
            child:
                ChildInForm(title: LocaleKeys.gender, textController: 'Pria'),
          ),
          Container(
            height: size.height * 0.1,
            child: ChildInForm(
                title: LocaleKeys.address, textController: 'Kampung Seraya'),
          ),
          Container(
            height: size.height * 0.1,
            child: ChildInForm(
                title: LocaleKeys.job, textController: 'Wiraswasta'),
          ),
          Container(
            height: size.height * 0.1,
            child: ChildInForm(
                title: LocaleKeys.driverLicensePeriod,
                textController: '12-06-2028'),
          ),
        ],
      ),
    ));
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
