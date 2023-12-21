import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sepedaku/components/color.dart';
import 'package:flutter/material.dart';
import 'package:sepedaku/components/locale/locale_keys.g.dart';

class ButtonSearch extends StatefulWidget {
  final Function(List<DocumentSnapshot>) onSearchCompleted;
  const ButtonSearch({
    super.key,
    required this.onSearchCompleted,
  });

  @override
  State<ButtonSearch> createState() => _ButtonSearchState();
}

class _ButtonSearchState extends State<ButtonSearch> {
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchTextChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchTextChanged() {
    if (_searchController.text.isEmpty) {
      performSearch("").then(widget.onSearchCompleted);
    }
  }

  Future<List<DocumentSnapshot>> performSearch(String query) async {
    final CollectionReference motorsCollection =
        FirebaseFirestore.instance.collection('motor');

    QuerySnapshot querySnapshot = await motorsCollection
        .where('motor', isGreaterThanOrEqualTo: query)
        .where('motor', isLessThan: query + 'z')
        .get();

    return querySnapshot.docs;
  }

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
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  performSearch(value).then(widget.onSearchCompleted);
                });
              },
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  hintText: LocaleKeys.search.tr(),
                  border: InputBorder.none,
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                          onPressed: () {
                            _searchController.clear();
                          },
                          icon: Icon(Icons.clear_rounded))
                      : null),
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
