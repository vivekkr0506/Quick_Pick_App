import 'package:flutter/material.dart';
import 'package:quick_pick/utils/base_ui.dart';
import 'package:quick_pick/utils/generic_button.dart';


// final SmsAutoFill _autoFill = SmsAutoFill();
// final completePhoneNumber = await _autoFill.hint;

class OrdersPage extends StatefulWidget {
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        child: BaseUi(
            child: Text(
          "ORDERS PAGE",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontFamily: "WorkSansSemiBold"),
        )),
      ),
    );
  }
}