import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final void Function() press;
  final IconData icon;
  final Color colorIcon;
  final Color colorBorder;
  const CircleButton({
    required this.press,
    required this.icon,
    required this.colorIcon,
    required this.colorBorder,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: colorBorder, borderRadius: BorderRadius.circular(100)),
        child: IconButton(
            onPressed: press,
            icon: Icon(
              icon,
              color: colorIcon,
            )));
  }
}
