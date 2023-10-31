import 'package:sepedaku/components/bottomNavBar.dart';
import 'package:sepedaku/screens/account/components/body.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: BottomNavBar(currentIndex: 2),
    );
  }
}
