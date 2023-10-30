import 'package:sepedaku/components/button_bottomAppBaR.dart';
import 'package:sepedaku/screens/account/account_screen.dart';
import 'package:sepedaku/screens/dashboard/dashboard_screen.dart';
import 'package:sepedaku/screens/transactions/transaction_screen.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  const BottomNavBar({
    required this.currentIndex,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 80,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ButtonBottomAppBar(
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DashboardScreen();
                }));
              },
              icon: Icons.home,
              title: 'Home',
              isActive: currentIndex == 0,
            ),
            ButtonBottomAppBar(
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TransactionScreen();
                }));
              },
              icon: Icons.list_alt,
              title: 'Transactions',
              isActive: currentIndex == 1,
            ),
            ButtonBottomAppBar(
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AccountScreen();
                }));
              },
              icon: Icons.person,
              title: 'Account',
              isActive: currentIndex == 2,
            ),
          ],
        ),
      ),
    );
  }
}
