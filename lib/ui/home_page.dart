import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:quick_pick/ui/cart_page.dart';
import 'package:quick_pick/utils/base_ui.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        items: <Widget>[
          Icon( Icons.home,
            size: 30,
            color: Colors.red,
          ),
          Icon(Icons.shopping_cart, size: 30, color: Colors.red),
          Icon(Icons.account_box, size: 30, color: Colors.red),
          Icon(Icons.search, size: 30, color: Colors.red),
        ],
        onTap: (index) {
          _changePage(index, context);
        },
      ),
      body: Container(
        child: BaseUi(),
      ),
    );
  }

  void _changePage(int index, BuildContext context) {
    switch (index) {
      case 0:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => CartPage()));

        print(index);
        break;
      case 1:
        print(index);
        break;
      case 2:
        print(index);
        break;
      case 3:
        print(index);
        break;
      case 4:
        print(index);
        break;
      default:
    }
  }
}
