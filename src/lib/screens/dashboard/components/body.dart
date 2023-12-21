import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sepedaku/components/color.dart';
import 'package:sepedaku/components/locale/locale_keys.g.dart';
import 'package:sepedaku/screens/dashboard/components/rental_in_progress.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatefulWidget {
  Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final List<String> imageNames = [
    'motor1.png',
    'motor2.png',
    'motor3.png',
    'motor4.png',
  ];
  late PageController _pageController;
  int _currentPage = 0;
  late Timer _timer;
  final user = FirebaseAuth.instance.currentUser;
  late FirebaseFirestore _firestore;
  late CollectionReference _usersCollection;
  late String userName;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);

    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < imageNames.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
    userName = '...';
    _firestore = FirebaseFirestore.instance;
    _usersCollection = _firestore.collection('users');
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    try {
      DocumentSnapshot userData = await _usersCollection.doc(user!.uid).get();
      setState(() {
        userName = userData['username'];
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              height: size.height * 0.5,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [primaryColor, Color(0xff0BB4EF)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 43),
                  Text(
                    LocaleKeys.welcome,
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w200),
                  ).tr(),
                  Text(
                    userName + ' !',
                    style: GoogleFonts.poppins(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 11),
                  Container(
                      height: 230,
                      width: size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          color: Colors.white),
                      child: PageView.builder(
                          controller: _pageController,
                          itemCount: imageNames.length,
                          itemBuilder: (context, index) {
                            return Image.asset(
                              'assets/images/slideshow/${imageNames[index]}',
                              fit: BoxFit.contain,
                            );
                          }))
                ],
              ),
            ),
          ],
        ),
        RentalInProgress(),
      ],
    );
  }
}
