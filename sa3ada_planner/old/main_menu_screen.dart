import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'file:///home/m/AndroidStudioProjects/sa3ada_planner/old/constants.dart';
import '../lib/screens/home_subscreens/occassion_item.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

const kIconSize = 90.0;

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar,
      body: Stack(
        children: [
          Container(
            decoration: kBackgroundImage,
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OccasionItem(
                  occasionName: "BirthDay",
                  occasionImage: "assets/images/cake.png",
                ),
                OccasionItem(
                  occasionName: "Wedding",
                  occasionImage: "assets/images/wedding.png",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
