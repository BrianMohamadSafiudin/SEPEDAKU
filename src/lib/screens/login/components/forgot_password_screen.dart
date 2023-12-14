import 'package:firebase_auth/firebase_auth.dart';
import 'package:sepedaku/screens/login/login_screen.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _controllerEmail = TextEditingController();
  String notificationText = '';
  Color buttonColor = Color(0xff1F41BB);
  bool isResetButtonVisible = true;

  void _resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _controllerEmail.text);
      setState(() {
        notificationText = 'Password reset email sent successfully.\n Change your password immediately.';
        buttonColor = Colors.green;
        isResetButtonVisible = false; // Hide the reset button
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        setState(() {
          notificationText = 'Error: User with this email not found.';
          buttonColor = Colors.red;
        });
      } else {
        setState(() {
          notificationText = 'Error: The email address is badly formatted';
          buttonColor = Colors.red;
        });
      }
    } catch (error) {
      setState(() {
        notificationText = 'Error: The email address is badly formatted';
        buttonColor = Colors.red;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
        backgroundColor: Color(0xff1F41BB),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Receive an email to reset your password',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),
            Text(
              notificationText,
              style: TextStyle(color: buttonColor),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _controllerEmail,
              decoration: InputDecoration(
                labelText: 'Email',
                filled: true,
                fillColor: Color(0xffF1F4FF),
                border: InputBorder.none,
              ),
            ),
            SizedBox(height: 16),
            Visibility(
              visible: isResetButtonVisible,
              child: ElevatedButton(
                onPressed: _resetPassword,
                child: Text('Reset Password'),
                style: ElevatedButton.styleFrom(
                  primary: buttonColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
