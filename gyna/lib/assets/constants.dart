import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//---------Background---------
const kBackgroundImage = BoxDecoration(

  image: DecorationImage(
    image: AssetImage('assets/images/background2.jpg'),
    fit: BoxFit.fill,
  ),
);

//---------Logo---------
const kLogoImage = AssetImage('assets/images/logo.png');

//---------AppBar---------
final kAppBar = AppBar(
  toolbarHeight: 90.0,
  title: Center(
    child: Image.asset('assets/images/logo.png',
        fit: BoxFit.fill, height: 90.00, width: 225.00),
  ),
  backgroundColor: Colors.white,
  iconTheme: IconThemeData(color: Colors.blue),
);

final kAppBar2 = AppBar(
  toolbarHeight: 90.0,
  title: Center(
      child: Text(
    "Women Care Portal",
    style: TextStyle(
      fontFamily: 'FugazOne',
      color: Color(0xFFe4d3cf),
      fontSize: 30.0,
      fontWeight: FontWeight.w900,
    ),
  )),
  backgroundColor: Color(0xff8C2035),
  iconTheme: IconThemeData(color: Color(0xFFe4d3cf)),
);

//---------Drawer---------
final kDrawerTitle = TextStyle(
    // fontFamily: 'Cairo',
    color: Colors.red[300],
    fontSize: 30.0,
    fontWeight: FontWeight.w500);

final kDrawerTitleText = TextStyle(
    fontFamily: 'FugazOne',
    color: Color(0xFFe4d3cf),
    fontSize: 30.0,
    fontWeight: FontWeight.w500);



//---------Button---------

//---------FormField---------

//---------IconButton---------

//---------Places Card---------
