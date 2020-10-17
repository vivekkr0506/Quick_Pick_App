import 'package:flutter/material.dart';
import 'package:quick_pick/style/theme.dart' as Theme;
import 'package:quick_pick/ui/home_page.dart';
import 'package:quick_pick/utils/base_ui.dart';
import 'package:quick_pick/utils/generic_button.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Container(
      child: HomePage(),
    ));
  }
}
