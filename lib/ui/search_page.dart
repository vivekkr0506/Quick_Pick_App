import 'package:flutter/material.dart';
import 'package:quick_pick/utils/base_ui.dart';
import 'package:quick_pick/utils/generic_button.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;
  Animation<double> sizeAnimation;
  int currentState = 0;
   @override
  void initState() {

    super.initState();
    animationController = AnimationController(duration: Duration(milliseconds: 500),vsync: this);
    animation = Tween<double>(begin: 0,end: 60).animate(animationController)..addListener((){
      setState(() {
        
      });
    });
    sizeAnimation = Tween<double>(begin: 0,end: 1).animate(CurvedAnimation(parent: animationController,curve: Curves.fastOutSlowIn))..addListener((){
      setState(() {
        
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Container(
      child: BaseUi(
        child: Container(
          child: Stack(
            children: [
              Positioned(
                bottom: animation.value,
                child: FloatingActionButton(
                    backgroundColor: Colors.redAccent,
                    onPressed: () {},
                    child: Icon(Icons.shopping_cart)),
              ),
              Positioned(
                bottom: 0,
                child: FloatingActionButton(
                    onPressed: () {
                      if (currentState == 0) {
                        animationController.forward();
                        currentState = 1;
                      } else {
                        animationController.reverse();
                        currentState = 0;
                      }
                    },
                    child: Icon(Icons.plus_one)),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
