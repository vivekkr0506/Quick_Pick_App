// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:quick_pick/ui/cart_page.dart';
import 'package:quick_pick/ui/cart_page.dart';
import 'package:quick_pick/ui/orders_page.dart';
import 'package:quick_pick/ui/profile_page.dart';
import 'package:quick_pick/ui/search_page.dart';
import 'package:quick_pick/utils/base_ui.dart';

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int currentIndex = 0;
//   GlobalKey _bottomNavigationKey = GlobalKey();
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       bottomNavigationBar: CurvedNavigationBar(
//         key: _bottomNavigationKey,
//         backgroundColor: Colors.transparent,
//         items: <Widget>[
//           Icon(
//             Icons.home,
//             size: 30,
//             color: Colors.red,
//           ),
//           Icon(Icons.shopping_cart, size: 30, color: Colors.red),
//           Icon(Icons.account_box, size: 30, color: Colors.red),
//           Icon(Icons.search, size: 30, color: Colors.red),
//         ],
//         onTap: (index) {
//           setState(() {
//             currentIndex = index;
//           });
//           _changePage(currentIndex, context);
//         },
//       ),
//     );
//   }

//   void _changePage(int index, BuildContext context) {
//     switch (index) {
//       case 0:
//         final CurvedNavigationBarState navBarState =
//             _bottomNavigationKey.currentState;
//         navBarState.setPage(0);
//         Navigator.pushReplacement(
//             context, MaterialPageRoute(builder: (context) => HomePage()));

//         print(index);
//         break;
//       case 1:
//         final CurvedNavigationBarState navBarState =
//             _bottomNavigationKey.currentState;
//         navBarState.setPage(1);
//         Navigator.pushReplacement(
//             context, MaterialPageRoute(builder: (context) => CartPage()));
//         print(index);
//         break;
//       case 2:

//         Navigator.pushReplacement(
//             context, MaterialPageRoute(builder: (context) => SearchPage()));
//         print(index);
//         break;
//       case 3:
//         print(index);
//         break;
//       case 4:
//         print(index);
//         break;
//       default:
//     }
//   }
// }
import 'package:quick_pick/ui/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  PageController _pageController;
  

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            Container(child: CartPage()),
            Container(child: OrdersPage()),
            Container(child: SearchPage()),
            Container(child: ProfilePage()),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Color(0xFF3e87ff),
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 300), curve: Curves.ease);

          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
          
              textAlign: TextAlign.center,
              title: Text(
                'Home',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xFFfc0022),
                    fontSize: 16.0,
                    fontFamily: "WorkSansSemiBold"),
              ),
              icon: Icon(Icons.home),
              activeColor: Color(0xFFfc0022),
              inactiveColor: Color(0xFFfc0022)),
          BottomNavyBarItem(
              title: Text(
                'Search',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xFFfc0022),
                    fontSize: 16.0,
                    fontFamily: "WorkSansSemiBold"),
              ),
              icon: Icon(Icons.search),
              activeColor: Color(0xFFfc0022),
              inactiveColor: Color(0xFFfc0022)),
          BottomNavyBarItem(
              title: Text(
                'Cart',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xFFfc0022),
                    fontSize: 16.0,
                    fontFamily: "WorkSansSemiBold"),
              ),
              icon: Icon(Icons.shopping_cart),
              activeColor: Color(0xFFfc0022),
              inactiveColor: Color(0xFFfc0022)),
          BottomNavyBarItem(
              title: Text(
                'Profile',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xFFfc0022),
                    fontSize: 16.0,
                    fontFamily: "WorkSansSemiBold"),
              ),
              icon: Icon(Icons.portrait),
              activeColor: Color(0xFFfc0022),
              inactiveColor: Color(0xFFfc0022)),
        ],
      ),
    );
  }
}
