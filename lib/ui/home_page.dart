import 'package:flutter/material.dart';
import 'package:quick_pick/utils/base_ui.dart';

class HomePage extends StatelessWidget {
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
        child: BaseUi("Home PAGE"),
      ),
    );
  }
}
