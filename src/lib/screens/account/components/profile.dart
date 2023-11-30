import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sepedaku/components/backgroundAccount.dart';
import 'package:sepedaku/components/color.dart';
import 'package:sepedaku/components/locale/locale_keys.g.dart';
import 'package:sepedaku/components/profile_user.dart';
import 'package:sepedaku/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool isUpdating = false;
  final user = FirebaseAuth.instance.currentUser;
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late FirebaseFirestore _firestore;
  late CollectionReference _usersCollection;
  late AuthCredential newCredential;

  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    _firestore = FirebaseFirestore.instance;
    _usersCollection = _firestore.collection('users');
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    try {
      DocumentSnapshot userData = await _usersCollection.doc(user!.uid).get();

      setState(() {
        nameController.text = userData['username'];
        emailController.text = userData['email'];
      });
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _updateProfile() async {
    setState(() {
      isUpdating = true;
    });

    try {
      DocumentSnapshot userData = await _usersCollection.doc(user!.uid).get();
      if (user != null) {
        if (userData['username'] != nameController.text) {
          try {
            await _usersCollection.doc(user!.uid).update({
              'username': nameController.text,
            });
            print('username berhasil diperbarui: ${nameController.text}');
          } catch (e) {
            print('Error updating display name: $e');
          }
        }
        if (passwordController.text.isNotEmpty &&
            confirmPasswordController.text.isNotEmpty) {
          if (passwordController.text == confirmPasswordController.text) {
            String? enteredPassword = await _showPasswordInputDialog();
            if (enteredPassword != null) {
              String? email = user?.email;
              if (email != null)
                newCredential = EmailAuthProvider.credential(
                    email: email, password: enteredPassword);
              try {
                await user?.reauthenticateWithCredential(
                    newCredential); // Re-authenticate dengan password baru sebelum mengubahnya

                // Setelah berhasil re-authenticate, update password baru
                await user?.updatePassword(passwordController.text);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text(LocaleKeys.alertChangePasswordSucces).tr()),
                );
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text('Error dalam mengupdate password: ${e}')),
                );
              }
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(LocaleKeys.alertWrongPassword).tr(),
              ),
            );
          }
        }
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(LocaleKeys.alertUpdate).tr(),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error updating profile: $e'),
        ),
      );
      print(e);
    } finally {
      setState(() {
        isUpdating = false;
      });
    }
  }

  Future<String?> _showPasswordInputDialog() async {
    TextEditingController passwordInputController = TextEditingController();

    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(LocaleKeys.alertEnterPassword.tr()),
          content: TextField(
            controller: passwordInputController,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password',
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context, passwordInputController.text);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: primaryColor,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)),
          title: Text(
            LocaleKeys.editProfile,
            style: GoogleFonts.poppins(fontSize: 22, color: Colors.white),
          ).tr(),
        ),
        body: BackgroundAccount(
          heightBox: size.height * 0.15,
          child: ListView(
            children: [
              HeaderProfileAccount(),
              Container(
                height: size.height * 0.56,
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FormAccount(
                      title: LocaleKeys.username,
                      obscureText: false,
                      readOnly: false,
                      controller: nameController,
                      keyboardType: TextInputType.text,
                    ),
                    FormAccount(
                      title: 'Email',
                      obscureText: false,
                      readOnly: true,
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    FormAccount(
                      title: LocaleKeys.changePassword,
                      obscureText: true,
                      readOnly: false,
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    FormAccount(
                      title: LocaleKeys.confirmPassword,
                      controller: confirmPasswordController,
                      readOnly: false,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    isUpdating
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : RoundedButton(
                            text: LocaleKeys.update,
                            press: _updateProfile,
                            color: primaryColor,
                            textColor: Colors.white,
                            height: 40,
                            width: 283),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class HeaderProfileAccount extends StatefulWidget {
  const HeaderProfileAccount({
    super.key,
  });

  @override
  State<HeaderProfileAccount> createState() => _HeaderProfileAccountState();
}

class _HeaderProfileAccountState extends State<HeaderProfileAccount> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25, top: 50),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ProfileUser(showButton: true)],
        ),
      ),
    );
  }
}

class FormAccount extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool readOnly;
  const FormAccount({
    required this.title,
    required this.controller,
    required this.keyboardType,
    required this.obscureText,
    required this.readOnly,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style:
                GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500),
          ).tr(),
          TextFormField(
            obscureText: obscureText,
            controller: controller,
            keyboardType: keyboardType,
            readOnly: readOnly,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
        ],
      ),
    );
  }
}
