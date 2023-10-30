import 'package:sepedaku/components/bottomNavBar.dart';
import 'package:sepedaku/screens/dashboard/components/body.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: BottomNavBar(currentIndex: 0),
    );
  }
}


