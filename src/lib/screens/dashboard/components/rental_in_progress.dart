import 'package:sepedaku/components/card_inHome.dart';
// import 'package:cobaprojek_ocr/components/color.dart';
import 'package:sepedaku/screens/dashboard/components/view_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RentalInProgress extends StatelessWidget {
  const RentalInProgress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            'Rent in progress',
            style:
                GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
        ),
        Container(
          height: size.height * 0.32,
          margin: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 6,
                  ),
                  shrinkWrap: true,
                  itemCount: 4, // Ganti dengan jumlah item yang sesuai
                  itemBuilder: (BuildContext context, int index) {
                    return CardRentalProgress(
                      press: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ViewItemScreen();
                        }));
                      },
                      image: "assets/images/kawasaki.png",
                      name: 'Kawasaki ZX 25R - N 9933 KL',
                    );
                  },
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
