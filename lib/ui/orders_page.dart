import 'package:flutter/material.dart';
import 'package:quick_pick/utils/base_ui.dart';
import 'package:quick_pick/utils/generic_button.dart';

import 'dart:math';

// final SmsAutoFill _autoFill = SmsAutoFill();
// final completePhoneNumber = await _autoFill.hint;
double generateBorderRadius() => Random().nextDouble() * 64;
double generateMargin() => Random().nextDouble() * 64;
Color generateColor() => Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));

class OrdersPage extends StatefulWidget {
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage>
    with SingleTickerProviderStateMixin {
  Color color;
  double borderRadius;
  double margin;
  static const Color beginColor = Colors.deepPurple;
  static const Color endColor = Colors.deepOrange;
  Duration duration = Duration(milliseconds: 800);
  AnimationController controller;
  Animation<Color> animation;

  @override
  void initState() {
    super.initState();
    color = Colors.deepPurple;
    borderRadius = generateBorderRadius();
    margin = generateMargin();
    controller = AnimationController(vsync: this, duration: duration);
    animation =
        ColorTween(begin: beginColor, end: endColor).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void change() {
    setState(() {
      color = generateColor();
      borderRadius = generateBorderRadius();
      margin = generateMargin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseUi(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(18.0),
              child: SizedBox(
                width: 208,
                height: 208,
                child: AnimatedContainer(
                  margin: EdgeInsets.all(margin),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                  duration: const Duration(milliseconds: 400),
                ),
              ),
            ),
            RaisedButton(
              child: Text(
                'change',
              ),
              onPressed: () => change(),
            ),
            Padding(
              padding: EdgeInsets.all(18.0),
              child: AnimatedBuilder(
                animation: animation,
                builder: (context, child) {
                  return MaterialButton(
                    color: animation.value,
                    height: 50,
                    minWidth: 100,
                    child: child,
                    onPressed: () {
                      if (controller.status == AnimationStatus.completed) {
                        controller.reverse();
                      } else {
                        controller.forward();
                      }
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(18.0),
              child: Text(
                'Change Color',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
