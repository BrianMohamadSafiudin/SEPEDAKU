import 'package:firebase_auth/firebase_auth.dart';
import 'package:sepedaku/screens/auth.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:sepedaku/components/form_inputEemail.dart';
import 'package:sepedaku/components/form_inputPassword.dart';
import 'package:sepedaku/components/locale/locale_keys.g.dart';
import 'package:sepedaku/components/rounded_button.dart';
import 'package:sepedaku/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';

class FormLogin extends StatefulWidget {
  FormLogin({Key? key}) : super(key: key);

  @override
  _FormLoginState createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        setState(() {
          errorMessage = 'No user found for that email.';
        });
      } else if (e.code == 'wrong-password') {
        setState(() {
          errorMessage = 'Wrong password provided for that user.';
        });
      }
      setState(() {
        isLogin = false;
      });
    }
  }

  void createUserWithEmailAndPassword() {
    // Implement user registration logic here
  }

  Widget _entryField(String title, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
      ),
    );
  }

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : 'Humm ? $errorMessage');
  }

  Widget _submitButton() {
    return ElevatedButton(
      onPressed: isLogin ? signInWithEmailAndPassword : createUserWithEmailAndPassword,
      child: Text(isLogin ? 'Login' : 'Register'),
    );
  }

  Widget _loginOrRegisterButton() {
    return TextButton(
      onPressed: () {
        setState(() {
          isLogin = !isLogin;
        });
      },
      child: Text(isLogin ? 'Register' : 'Login'),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        height: size.height * 0.52,
        child: Column(
          children: [
            Spacer(),
            _entryField('email', _controllerEmail),
            SizedBox(height: 26),
            _entryField('password', _controllerPassword),
            _errorMessage(),
            _submitButton(),
            _loginOrRegisterButton(),
            Container(
              alignment: Alignment(1, 1),
              child: TextButton(
                onPressed: () {},
                child: Text(
                    LocaleKeys.forgotPassword,
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Color(0xff1F41BB),
                        fontWeight: FontWeight.w600),
                  ).tr()),
                ),
              ),
            ),
            Spacer(),
            RoundedButton(
              text: LocaleKeys.signin,
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DashboardScreen();
                }));
              },
              color: Color(0xff1F41BB),
              textColor: Colors.white,
              height: 60,
              width: 357,
            ),
          ],
        ),
      ),
    );
  }
}
