import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sepedaku/components/button_search.dart';
import 'package:sepedaku/components/color.dart';
import 'package:sepedaku/model/motorModel.dart';
import 'package:sepedaku/provider/motorProvider.dart';
import 'package:sepedaku/screens/transactions/components/view_item.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isFilterVisible = false;
  List<DocumentSnapshot> searchResults = [];
  List<String> dropdownItems = [
    'Semua',
    'Matic',
    'Manual',
  ];
  String? selectedOption;

  @override
  void initState() {
    super.initState();
    Provider.of<MotorProvider>(context, listen: false).fetchMotor();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ButtonSearch(
              onSearchCompleted: (List<DocumentSnapshot> results) {
                setState(() {
                  searchResults = results;
                });
              },
            ),
            DropdownButton<String>(
                padding: EdgeInsets.symmetric(vertical: 8),
                hint: Text('Pilih Kategori..'),
                value: selectedOption,
                items:
                    dropdownItems.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedOption = newValue ?? '';
                    print(selectedOption);
                  });
                }),
            GridItem(
              searchResults: searchResults,
              selectedOption: selectedOption,
            ),
          ],
        ),
      ),
    );
  }
}

class GridItem extends StatefulWidget {
  final List<DocumentSnapshot> searchResults;
  final String? selectedOption;
  const GridItem(
      {super.key, required this.searchResults, required this.selectedOption});

  @override
  State<GridItem> createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  List<MotorModel> displayedMotors = [];

  @override
  void initState() {
    super.initState();
    updateDisplayedMotors();
  }

  @override
  void didUpdateWidget(covariant GridItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    updateDisplayedMotors();
  }

  void updateDisplayedMotors() {
    final savedMotorProvider =
        Provider.of<MotorProvider>(context, listen: false);
    setState(() {
      if (widget.searchResults.isEmpty) {
        if (widget.selectedOption == 'Matic') {
          displayedMotors = savedMotorProvider.savedMotors
              .where((motor) => motor.jenisMotor == 'Matic')
              .toList();
        } else if (widget.selectedOption == 'Manual') {
          displayedMotors = savedMotorProvider.savedMotors
              .where((motor) => motor.jenisMotor == 'Manual')
              .toList();
        } else {
          displayedMotors = savedMotorProvider.savedMotors;
        }
      } else {
        displayedMotors.clear();
        for (var result in widget.searchResults) {
          var motorData = result.data() as Map<String, dynamic>;
          var newMotor = MotorModel(
            imageMotor: motorData['imageMotor'],
            motor: motorData['motor'],
            harga: motorData['harga'],
            stok: motorData['stok'],
            deskripsi: motorData['deskripsi'],
            jenisMotor: motorData['jenisMotor'],
          );
          displayedMotors.add(newMotor);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: (widget.searchResults.isEmpty)
          ? Container(
              height: size.height * 0.69,
              child: GridView.builder(
                itemCount: displayedMotors.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 4,
                  mainAxisSpacing: 5,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ViewItemScreen(index: index);
                      }));
                    },
                    child: Card(
                      child: Container(
                        margin: EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset("${displayedMotors[index].imageMotor}"),
                            Column(
                              children: [
                                Text(displayedMotors[index].motor),
                                Spacer(),
                                Text('Rp. ${displayedMotors[index].harga}')
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
                },
              ),
            )
          : Container(
              height: size.height * 0.69,
              child: GridView.builder(
                itemCount: widget.searchResults.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 4,
                  mainAxisSpacing: 5,
                ),
                itemBuilder: (context, index) {
                  var motorData = widget.searchResults[index].data()
                      as Map<String, dynamic>;
                  return InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ViewItemScreen(index: index);
                      }));
                    },
                    child: Card(
                      child: Container(
                        margin: EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset("${motorData['imageMotor']}"),
                            Column(
                              children: [
                                Text(motorData['motor']),
                                Spacer(),
                                Text('Rp. ${motorData['harga']}')
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
                },
              ),
            ),
    );
  }
}
