import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

//main file is used for coloring and text styling

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColorDark: Color(0xFF616161),
        primaryColorLight: Color(0xFF111111),
        primaryColor: Color(0xFF9E9E9E),
        accentColor: Color(0xFF607D8B),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: InputPage(),  //first screen page

    );
  }
}
