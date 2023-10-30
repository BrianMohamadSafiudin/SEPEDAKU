import 'package:sepedaku/components/color.dart';
import 'package:flutter/material.dart';

class BackgroundAccount extends StatelessWidget {
  const BackgroundAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.25,
      color: primaryColor,
    );
  }
}