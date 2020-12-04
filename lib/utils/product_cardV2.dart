import 'package:flutter/material.dart';
import 'package:quick_pick/model/product.dart';
import 'dart:math';
double generateBorderRadius() => Random().nextDouble() * 64;
double generateMargin() => Random().nextDouble() * 64;
Color generateColor() => Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));
class MealItem extends StatefulWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final ValueChanged<Product> onSelected;

  MealItem(
      {@required this.id,
      @required this.title,
      @required this.imageUrl,
      @required this.duration,
      @required this.complexity,
      @required this.affordability,
      this.onSelected});

  static const Color beginColor = Colors.deepPurple;
  static const Color endColor = Colors.deepOrange;


  @override
  _MealItemState createState() => _MealItemState();
}

class _MealItemState extends State<MealItem> with SingleTickerProviderStateMixin{
  String get complexityText {
    switch (widget.complexity) {
      case Complexity.Simple:
        return "Simple";
        break;
      case Complexity.Challenging:
        return "Challenging";
        break;
      case Complexity.Hard:
        return "Hard";
        break;
      default:
        return "Unknown";
    }
  }

  String get affordabilityText {
    switch (widget.affordability) {
      case Affordability.Affordable:
        return "100";
        break;
      case Affordability.Pricey:
        return "230";
        break;
      case Affordability.Luxurious:
        return "400";
        break;
      default:
        return "Unknown";
    }
  }

  Color color;

  double borderRadius;

  double margin;

  Duration durationAni = Duration(milliseconds: 800);

  AnimationController controller;

  Animation<Color> animation;

  @override
  void initState() {
    super.initState();
    color = Colors.deepPurple;
    borderRadius = generateBorderRadius();
    margin = generateMargin();
    controller = AnimationController(vsync: this, duration: durationAni);
    animation =
        ColorTween(begin: MealItem.beginColor, end: MealItem.endColor).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

void _change() {
    setState(() {
      color = generateColor();
      borderRadius = generateBorderRadius();
      margin = generateMargin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () => selectMeal(context),
      child: Card(
        elevation: 4,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    widget.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                widget.title,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
                softWrap: false,
                overflow: TextOverflow.visible,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(width: 6),
                      Text('${widget.duration} min'),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      AnimatedContainer(
                     child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.white),
                        ),
                        color: Colors.black,
                        onPressed: () => {_change()},
                        child: new Text("ADD TO CART",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            )),
                      ),
                      duration: const Duration(milliseconds: 400),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        'MRP',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            fontFamily: "WorkSansSemiBold"),
                      ),
                      SizedBox(width: 6),
                      Text(
                        '₹$affordabilityText',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
