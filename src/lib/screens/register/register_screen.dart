import 'package:firebase_auth/firebase_auth.dart';
import 'package:sepedaku/auth.dart';

import 'package:sepedaku/screens/register/components/body.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
