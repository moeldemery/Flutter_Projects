import 'package:flutter/material.dart';
import 'package:ivf/model/form_provider.dart';
import 'package:ivf/screens/home.dart';
import 'package:ivf/screens/home_subscreens/login.dart';
import 'package:ivf/screens/home_subscreens/login_subscreens/mainMenu.dart';
import 'package:ivf/screens/home_subscreens/login_subscreens/mainMenu_subscreens/booking.dart';
import 'package:ivf/screens/home_subscreens/login_subscreens/mainMenu_subscreens/booking_subscreens/date_picker.dart';
import 'package:ivf/screens/home_subscreens/login_subscreens/mainMenu_subscreens/hints.dart';
import 'package:ivf/screens/home_subscreens/login_subscreens/mainMenu_subscreens/offers.dart';
import 'package:ivf/screens/home_subscreens/login_subscreens/mainMenu_subscreens/pastBooking_subscreens/rating.dart';
import 'package:ivf/screens/home_subscreens/login_subscreens/mainMenu_subscreens/pastBookings.dart';
import 'package:ivf/screens/home_subscreens/login_subscreens/mainMenu_subscreens/profile.dart';
import 'package:ivf/screens/home_subscreens/signup.dart';
import 'package:object_mapper/object_mapper.dart';
import 'package:odoo_api/odoo_api.dart';

import 'model/odoo_auth.dart';


void main() {

  Mappable.factories = {
    //PatientDTO: () => PatientDTO(),
  };

  final client = OdooClient(OdooAuth.baseUrl);
  OdooAuth.odooConnectDB(client);

  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FormProvider(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        // home: Scaffold(
        //   body:  HomeScreen(),
        // ),
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),//PastBookingScreen(),
          '/login': (context) =>new LoginScreen(),
          '/sign_up': (context) =>new SignupScreen(),
          '/login/menu': (context) => MainMenuScreen(),
          '/login/menu/booking': (context) =>new  BookingDoctorScreen(),
          '/login/menu/booking/pick_date':(context) => new DatePickerScreen(),
          '/login/menu/profile': (context) =>new  ProfileScreen(),
          '/login/menu/offers': (context) =>new  OfferScreen(),
          '/login/menu/hints': (context) =>new  HintsScreen(),
          '/login/menu/past_booking': (context) =>new  PastBookingScreen(),
          '/login/menu/past_booking/rating': (context) =>new  RatingScreen(),

        },
      ),
    );
  }
}
