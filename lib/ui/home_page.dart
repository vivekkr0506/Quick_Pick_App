import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:quick_pick/utils/MarqueeWidget.dart';
import 'package:quick_pick/utils/NeumorphicContainer.dart';
import 'package:quick_pick/utils/base_ui.dart';
import 'package:quick_pick/style/theme.dart' as Theme;
import 'package:geolocator/geolocator.dart';

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

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
            onTap: () {/* Write listener code here */},
            child: Container(
              child: Icon(
                Icons.location_on,
                size: 30,
                color: Colors.red,
              ),
            )),
        title: MarqueeWidget(
            child: Text(
          _currentAddress != null ? _currentAddress : "Getting your Location",
          style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontFamily: "WorkSansSemiBold"),
        )),
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        
        child: BaseUi(
          child: new ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: europeanCountries.length,
              itemBuilder: (BuildContext ctxt, int index) {
                EdgeInsets padding = index == 0
                    ? const EdgeInsets.only(
                        left: 2.0, right: 2.0, top: 0.0, bottom: 10.0)
                    : const EdgeInsets.only(
                        left: 2.0, right: 2.0, top: 0.0, bottom: 10.0);
                return new Padding(
                  padding: padding,
                  child: Container(
                    height: 250,
                    width: 200,
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: new LinearGradient(
                          colors: [
                            Theme.Colors.loginGradientButtonEnd,
                            Theme.Colors.loginGradientButtonStart
                          ],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.0, 1.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.repeated),
                    ),
                    child: Center(
                      child: Image.asset('assets/img/login_logo.png'),
                      // child: Text(
                      //   europeanCountries[index],
                      //   style: TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 20.0,
                      //       fontFamily: "WorkSansSemiBold"),
                      // ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
