import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sa3ada_planner/assets/constants.dart';

import 'home_subscreens/occassion_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black,
      body: Container(
        decoration: kBackgroundImage,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 200.0,
                  width: 200.0,
                )),
            GestureDetector(
              child: OccasionItem(
                occasionName: "Birthday",
                occasionImage: "assets/images/cake2.png",
              ),
              onTap: () {
                Navigator.pushNamed(context, "/places");
              },
            ),
            OccasionItem(
              occasionName: "Marriage",
              occasionImage: "assets/images/marry.png",
            ),
            GestureDetector(
              child: OccasionItem(
                occasionName: "Gift Shop",
                occasionImage: "assets/images/gift.png",
              ),
              onTap: () {
                Navigator.pushNamed(context, "/giftShop");
              },
            ),
          ],
        ),
      ),
    );
  }
}
