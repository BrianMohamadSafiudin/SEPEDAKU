import 'package:easy_localization/easy_localization.dart';
import 'package:sepedaku/components/color.dart';
import 'package:flutter/material.dart';
import 'package:sepedaku/components/locale/locale_keys.g.dart';

class ButtonSearch extends StatelessWidget {
  const ButtonSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 60),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 0.5)),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 16),
                  hintText: LocaleKeys.search.tr(),
                  border: InputBorder.none),
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.mic,
                color: primaryColor,
              ))
        ],
      ),
    );
  }
}
