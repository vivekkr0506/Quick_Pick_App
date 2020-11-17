import 'package:flutter/material.dart';
import 'package:quick_pick/ui/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

//import 'main_page.dart';
int initScreen;
//void main() => runApp(new MyApp());
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = await prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);
  print('initScreen ${initScreen}');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Quick App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      // initialRoute: initScreen == 0 || initScreen == null ? "first" : "/",
      // routes: {
      //   '/': (context) => MainPage(),
      //   "first": (context) => OnboardingScreen(),
      // },
      home: new SplashScreen(),
      //home: initScreen == 0 || initScreen == null? OnboardingScreen() : LoginPage(),
      debugShowCheckedModeBanner: false,
      darkTheme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      themeMode: ThemeMode.system,
    );
  }
}
