import 'package:sepedaku/components/color.dart';
import 'package:sepedaku/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RentalNowScreen extends StatelessWidget {
  const RentalNowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Checkout',
          style: GoogleFonts.poppins(),
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: size.height * 0.25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Container(
                        margin: EdgeInsets.all(16),
                        child: Image.asset('assets/images/kawasaki.png'))),
                Expanded(
                  child: Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Deskripsi',
                            style: GoogleFonts.poppins(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Kawasaki ZX-25R motor sport 250 cc tahun 2020\n\nKondisi:\n\nMesin: Sehat dan terawat\nRangka: Tidak ada penyok atau karat\nSuspensi: Empuk dan tidak bocor\nRem: Aman dan berfungsi dengan baik\nBan: Masih tebal dan tidak ada tambalan',
                            style: GoogleFonts.poppins(),
                            maxLines: 7,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: size.height * 0.24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: size.height * 0.05,
                  alignment: Alignment.centerLeft,
                  color: primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text(
                      'Choose your SIM',
                      style: GoogleFonts.poppins(
                          fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Image.asset(
                              "assets/images/sim.png",
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                    'SIM Edward Sunan Hutabarat',
                                    style: GoogleFonts.poppins(
                                        fontSize: 18, color: Colors.black),
                                  ),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.arrow_forward_ios))
                            ],
                          )),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: size.height * 0.14,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: size.height * 0.05,
                  alignment: Alignment.centerLeft,
                  color: primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text(
                      'Rental start date',
                      style: GoogleFonts.poppins(
                          fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
                TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: 'Input start date..'),
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2099));
                      TimeOfDay? pickedTime = await showTimePicker(
                          context: context, initialTime: TimeOfDay.now());
                    })
              ],
            ),
          ),
          Container(
            height: size.height * 0.14,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: size.height * 0.05,
                  alignment: Alignment.centerLeft,
                  color: primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text(
                      'Rental finish date',
                      style: GoogleFonts.poppins(
                          fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
                TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: 'Input finish date..'),
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2099));
                      TimeOfDay? pickedTime = await showTimePicker(
                          context: context, initialTime: TimeOfDay.now());
                    })
              ],
            ),
          ),
          Container(
            height: size.height * 0.14,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: size.height * 0.05,
                  alignment: Alignment.centerLeft,
                  color: primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text(
                      'Request Helm',
                      style: GoogleFonts.poppins(
                          fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(), hintText: 'Max 2!!!'),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
          height: size.height * 0.1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 235,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Total Payment',
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w300),
                    ),
                    Text(
                      'Rp. 250.000',
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DashboardScreen();
                  }));
                },
                child: Text(
                  'Checkout Now',
                  style: GoogleFonts.poppins(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                style: ElevatedButton.styleFrom(
                    fixedSize: Size.square(150),
                    shape:
                        RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                    backgroundColor: primaryColor),
              )
            ],
          )),
    );
  }
}
