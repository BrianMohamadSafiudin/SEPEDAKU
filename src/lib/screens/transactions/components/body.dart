import 'package:google_fonts/google_fonts.dart';
import 'package:sepedaku/components/button_search.dart';
import 'package:sepedaku/components/color.dart';
import 'package:sepedaku/screens/transactions/components/view_item.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isFilterVisible = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ButtonSearch(),
            IconButton(
                onPressed: () {
                  setState(() {
                    isFilterVisible = !isFilterVisible;
                  });
                },
                icon: Icon(
                  Icons.menu,
                  color: primaryColor,
                )),
            Stack(
              alignment: Alignment.topRight,
              children: [
                GridItem(),
                Visibility(
                  visible: isFilterVisible,
                  child: Container(
                    color: primaryColor,
                    height: size.height,
                    width: size.width * 0.7,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Filter',
                            style: GoogleFonts.poppins(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          Divider(
                            color: Colors.white,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 8),
                            // color: Colors.amber,
                            height: size.height * 0.15,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Kategori',
                                  style: GoogleFonts.poppins(
                                      fontSize: 18, color: Colors.white),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.white)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          'Manual',
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.white)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          'Matic',
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class GridItem extends StatelessWidget {
  const GridItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.69,
      child: GridView.builder(
        itemCount: 3,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 4,
          mainAxisSpacing: 5,
        ),
        itemBuilder: (context, index) {
          if (index == 0) {
            return buildFirstItem(context);
          } else if (index == 1) {
            return buildSecondItem(context);
          } else {
            return buildThirdItem(context);
          }
        },
      ),
    );
  }

  Widget buildFirstItem(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ViewItemScreen();
        }));
      },
      child: Card(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/images/kawasaki.png"),
              Column(
                children: [
                  Text("Kawasaki ZX 25R"),
                  Text("N 9933 KL"),
                ],
              ),
              Container(
                height: 15,
                width: 52,
                decoration: BoxDecoration(
                  border: Border.all(width: 0.2),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  "SIM C",
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSecondItem(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ViewItemScreen2();
        }));
      },
      child: Card(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/images/Matic1.png"),
              Column(
                children: [
                  Text("Yamaha Grand Filanos"),
                  Text("N 3781 KL"),
                ],
              ),
              Container(
                height: 15,
                width: 52,
                decoration: BoxDecoration(
                  border: Border.all(width: 0.2),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  "SIM C",
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildThirdItem(BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ViewItemScreen3();
      }));
    },
    child: Card(
      child: Container(
        margin: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
                "assets/images/Matic2.png"), // Replace with the actual image path
            Column(
              children: [
                Text("Yamaha XMax 250"),
                Text("N 2645 KL"),
              ],
            ),
            Container(
              height: 15,
              width: 52,
              decoration: BoxDecoration(
                border: Border.all(width: 0.2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                "SIM C",
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    ),
  );
}
