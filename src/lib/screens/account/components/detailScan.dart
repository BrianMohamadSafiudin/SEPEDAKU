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

class DetailScanScreen extends StatefulWidget {
  final XFile? imageSim;
  const DetailScanScreen({super.key, this.imageSim});

  @override
  State<DetailScanScreen> createState() => _DetailScanScreenState();
}

class _DetailScanScreenState extends State<DetailScanScreen> {
  bool _isLoading = false;
  final TextEditingController licenseDriverController = TextEditingController();
  final TextEditingController simNumberController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dateBirthController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController workController = TextEditingController();
  final TextEditingController domisiliController = TextEditingController();
  final TextEditingController simPeriodController = TextEditingController();
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
                child: widget.imageSim != null
                    ? Image.file(File(widget.imageSim!.path))
                    : Center(child: Text('Tidak ada gambar!'))),
            Container(
              height: size.height * 0.53,
              child: FormScan(
                licenseDriverController: licenseDriverController,
                simNumberController: simNumberController,
                nameController: nameController,
                dateBirthController: dateBirthController,
                addressController: addressController,
                genderController: genderController,
                workController: workController,
                domisiliController: domisiliController,
                simPeriodController: simPeriodController,
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
              _isLoading
                  ? ElevatedButton(
                      onPressed: null,
                      child: CircularProgressIndicator(),
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(141, 45),
                          backgroundColor: primaryColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    )
                  : RoundedButton(
                      text: LocaleKeys.save,
                      press: () async {
                        setState(() {
                          _isLoading = true;
                        });
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
                              simImage: widget.imageSim!.path,
                              driverLicense: licenseDriverController.text,
                              simNumber: simNumberController.text,
                              name: nameController.text,
                              dateBirth: dateBirthController.text,
                              gender: genderController.text,
                              address: addressController.text,
                              work: workController.text,
                              domisili: domisiliController.text,
                              simPeriod: simPeriodController.text,
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
                            setState(() {
                              _isLoading = false;
                            });
                          }
                        } else {
                          print('User not authenticated');
                        }
                        setState(() {
                          _isLoading = false;
                        });
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
  final TextEditingController licenseDriverController;
  final TextEditingController simNumberController;
  final TextEditingController nameController;
  final TextEditingController dateBirthController;
  final TextEditingController genderController;
  final TextEditingController addressController;
  final TextEditingController workController;
  final TextEditingController domisiliController;
  final TextEditingController simPeriodController;
  const FormScan({
    super.key,
    required this.licenseDriverController,
    required this.simNumberController,
    required this.nameController,
    required this.dateBirthController,
    required this.genderController,
    required this.addressController,
    required this.workController,
    required this.domisiliController,
    required this.simPeriodController,
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
                title: LocaleKeys.licenseDriver,
                textController: licenseDriverController.text),
          ),
          Container(
            height: size.height * 0.1,
            child: ChildInForm(
                title: LocaleKeys.numberSIM,
                textController: simNumberController.text),
          ),
          Container(
            height: size.height * 0.1,
            child: ChildInForm(
                title: LocaleKeys.name, textController: nameController.text),
          ),
          Container(
            height: size.height * 0.1,
            child: ChildInForm(
                title: LocaleKeys.birth,
                textController: dateBirthController.text),
          ),
          Container(
            height: size.height * 0.1,
            child: ChildInForm(
                title: LocaleKeys.gender,
                textController: genderController.text),
          ),
          Container(
            height: size.height * 0.1,
            child: ChildInForm(
                title: LocaleKeys.address,
                textController: addressController.text),
          ),
          Container(
            height: size.height * 0.1,
            child: ChildInForm(
                title: LocaleKeys.job, textController: workController.text),
          ),
          Container(
            height: size.height * 0.1,
            child: ChildInForm(
                title: 'Domisili', textController: domisiliController.text),
          ),
          Container(
            height: size.height * 0.1,
            child: ChildInForm(
                title: LocaleKeys.driverLicensePeriod,
                textController: simPeriodController.text),
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
