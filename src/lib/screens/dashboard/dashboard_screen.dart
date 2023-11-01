import 'package:firebase_auth/firebase_auth.dart';
import 'package:sepedaku/screens/auth.dart';
import 'package:sepedaku/components/bottomNavBar.dart';
import 'package:sepedaku/screens/dashboard/components/body.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);
  
  final User? user = Auth().currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: BottomNavBar(currentIndex: 0),
    );
  }
}


