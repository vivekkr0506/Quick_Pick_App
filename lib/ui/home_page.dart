import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:quick_pick/ui/search_page.dart';
import 'package:quick_pick/utils/MarqueeWidget.dart';
import 'package:quick_pick/utils/NeumorphicContainer.dart';
import 'package:quick_pick/utils/base_ui.dart';
import 'package:quick_pick/style/theme.dart' as Theme;
import 'package:geolocator/geolocator.dart';
import 'package:quick_pick/utils/product_card.dart';
import 'package:quick_pick/ui/address_page.dart';
import 'package:quick_pick/model/data.dart';
import 'package:quick_pick/widgets/product_icon.dart';
import 'package:flutter/gestures.dart';
import 'package:quick_pick/widgets/extentions.dart';

final europeanCountries = [
  'Albania',
  'Andorra',
  'Armenia',
  'Austria',
  'Azerbaijan',
  'Belarus',
  'Belgium',
  'Bosnia and Herzegovina',
  'Bulgaria',
  'Croatia',
  'Cyprus',
  'Czech Republic',
  'Denmark',
  'Estonia',
  'Finland',
  'France',
  'Georgia',
  'Germany',
  'Greece',
  'Hungary',
  'Iceland',
  'Ireland',
  'Italy',
  'Kazakhstan',
  'Kosovo',
  'Latvia',
  'Liechtenstein',
  'Lithuania',
  'Luxembourg',
  'Macedonia',
  'Malta',
  'Moldova',
  'Monaco',
  'Montenegro',
  'Netherlands',
  'Norway',
  'Poland',
  'Portugal',
  'Romania',
  'Russia',
  'San Marino',
  'Serbia',
  'Slovakia',
  'Slovenia',
  'Spain',
  'Sweden',
  'Switzerland',
  'Turkey',
  'Ukraine',
  'United Kingdom',
  'Vatican City'
];

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Position _currentPosition;
  String _currentAddress;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  _getCurrentLocation() {
    // ignore: deprecated_member_use
    getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });

      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await GeocodingPlatform.instance
          .placemarkFromCoordinates(
              _currentPosition.latitude, _currentPosition.longitude,
              localeIdentifier: "en");
      // List<Placemark> p = await placemarkFromCoordinates(
      //     _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        print(
            "${place.locality}, ${place.subAdministrativeArea}, ${place.administrativeArea}");
        _currentAddress =
            "${place.locality}, ${place.subAdministrativeArea}, ${place.administrativeArea}";
      });
    } catch (e) {
      print(e);
    }
  }

  _naviagteToAddress() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Address()),
    );
  }

  Widget _search() {
    return Container(
      margin: Theme.Colors.padding,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: TextField(
                // onTap: () => {
                //   Navigator.pushReplacement(
                //     context,
                //     MaterialPageRoute(builder: (context) => SearchPage()),
                //   )
                // },
                //readOnly: true,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search Products",
                    hintStyle: TextStyle(fontSize: 12),
                    contentPadding:
                        EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 5),
                    prefixIcon: Icon(Icons.search, color: Colors.black54)),
              ),
            ),
          ),
          SizedBox(width: 20),
          _icon(Icons.filter_list, color: Colors.black54)
        ],
      ),
    );
  }

  Widget _icon(IconData icon, {Color color = Colors.red}) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(13)),
          boxShadow: Theme.Colors.shadow),
      child: Icon(
        icon,
        color: color,
      ),
    ).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(13)));
  }

  Widget _categoryWidget() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: Theme.Colors.fullWidth(context),
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: AppData.categoryList
            .map(
              (category) => ProductIcon(
                model: category,
                onSelected: (model) {
                  setState(() {
                    AppData.categoryList.forEach((item) {
                      item.isSelected = false;
                    });
                    model.isSelected = true;
                  });
                },
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _productWidget() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: Theme.Colors.fullWidth(context),
      height: Theme.Colors.fullWidth(context) * .7,
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 4 / 3,
            mainAxisSpacing: 30,
            crossAxisSpacing: 20),
        padding: EdgeInsets.only(left: 20),
        scrollDirection: Axis.horizontal,
        children: AppData.productList
            .map(
              (product) => ProductCard(
                product: product,
                onSelected: (model) {
                  setState(() {
                    AppData.productList.forEach((item) {
                      item.isSelected = false;
                    });
                    model.isSelected = true;
                  });
                },
              ),
            )
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      extendBodyBehindAppBar: true,
      appBar: new AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
            onTap: () {
              _naviagteToAddress();
            },
            child: Container(
              padding: EdgeInsets.only(left:20),
              child: Icon(
                Icons.home,
                size: 35,
                color: Colors.white,
              ),
            )),
        title: MarqueeWidget(
            child: Text(
          _currentAddress != null ? _currentAddress : "Getting your Location",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontFamily: "WorkSansSemiBold"),
        )),
        elevation:10.0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        child: BaseUi(
          child: Container(
           padding: EdgeInsets.only(top:80),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              dragStartBehavior: DragStartBehavior.down,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  _search(),
                  _categoryWidget(),
                  _productWidget(),
                  _categoryWidget(),
                  _productWidget(),
                  _search(),
                  _productWidget(),
                  _categoryWidget(),
                  _productWidget(),
                ],
              ),
            ),
          ),
        ),

        // child: new ListView.builder(
        //     scrollDirection: Axis.vertical,
        //     itemCount: europeanCountries.length,
        //     itemBuilder: (BuildContext ctxt, int index) {
        //       EdgeInsets padding = index == 0
        //           ? const EdgeInsets.only(
        //               left: 2.0, right: 2.0, top: 0.0, bottom: 10.0)
        //           : const EdgeInsets.only(
        //               left: 2.0, right: 2.0, top: 0.0, bottom: 10.0);
        //       return new Padding(
        //         padding: padding,
        // child: Container(
        //   height: 250,
        //   width: 200,
        //   decoration: new BoxDecoration(
        //     borderRadius: BorderRadius.circular(20),
        //     gradient: new LinearGradient(
        //         colors: [
        //           Theme.Colors.loginGradientButtonEnd,
        //           Theme.Colors.loginGradientButtonStart
        //         ],
        //         begin: const FractionalOffset(0.0, 0.0),
        //         end: const FractionalOffset(1.0, 1.0),
        //         stops: [0.0, 1.0],
        //         tileMode: TileMode.repeated),
        //   ),
        //   child: Center(
        //     child: Image.asset('assets/img/login_logo.png'),
        //     // child: Text(
        //     //   europeanCountries[index],
        //     //   style: TextStyle(
        //     //       color: Colors.white,
        //     //       fontSize: 20.0,
        //     //       fontFamily: "WorkSansSemiBold"),
        //     // ),
        //   ),
        // ),
        // child: ProductCard(),
      ),
    );
  }
}
