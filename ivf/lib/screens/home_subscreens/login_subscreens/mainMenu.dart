import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ivf/assets/const.dart';
import 'package:ivf/sub_model/main_menu_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:ivf/assets/global.dart' as global;

class MainMenuScreen extends StatefulWidget {
  @override
  _MainMenuScreenState createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return SafeArea(
        child: MaterialApp(
          home: Container(
            decoration: kBackgroundBox,
            child: ValueListenableBuilder(
            valueListenable: global.isEng,
          builder: (context2, value, widget) {
            return Scaffold(
              //backgroundColor: Color.fromRGBO(109, 33, 79, 1),
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 1.h),
                        child: CircleAvatar(
                          radius: 12.0.h,
                          backgroundImage: AssetImage('images/logo.jpg'),
                        ),
                      ),
                    ),

                    Container(
                      height: Adaptive.h(66.0),
                      decoration: BoxDecoration(
                        color: Colors.white12,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      margin: EdgeInsets.all(
                        3.0.h,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              MainMenuButton(
                                iconSelected: FontAwesomeIcons.calendarCheck,
                                inputText: value? 'Appointment' : "احجز الان",
                                routeName: '/login/menu/booking',
                                contextGiven: context,
                              ),
                              SizedBox(
                                height: 15.0.h,
                                child: VerticalDivider(
                                  color: Colors.teal.shade100,
                                ),
                              ),
                              MainMenuButton(
                                iconSelected: FontAwesomeIcons.idCardAlt,
                                inputText: value ? 'Medical\n Profile' : "السجل الطبي",
                                routeName: '/login/menu/profile',
                                contextGiven: context,
                              ),

                            ],
                          ),
                          SizedBox(
                            width: 80.0.w,
                            child: Divider(
                              color: Colors.teal.shade100,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              MainMenuButton(
                                iconSelected: FontAwesomeIcons.userMd,
                                inputText: value ? 'Medical\n  Hints' : "نصائح طبيه ",
                                routeName: '/login/menu/hints',
                                contextGiven: context,
                              ),

                              SizedBox(
                                height: 15.0.h,
                                child: VerticalDivider(
                                  color: Colors.teal.shade100,
                                ),
                              ),

                              MainMenuButton(
                                iconSelected: FontAwesomeIcons.fileInvoiceDollar,
                                inputText: value ? 'Medical\n Offers' : "عروض طبيه",
                                routeName: '/login/menu/offers',
                                contextGiven: context,
                              ),

                            ],
                          ),
                          SizedBox(
                            width: 80.0.w,
                            child: Divider(
                              color: Colors.teal.shade100,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              MainMenuButton(
                                iconSelected: FontAwesomeIcons.notesMedical,
                                inputText: value ? 'Visits' : "حجوزات سابقه",
                                routeName: '/login/menu/past_booking',
                                contextGiven: context,
                              ),

                              SizedBox(
                                height: 15.0.h,
                                child: VerticalDivider(
                                  color: Colors.teal.shade100,
                                ),
                              ),
                              MainMenuButton(
                                iconSelected: FontAwesomeIcons.info,
                                inputText: value ? 'About\n   Us' : "من نحن ",
                                routeName: '/login/menu/past_booking/rating',
                                contextGiven: context,
                              ),

                            ],
                          ),
                          // SizedBox(
                          //   width: 80.0.w,
                          //   child: Divider(
                          //     color: Colors.teal.shade100,
                          //   ),
                          // ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ) ;

          }
            ),
          ),
        ),
      );
    });
  }
}
