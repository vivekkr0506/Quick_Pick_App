import 'package:flutter/material.dart';
import 'package:quick_pick/style/theme.dart' as Theme;
import 'package:quick_pick/ui/home_page.dart';
import 'package:quick_pick/utils/base_ui.dart';
import 'package:quick_pick/utils/generic_button.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return new Scaffold(
      // bottomNavigationBar: CurvedNavigationBar(
      //   backgroundColor: Colors.transparent,
      //   items: <Widget>[
      //     Icon(
      //       Icons.home,
      //       size: 30,
      //       color: Colors.red,
      //     ),
      //     Icon(Icons.shopping_cart, size: 30, color: Colors.red),
      //     Icon(Icons.account_box, size: 30, color: Colors.red),
      //     Icon(Icons.search, size: 30, color: Colors.red),
      //   ],
      //   onTap: (index) {
        
    
      //   },
      // ),
      body: Container(
        child: BaseUi("CART PAGE"),
      ),
    );
  }
}
