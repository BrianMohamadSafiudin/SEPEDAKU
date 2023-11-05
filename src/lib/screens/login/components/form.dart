import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sepedaku/auth.dart';
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

  Future<bool> signInWithEmailAndPassword() async {
    String email = _controllerEmail.text.trim();
    String password = _controllerPassword.text.trim();

    if (email.isEmpty || password.isEmpty) {
      setState(() {
        errorMessage = 'Email and password are required.';
      });
      return false;
    }

    try {
      final userCredential = await Auth()
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential != null) {
        // Pengguna ditemukan, login berhasil
        return true;
      } else {
        // Pengguna tidak ditemukan, login gagal
        setState(() {
          errorMessage = 'No user found.';
        });
        return false;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        setState(() {
          errorMessage = 'Wrong password provided for that user.';
        });
      } else {
        setState(() {
          errorMessage = 'An error occurred during sign-in: ${e.message}';
        });
      }
      setState(() {
        isLogin = false;
      });
      return false; // Login gagal
    } catch (error) {
      setState(() {
        errorMessage = 'An unexpected error occurred during sign-in.';
      });
      setState(() {
        isLogin = false;
      });
      return false; // Login gagal
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
    return Text(errorMessage == '' ? '' : 'Hmm? $errorMessage');
  }

  Widget _submitButton() {
    return ElevatedButton(
      onPressed: signInWithEmailAndPassword,
      child: Text('Login'),
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
            Container(
              alignment: Alignment(1, 1),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  LocaleKeys.forgotPassword,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Color(0xff1F41BB),
                    fontWeight: FontWeight.w600,
                  ),
                ).tr(),
              ),
            ),
            Spacer(),
            RoundedButton(
              text: LocaleKeys.signin,
              press: () {
                signInWithEmailAndPassword().then((isLoginSuccessful) {
                  if (isLoginSuccessful) {
                    // Navigasi ke DashboardScreen jika proses login berhasil
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DashboardScreen();
                    }));
                  } else {
                    // Tampilkan pesan kesalahan jika login gagal
                    if (errorMessage != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(errorMessage ??
                              "Login failed. Please check your credentials."),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              "Login failed. Please check your credentials."),
                        ),
                      );
                    }
                  }
                }).catchError((error) {
                  // Handle error jika ada kesalahan lainnya (opsional)
                });
              },
              color: Color(0xff1F41BB),
              textColor: Colors.white,
              height: 60,
              width: 357,
            )
          ],
        ),
      ),
    );
  }
}
