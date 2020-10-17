import 'package:flutter/material.dart';
import 'package:quick_pick/utils/base_ui.dart';
import 'package:quick_pick/utils/generic_button.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowGlow();
        },
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 75.0),
              child: BaseUi(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 75.0),
              child: GenericButton("Search"),
            ),
          ],
        ),
      ),
    );
  }
}
