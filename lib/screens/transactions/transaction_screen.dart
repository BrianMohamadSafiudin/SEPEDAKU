import 'package:sepedaku/components/bottomNavBar.dart';
import 'package:sepedaku/screens/transactions/components/body.dart';
import 'package:flutter/material.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: BottomNavBar(currentIndex: 1),
    );
  }
}

