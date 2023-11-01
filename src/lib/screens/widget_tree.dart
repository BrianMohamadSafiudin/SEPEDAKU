import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sepedaku/screens/auth.dart';
import 'package:sepedaku/screens/dashboard/dashboard_screen.dart';
import 'package:sepedaku/screens/account/account_screen.dart';
import 'package:sepedaku/screens/account/components/body.dart';
import 'package:sepedaku/screens/login/login_screen.dart';
import 'package:sepedaku/screens/login/components/form.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return DashboardScreen();
        } else {
          return LoginScreen();
        }
      }
    );
  }
}
