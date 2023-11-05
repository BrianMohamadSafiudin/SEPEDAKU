import 'package:firebase_auth/firebase_auth.dart';
import 'package:sepedaku/auth.dart';

import 'package:sepedaku/screens/login/components/body.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
