import 'package:flutter/material.dart';
import 'package:home_care/screens/booking_info.dart';
import 'package:home_care/screens/main_menu_page.dart';
import 'package:home_care/screens/booking_branch.dart';
import 'package:home_care/screens/booking_home_visit.dart';
import 'package:home_care/screens/booking_menu_page.dart';
import 'package:home_care/screens/booking_selection_page.dart';
import 'package:home_care/screens/login_page.dart';
import 'package:home_care/screens/home_page.dart';
import 'package:home_care/screens/register.dart';
import 'package:home_care/screens/wrapper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) =>MyHomePage(), //Wrapper(),   //
        '/register':(context) =>Register(),
        '/login': (context) => Login(),
        '/login/mainMenu': (context) => MainMenu(),
        '/login/mainMenu/bookingMenu': (context) => BookingMenu(),
        '/login/mainMenu/bookingMenu/bookingHomeVisit': (context) =>
            BookingHomeVisit(),
        '/login/mainMenu/bookingMenu/bookingHomeVisit/bookingInfo': (context) =>
            BookingInfo(),
      },
    );
  }
}
