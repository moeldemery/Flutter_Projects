import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ivf/assets/const.dart';
import 'package:ivf/screens/home_subscreens/login_subscreens/mainMenu_subscreens/pastBooking_subscreens/booking_card_buttons.dart';
import 'package:ivf/screens/home_subscreens/login_subscreens/mainMenu_subscreens/pastBooking_subscreens/rating.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:ivf/assets/global.dart' as global;

class PastBookingScreen extends StatefulWidget {
  @override
  _PastBookingScreenState createState() => _PastBookingScreenState();
}

class _PastBookingScreenState extends State<PastBookingScreen> {
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
                appBar: kAppBar(h: 1.h, w: 1.w),
                backgroundColor: Colors.transparent,
                body: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 4.0.h,
                      ),
                      Center(
                        child: Text(
                          value?"Past Bookings":"الحجوزات السابقه",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 10.w),
                        ),
                      ),
                      SizedBox(
                        width: 65.w,
                        height: 3.h,
                        child: Divider(
                          color: Colors.teal.shade100,
                        ),
                      ),
                      Container(
                        height: 70.h,
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            BookingCard(
                              bookingName: "Primary Doctor Mohammed Alsaid",
                              bookingDate: "22 march 2021",
                            ),
                            BookingCard(
                              bookingName: "Primary Doctor Mohammed Alsaid",
                              bookingDate: "1st march 2021",
                            ),
                            BookingCard(
                              bookingName: "Secondary Doctor Mohammed Ahmed",
                              bookingDate: "22nd february 2021",
                            ),
                            BookingCard(
                              bookingName: "Primary Doctor Mohammed Alsaid",
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );}

            ),
          ),
        ),
      );
    });
  }
}

class BookingCard extends StatefulWidget {
  @override
  _BookingCardState createState() => _BookingCardState();
  final String bookingName;
  final String bookingDate;
  BookingCard({this.bookingName ="",this.bookingDate = ""});
}

class _BookingCardState extends State<BookingCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150.0,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Colors.white,
          elevation: 10,
          child: Row(
            children: [
              Expanded(flex: 33, child: Image.asset('images/logo.jpg')),
              Expanded(
                flex: 66,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      title: Text(widget.bookingName,
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                      subtitle: Text(widget.bookingDate, style: TextStyle(color: Colors.black)),
                    ),
                    ButtonBarTheme(
                      data: ButtonBarThemeData(),
                      child: ValueListenableBuilder(
    valueListenable: global.isEng,
    builder: (context2, value, widget) {
                        return ButtonBar(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            CardButton(
                              w: 1.w,
                              iconName: Icons.edit,
                              buttonText: value ? 'Edit' : "تعديل",
                              iconColor: Colors.black,
                            ),
                            CardButton(
                              w: 1.w,
                              iconName: Icons.star,
                              buttonText: value ? 'Rate' : "تقييم",
                              iconColor: Colors.yellowAccent,
                              colored: false,
                              contextGiven: context,
                              newScreen:  RatingScreen(),

                              //routeName: '/login/menu/past_booking/rating',
                            ),
                            CardButton(
                              w: 1.w,
                              iconName: Icons.delete,
                              buttonText: value ? 'Delete' : "حذف ",
                              iconColor: Colors.red,
                              colored: false,
                            ),


                          ],
                        );}

                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
