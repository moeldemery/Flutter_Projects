import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:home_care/assets/constants.dart';

import 'main_menu_page.dart';

class BookingMenu extends StatefulWidget {
  @override
  _BookingMenuState createState() => _BookingMenuState();
}

class _BookingMenuState extends State<BookingMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        IconButton(
                          padding: kIconButtonOuterPadding,
                          iconSize: kIconSize,
                          icon: Icon(
                            FontAwesomeIcons.vials,
                            color: Colors.white,
                          ),
                          onPressed: (){
                            Navigator.pushNamed(context, '/login/mainMenu/bookingMenu/bookingHomeVisit');
                          },
                        ),
                        Text('Laboratory' ,style: kIconButtonTextS,),
                      ],
                    ),
                    SizedBox(height: 30.0,),
                    Column(
                      children: [
                        IconButton(
                          padding: kIconButtonOuterPadding,
                          iconSize: kIconSize,
                          icon: Icon(
                            FontAwesomeIcons.xRay,
                            color: Colors.white,
                          ),
                          onPressed: (){
                            Navigator.pushNamed(context, '/login/mainMenu/bookingMenu/bookingHomeVisit');
                          },
                        ),
                        Text('Radiology' ,style: kIconButtonTextS,),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        IconButton(
                          padding: kIconButtonOuterPadding,
                          iconSize: kIconSize,
                          icon: Icon(
                            FontAwesomeIcons.userMd,
                            color: Colors.white,
                          ),
                          onPressed: (){
                            Navigator.pushNamed(context, '/login/mainMenu/bookingMenu/bookingHomeVisit');
                          },
                        ),
                        Text('Nurse' ,style: kIconButtonTextS,),
                      ],
                    ),
                    SizedBox(height: 30.0,),
                    Column(
                      children: [
                        IconButton(
                          padding: kIconButtonOuterPadding,
                          iconSize: kIconSize,
                          icon: Icon(
                            FontAwesomeIcons.commentDots,
                            color: Colors.white,
                          ),
                          onPressed: (){

                          },
                        ),
                        Text('Others' ,style: kIconButtonTextS,),
                      ],
                    ),
                  ],
                ),

              ],
            ),
            Padding(
              padding:kButtonMiniPadding,
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
                      style: kButtonTextS,
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
      ),
    );
  }
}
