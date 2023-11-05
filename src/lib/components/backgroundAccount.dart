import 'package:sepedaku/components/color.dart';
import 'package:flutter/material.dart';

class BackgroundAccount extends StatelessWidget {
  final Widget child;
  final double heightBox;
  const BackgroundAccount({
    super.key,
    required this.child,
    required this.heightBox,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            height: heightBox,
            color: primaryColor,
          ),
          Container(
            height: size.height * 0.75,
          ),
          child,
        ],
      ),
    );
  }
}
