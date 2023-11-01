import 'package:firebase_auth/firebase_auth.dart';
import 'package:sepedaku/screens/auth.dart';
import 'package:sepedaku/components/bottomNavBar.dart';
import 'package:sepedaku/screens/account/components/body.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({Key? key}) : super(key: key);

  final User? user = Auth().currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: BottomNavBar(currentIndex: 2),
    );
  }
}
