import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import 'package:sepedaku/components/card_inHome.dart';
import 'package:sepedaku/components/locale/locale_keys.g.dart';
import 'package:sepedaku/provider/transactionProvider.dart';
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
    Provider.of<TransactionProvider>(context, listen: false)
        .fetchSavedTransaction();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            LocaleKeys.rentinprogress,
            style:
                GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ).tr(),
        ),
        Consumer<TransactionProvider>(
          builder: (context, transaction, _) => Container(
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
                    itemCount: transaction.savedTransactions.length,
                    itemBuilder: (context, index) {
                      return CardRentalProgress(
                        press: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ViewItemScreen(index: index);
                          }));
                        },
                        image: transaction.savedTransactions[index].imageMotor,
                        name: transaction.savedTransactions[index].motor,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
