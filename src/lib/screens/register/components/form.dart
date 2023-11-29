import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sepedaku/auth.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sepedaku/components/locale/locale_keys.g.dart';
import 'package:sepedaku/components/rounded_button.dart';
import 'package:sepedaku/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';

class FormRegister extends StatefulWidget {
  FormRegister({Key? key}) : super(key: key);

  @override
  _FormRegisterState createState() => _FormRegisterState();
}

class _FormRegisterState extends State<FormRegister> {
  String? errorMessage = '';
  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerConfirmPassword =
      TextEditingController();

  // Firebase Firestore instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> registerWithEmailAndPassword() async {
    String email = _controllerEmail.text.trim();
    String password = _controllerPassword.text.trim();
    String confirmPassword = _controllerConfirmPassword.text.trim();

    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      setState(() {
        errorMessage = 'All fields are required.';
      });
      return false;
    }

    if (password != confirmPassword) {
      setState(() {
        errorMessage = 'Passwords do not match.';
      });
      return false;
    }

    try {
      final userCredential = await Auth()
          .createUserWithEmailAndPassword(email: email, password: password);
      final user = FirebaseAuth.instance.currentUser; // Get the current user

      if (user != null) {
        // Pendaftaran berhasil

        // Store user information in Firestore
        await _firestore.collection('users').doc(user.uid).set({
          'username': _controllerUsername.text.trim(),
          'email': email,
          'profile_image': "",
          // You can store other user information here
        });

        return true;
      } else {
        setState(() {
          errorMessage = 'Registration failed.';
        });
        return false;
      }
    } catch (error) {
      setState(() {
        errorMessage = 'An unexpected error occurred during registration.';
      });
      return false;
    }
  }

  Widget _entryField(
      String title, TextEditingController controller, bool obscureText) {
    return TextField(
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
        filled: true,
        fillColor: Color(0xffF1F4FF),
        border: InputBorder.none,
      ),
    );
  }

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : 'Hmm? $errorMessage');
  }

  Widget _submitButton() {
    return ElevatedButton(
      onPressed: registerWithEmailAndPassword,
      child: Text('Register'),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        height: size.height * 0.55,
        child: Column(
          children: [
            Spacer(),
            _entryField('Username', _controllerUsername, false),
            SizedBox(height: 16),
            _entryField('Email', _controllerEmail, false),
            SizedBox(height: 16),
            _entryField('Password', _controllerPassword, true),
            SizedBox(height: 16),
            _entryField('Confirm Password', _controllerConfirmPassword, true),
            _errorMessage(),
            Spacer(),
            RoundedButton(
              text: 'Register',
              press: () {
                registerWithEmailAndPassword().then((isRegistrationSuccessful) {
                  if (isRegistrationSuccessful) {
                    // Navigasi ke DashboardScreen jika pendaftaran berhasil
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DashboardScreen();
                    }));
                  } else {
                    // Tampilkan pesan kesalahan jika pendaftaran gagal
                    if (errorMessage != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(errorMessage ??
                              "Registration failed. Please check your credentials."),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              "Registration failed. Please check your credentials."),
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
