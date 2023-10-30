import 'package:sepedaku/components/button_inScan.dart';
import 'package:sepedaku/components/color.dart';
import 'package:sepedaku/screens/account/components/detailScan.dart';
import 'package:flutter/material.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(22),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleButton(
                press: () {},
                icon: Icons.flashlight_off,
                colorIcon: Colors.white,
                colorBorder: primaryColor,
              ),
              CircleButton(
                press: () {},
                icon: Icons.photo_library,
                colorIcon: Colors.white,
                colorBorder: primaryColor,
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            height: size.height * 0.7199,
            width: double.infinity,
            color: Colors.green,
          ),
        ),
      ]),
      bottomNavigationBar: BottomAppBar(
        color: primaryColor,
        height: size.height * 0.16,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleButton(
                press: () {
                  Navigator.pop(context);
                },
                icon: Icons.close,
                colorBorder: Colors.white,
                colorIcon: primaryColor,
              ),
              CircleButton(
                press: () {},
                icon: Icons.camera_alt,
                colorBorder: Colors.white,
                colorIcon: primaryColor,
              ),
              CircleButton(
                press: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DetailScanScreen();
                  }));
                },
                icon: Icons.check,
                colorBorder: Colors.white,
                colorIcon: primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
