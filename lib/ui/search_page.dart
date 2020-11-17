import 'package:flutter/material.dart';
import 'package:quick_pick/utils/base_ui.dart';
import 'package:quick_pick/utils/generic_button.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Container(
      child: BaseUi(
          child: Text(
        "Search Page",
        style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontFamily: "WorkSansSemiBold"),
      )),
    ));
  }
}
