import 'package:flutter/material.dart';
import 'package:ticket_system/view/welcome_subscreen/login_screen.dart';
import 'package:ticket_system/view/welcome_subscreen/registration_screen.dart';
import 'package:ticket_system/view/welcome_screen.dart';
import 'view/welcome_subscreen/login_subscreen/home_screen.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => WelcomeScreen(),
        '/login' : (context) => LoginScreen(),
        '/register' : (context) => RegistrationScreen(),
        'home': (context) => MyHomePage(), //

      },
    );
  }
}


