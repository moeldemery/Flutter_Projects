import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:home_care/assets/constants.dart';

import 'main_menu_page.dart';

class BookingSelection extends StatefulWidget {
  @override
  _BookingSelectionState createState() => _BookingSelectionState();
}
List<bool> toggleList = [false , false];

class _BookingSelectionState extends State<BookingSelection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar,
      body: Container(
          decoration: kBackgroundImage,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        IconButton(
                          padding: kIconButtonOuterPadding,
                          iconSize: kIconSize,
                          icon: Icon(
                            FontAwesomeIcons.hospitalUser,
                            color: Colors.white,
                          ),
                          onPressed: (){
                            Navigator.pushNamed(context, '/login/mainMenu/bookingMenu/bookingSelection/bookingHomeVisit/bookingInfo');
                          },
                        ),
                        Text('Branch \nVisit' ,style: kIconButtonMiniTextS,),
                      ],
                    ),
                    SizedBox(height: 30.0,),
                    Column(
                      children: [
                        IconButton(
                          padding: kIconButtonOuterPadding,
                          iconSize: kIconSize,
                          icon: Icon(
                            FontAwesomeIcons.home,
                            color: Colors.white,
                          ),
                          onPressed: (){
                            Navigator.pushNamed(context, '/login/mainMenu/bookingMenu/bookingSelection/bookingHomeVisit');
                          },
                        ),
                        Text('Home \nVisit' ,style: kIconButtonMiniTextS,),
                      ],
                    ),
                  ],
                  ),
                  SizedBox(height: 75.0,),
                  Padding(
                    padding: kButtonMiniPadding,
                    child: RaisedButton(
                      color: kButtonColor,
                      shape: kButtonShape,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.backward,
                            color: Colors.white,
                            size: 20.0,
                          ),
                          Text(
                            '  Go Back  ',
                            style: kIconButtonTextS,
                          ),
                        ],
                      ),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
      ),
    );
  }
}
