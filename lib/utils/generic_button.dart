import 'package:flutter/material.dart';
import 'package:quick_pick/style/theme.dart' as Theme;

// ignore: must_be_immutable
class GenericButton extends StatefulWidget {
  String buttonText;
  GenericButton(this.buttonText);

  @override
  _GenericButtonState createState() => _GenericButtonState();
}

class _GenericButtonState extends State<GenericButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 100,
      child: Center(
        child: MaterialButton(
          //highlightColor: Colors.yellow,
          splashColor: Theme.Colors.loginGradientButtonStart,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(100.0))),
          child: Center(
            child: Text(
              widget.buttonText,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontFamily: "WorkSansBold"),
            ),
          ),
          onPressed: () => Navigator.pop(
                context,
              )
        ),
      ),
    );
  }
}
