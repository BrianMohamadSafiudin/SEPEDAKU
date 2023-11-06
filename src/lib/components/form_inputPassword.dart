import 'package:flutter/material.dart';

class FormInputPassword extends StatelessWidget {
  final String? label;
  final TextEditingController? controller;
  const FormInputPassword({
    this.controller,
    this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      controller: controller,
      obscureText: true,
      decoration: InputDecoration(
          labelText: label,
          hintText: "Masukkan Password Anda...",
          filled: true,
          fillColor: Color(0xffF1F4FF),
          border: InputBorder.none),
    );
  }
}