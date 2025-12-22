import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:home_care/assets/constants.dart';
import 'package:home_care/models/user.dart';
import 'package:home_care/services/auth.dart';
import 'package:provider/provider.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

const kIconSize = 90.0;

class _MainMenuState extends State<MainMenu> {
  final AuthServices _auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthServices().user,
      child: Scaffold(
        appBar: kAppBar,
        body: Container(
          decoration: kBackgroundImage,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      IconButton(
                          iconSize: kIconSize,
                          padding: kIconButtonOuterPadding,
                          //tooltip: 'Increase volume by 10',
                          icon: Icon(
                            FontAwesomeIcons.handPointUp,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(
                                context, '/login/mainMenu/bookingMenu');
                          }),
                      Text(
                        'Booking',
                        style: kIconButtonTextS,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                          iconSize: kIconSize,
                          padding: const EdgeInsets.all(8.0),
                          icon: Icon(
                            FontAwesomeIcons.tags,
                            color: Colors.white,
                          ),
                          onPressed: () {}),
                      Text(
                        'Offers',
                        style: kIconButtonTextS,
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      IconButton(
                          iconSize: kIconSize,
                          padding: const EdgeInsets.all(8.0),
                          icon: Icon(
                            FontAwesomeIcons.starHalf,
                            color: Colors.white,
                          ),
                          onPressed: () {}),
                      Text(
                        'Rating',
                        style: kIconButtonTextS,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                          iconSize: kIconSize,
                          padding: const EdgeInsets.all(8.0),
                          icon: Icon(
                            FontAwesomeIcons.gifts,
                            color: Colors.white,
                          ),
                          onPressed: () {}),
                      Text(
                        'Gifts',
                        style: kIconButtonTextS,
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      IconButton(
                          iconSize: kIconSize,
                          padding: const EdgeInsets.all(8.0),
                          icon: Icon(
                            FontAwesomeIcons.rssSquare,
                            color: Colors.white,
                          ),
                          onPressed: () {}),
                      Text(
                        'View Booking',
                        style: kIconButtonTextS,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                          iconSize: kIconSize,
                          padding: const EdgeInsets.all(8.0),
                          icon: Icon(
                            FontAwesomeIcons.signOutAlt,
                            color: Colors.white,
                          ),
                          onPressed: () async {
                            await _auth.signOut();
                            Navigator.pop(context);
                          }),
                      Text(
                        'Sign Out',
                        style: kIconButtonTextS,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
