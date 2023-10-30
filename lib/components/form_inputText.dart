import 'package:flutter/material.dart';

class FormInputText extends StatelessWidget {
  final String? label, hintText;
  final TextEditingController? controller;
  const FormInputText({
    super.key,
    this.controller,
    this.label,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
          filled: true,
          fillColor: Color(0xffF1F4FF),
          border: InputBorder.none),
    );
  }
}
