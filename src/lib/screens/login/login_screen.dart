import 'package:provider/provider.dart';
import 'package:sepedaku/components/lang/language.provider.dart';
import 'package:sepedaku/screens/login/components/body.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    return Scaffold(
      body: Body(selectedLanguage: languageProvider.selectedLanguage),
    );
  }
}
