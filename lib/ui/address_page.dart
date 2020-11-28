import 'package:flutter/material.dart';
import 'package:quick_pick/utils/base_ui.dart';


// final SmsAutoFill _autoFill = SmsAutoFill();
// final completePhoneNumber = await _autoFill.hint;

class Address extends StatefulWidget {
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<Address> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        child: BaseUi(
            child: Text(
          "Address PAGE",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontFamily: "WorkSansSemiBold"),
        )),
      ),
    );
  }
}