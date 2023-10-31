import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Positioned(
              top: 0,
              right: 0,
              child: Image.asset(
                "assets/images/welcomeTop.png",
                color: Color(0xffEAEEFF),
                width: size.width * 0.9,
              )),
          Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset(
                "assets/images/welcomeBotom.png",
                color: Color(0xffEAEEFF),
                width: size.width * 0.3,
              )),
          child,
        ],
      ),
    );
  }
}
