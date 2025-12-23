import 'package:flutter/material.dart';
import 'package:sa3ada_planner/screens/home_subscreens/giftShop_screen.dart';
import 'package:sa3ada_planner/screens/home_subscreens/places_screen.dart';



import 'package:sa3ada_planner/screens/home_screen.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/giftShop',
      routes: {
        '/': (context) =>HomeScreen(),//HomeScreen(),//MainMenu(),//HomeScreen(),    //
        '/places':(context) =>PlacesMenu(),
        '/giftShop':(context) =>GiftShopMenu(),

      },
    );
  }
}

