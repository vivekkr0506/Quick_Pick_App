import 'package:flutter/material.dart';
import 'package:quick_pick/style/theme.dart' as Theme;

class GenericButton extends StatelessWidget {
  String buttonText;
  GenericButton(this.buttonText);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(120.0),
        child: Center(
          child: MaterialButton(
              highlightColor: Colors.yellow,
              splashColor: Theme.Colors.loginGradientButtonStart,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50.0))),
              child: Center(
                child: Text(
                  buttonText,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontFamily: "WorkSansBold"),
                ),
              ),
              onPressed: () => Navigator.pop(
                    context,
                  )),
        ),
      ),
    );
  }
}
