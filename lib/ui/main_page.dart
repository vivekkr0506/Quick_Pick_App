
import 'package:quick_pick/ui/cart_page.dart';
import 'package:quick_pick/ui/home_page.dart';
import 'package:quick_pick/ui/orders_page.dart';
import 'package:quick_pick/ui/profile_page.dart';
import 'package:quick_pick/ui/search_page.dart';
import 'package:quick_pick/ui/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
            Container(child: HomePage()),
            Container(child: CartPage()),
            Container(child: SearchPage()),
            Container(child: OrdersPage()),
            Container(child: ProfilePage()),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Colors.white,
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 300), curve: Curves.ease);

          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              title: Text(
                'Home',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontFamily: "WorkSansSemiBold"),
              ),
              icon: Icon(Icons.home,size: 30),
              inactiveColor: Color(0xFFfc0022),
              activeColor: Colors.white),
          BottomNavyBarItem(
              textAlign: TextAlign.center,
              title: Text(
                'Cart',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontFamily: "WorkSansSemiBold"),
              ),
              icon: Icon(Icons.shopping_cart,size: 30),
              inactiveColor: Color(0xFFfc0022),
              activeColor: Colors.white),
          BottomNavyBarItem(
              title: Text(
                'Search',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontFamily: "WorkSansSemiBold"),
              ),
              icon: Icon(Icons.search,size: 30),
              inactiveColor: Color(0xFFfc0022),
              activeColor: Colors.white),
          BottomNavyBarItem(
              title: Text(
                'Orders',
                textAlign: TextAlign.center,
                style: TextStyle(
                   color: Colors.white,
                    fontSize: 20.0,
                    fontFamily: "WorkSansSemiBold"),
              ),
              icon: Icon(Icons.history,size: 30),
              inactiveColor: Color(0xFFfc0022),
              activeColor: Colors.white),
          BottomNavyBarItem(
              title: Text(
                'Profile',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontFamily: "WorkSansSemiBold"),
              ),
              icon: Icon(Icons.portrait,size: 30),
              inactiveColor: Color(0xFFfc0022),
              activeColor: Colors.white),
        ],
      ),
    );
  }
}
