import 'package:flutter/material.dart';

class FormInputEmail extends StatelessWidget {
  final TextEditingController? controller;
  const FormInputEmail({
    this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: controller,
      decoration: InputDecoration(
          labelText: "Email",
          hintText: "Masukkan Email Anda...",
          filled: true,
          fillColor: Color(0xffF1F4FF),
          border: InputBorder.none),
    );
  }
}
