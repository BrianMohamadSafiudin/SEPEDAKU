import 'package:sepedaku/components/color.dart';
import 'package:flutter/material.dart';

class BackgroundAccount extends StatelessWidget {
  final Widget child;
  const BackgroundAccount({
    super.key,
    required this.child,
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
            height: size.height * 0.25,
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
