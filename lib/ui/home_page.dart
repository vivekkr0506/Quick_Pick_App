import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:quick_pick/utils/MarqueeWidget.dart';
import 'package:quick_pick/utils/base_ui.dart';
import 'package:quick_pick/style/theme.dart' as Theme;
import 'package:geolocator/geolocator.dart';
import 'package:quick_pick/utils/product_card.dart';
import 'package:quick_pick/ui/address_page.dart';
import 'package:quick_pick/model/data.dart';
import 'package:quick_pick/widgets/product_icon.dart';
import 'package:flutter/gestures.dart';
import 'package:quick_pick/widgets/extentions.dart';
import 'package:quick_pick/model/product.dart';
import 'package:quick_pick/utils/product_cardV2.dart';
import 'package:quick_pick/utils/crousel_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Position _currentPosition;
  String _currentAddress;
  List<Meal> displayedMeals;

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

  Widget _productV2() {
    return Container(
      width: Theme.Colors.fullWidth(context),
      height: Theme.Colors.fullHeight(context),
      child: ListView(
        children: AppData.meal
            .map(
              (meal) => MealItem(
                id: meal.id,
                title: meal.title,
                imageUrl: meal.imageUrl,
                duration: meal.duration,
                complexity: meal.complexity,
                affordability: meal.affordability,
                onSelected: (model) {
                  setState(() {
                    AppData.meal.forEach((item) {
                      item.affordability;
                      item.imageUrl;
                      item.complexity;
                      item.isVegetarian;
                    });
                  });
                },
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _croselList() {
    return Container(
      width: Theme.Colors.fullWidth(context),
      height: 380,
      child: ScaledList(
        itemCount: categories.length,
        itemColor: (index) {
          return kMixedColors[index % kMixedColors.length];
        },
        itemBuilder: (index, selectedIndex) {
          final category = categories[index];
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: selectedIndex == index ? 100 : 80,
                child: Image.asset(category.image),
              ),
              SizedBox(height: 15),
              Text(
                category.name,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: selectedIndex == index ? 25 : 20),
              )
            ],
          );
        },
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
              padding: EdgeInsets.only(left: 20),
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
        elevation: 10.0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        child: BaseUi(
          child: Container(
            padding: EdgeInsets.only(top: 80),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              dragStartBehavior: DragStartBehavior.down,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  _search(),
                  _croselList(),
                  _categoryWidget(),
                  _productWidget(),
                  _productV2(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  final List<Color> kMixedColors = [
    Color(0xff71A5D7),
    Color(0xff72CCD4),
    Color(0xffFBAB57),
    Color(0xffF8B993),
    Color(0xff962D17),
    Color(0xffc657fb),
    Color(0xfffb8457),
  ];

  final List<Category> categories = [
    Category(image: "assets/img/shoe_thumb_1.png", name: "Nike"),
    Category(image: "assets/img/shoe_thumb_1.png", name: "Nike"),
    Category(image: "assets/img/shoe_thumb_1.png", name: "Nike"),
    Category(image: "assets/img/shoe_thumb_1.png", name: "Nike"),
    Category(image: "assets/img/shoe_thumb_1.png", name: "Nike"),
  ];
}

class Category {
  final String image;
  final String name;

  Category({@required this.image, @required this.name});
}
