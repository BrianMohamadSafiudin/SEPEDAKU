import 'package:flutter/material.dart';
import 'package:sepedaku/components/button_search.dart';
import 'package:sepedaku/screens/transactions/components/view_item.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isKawasakiFilterSelected = false;
  bool isYamahaFilterSelected = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ButtonSearch(), // Move the Search button to the top
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isKawasakiFilterSelected = !isKawasakiFilterSelected;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: isKawasakiFilterSelected
                        ? Colors.blue
                        : Colors.white,
                  ),
                  child: Text('Manual'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isYamahaFilterSelected = !isYamahaFilterSelected;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: isYamahaFilterSelected
                        ? Colors.blue
                        : Colors.white,
                  ),
                  child: Text('Matic'),
                ),
              ],
            ),
            GridItem(
              showManualFilter: isKawasakiFilterSelected,
            ),
          ],
        ),
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final bool showManualFilter;

  const GridItem({Key? key, required this.showManualFilter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.69,
      child: GridView.builder(
        itemCount: showManualFilter ? 1 : 3,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 4,
          mainAxisSpacing: 5,
        ),
        itemBuilder: (context, index) {
          if (showManualFilter) {
            return buildFirstItem(context);
            return buildSecondItem(context);
          } else {
            switch (index) {
              case 0:
                return buildFirstItem(context);
              case 1:
                return buildSecondItem(context);
              case 2:
                return buildThirdItem(context);
              default:
                return Container();
            }
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

Widget buildFourthItem(BuildContext context) {
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
                Text("Yaamahaa XMax 2510"),
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

Widget buildFifthItem(BuildContext context) {
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
