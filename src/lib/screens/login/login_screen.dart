import 'package:firebase_auth/firebase_auth.dart';
import 'package:sepedaku/screens/auth.dart';
import 'package:provider/provider.dart';
import 'package:sepedaku/components/lang/language.provider.dart';
import 'package:sepedaku/screens/login/components/body.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    return Scaffold(
      body: Body(selectedLanguage: languageProvider.selectedLanguage),
    );
  }
}
