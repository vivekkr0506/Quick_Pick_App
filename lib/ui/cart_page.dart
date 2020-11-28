// import 'package:flutter/material.dart';
// import 'package:quick_pick/utils/base_ui.dart';

// class CartPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       // bottomNavigationBar: CurvedNavigationBar(
//       //   backgroundColor: Colors.transparent,
//       //   items: <Widget>[
//       //     Icon(
//       //       Icons.home,
//       //       size: 30,
//       //       color: Colors.red,
//       //     ),
//       //     Icon(Icons.shopping_cart, size: 30, color: Colors.red),
//       //     Icon(Icons.account_box, size: 30, color: Colors.red),
//       //     Icon(Icons.search, size: 30, color: Colors.red),
//       //   ],
//       //   onTap: (index) {

//       //   },
//       // ),
//       body: Container(
//         child: BaseUi(
//             child: Text(
//           "CART PAGE",
//           style: TextStyle(
//               color: Colors.white,
//               fontSize: 20.0,
//               fontFamily: "WorkSansSemiBold"),
//         )),
//       ),
//     );
//   }
// }

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:quick_pick/utils/base_ui.dart';
import 'package:quick_pick/utils/product_card.dart';
import 'package:quick_pick/ui/address_page.dart';
import 'package:quick_pick/model/data.dart';
import 'package:quick_pick/widgets/product_icon.dart';
import 'package:flutter/gestures.dart';
import 'package:quick_pick/widgets/extentions.dart';
import 'package:quick_pick/model/product.dart';
import 'package:quick_pick/style/light_color.dart';
import 'package:quick_pick/utils/generic_button.dart';
import 'package:quick_pick/widgets/title_text.dart';
import 'package:quick_pick/widgets/extentions.dart';
import 'package:quick_pick/ui/login_page.dart';
import 'package:quick_pick/style/theme.dart' as Theme;
import 'package:quick_pick/utils/MarqueeWidget.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key key}) : super(key: key);

  Widget _cartItems() {
    return Column(children: AppData.cartList.map((x) => _item(x)).toList());
  }

  Widget _item(Product model) {
    return Container(
      height: 80,
      child: Row(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1.2,
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    height: 70,
                    width: 70,
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            decoration: BoxDecoration(
                                color: LightColor.lightGrey,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: -10,
                  bottom: -10,
                  child: Image.asset(model.image),
                )
              ],
            ),
          ),
          Expanded(
              child: Container(
                  child: ListTile(
            title: TitleText(
              text: model.name,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
            subtitle: Row(
              children: <Widget>[
                TitleText(
                  text: '\₹ ',
                  color: Colors.white,
                  fontSize: 12,
                ),
                TitleText(
                  text: model.price.toString(),
                  fontSize: 14,
                ),
              ],
            ),
            trailing: Container(
              width: 35,
              height: 35,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: LightColor.lightGrey.withAlpha(150),
                  borderRadius: BorderRadius.circular(10)),
              child: TitleText(
                text: 'x${model.id}',
                fontSize: 12,
              ),
            ),
          )
          )),
        ],
      ),
    );
  }

  Widget _price() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        TitleText(
          text: '${AppData.cartList.length} Items',
          color: LightColor.grey,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        TitleText(
          text: '\₹${getPrice()}',
          fontSize: 18,
        ),
      ],
    );
  }

  Widget _submitButton(BuildContext context) {
    return FlatButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: LightColor.red,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 12),
          width: Theme.Colors.fullWidth(context) * .7,
          child: TitleText(
            text: 'Next',
            color: LightColor.background,
            fontWeight: FontWeight.w500,
          ),
        ));
  }

  double getPrice() {
    double price = 0;
    AppData.cartList.forEach((x) {
      price += x.price * x.id;
    });
    return price;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      extendBodyBehindAppBar: true,
      appBar: new AppBar(
        leading: BackButton(
            // child: Container(
            //   child: Icon(
            //     Icons.arrow_back,
            //     size: 30,
            //     color: Colors.white,
            //   ),
            // )
            ),
        elevation: 10.0,
      
        backgroundColor: Colors.transparent,
        title: MarqueeWidget(
            child: Text(
          "Your Cart",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontFamily: "WorkSansSemiBold"),
        )),
      ),
      body: Container(
        child: BaseUi(
            child: Container(
          padding: EdgeInsets.only(top: 70),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _cartItems(),
                Divider(
                  thickness: 1,
                  height: 70,
                ),
                _price(),
                SizedBox(height: 30),
                _submitButton(context),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
