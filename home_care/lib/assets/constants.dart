import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//---------Background---------
const kBackgroundImage = BoxDecoration(
  image: DecorationImage(
    image: AssetImage('assets/images/background.jpg'),
    fit: BoxFit.cover,
  ),
);

//---------Logo---------
const kLogoImage = AssetImage('assets/images/logo.png');

//---------Button---------
const kButtonTextS =
    TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.w800);
final kButtonColor = Colors.blue.shade700;
final kButtonGoogleColor = Colors.red.shade800;
final kButtonFaceBookColor = Colors.blue.shade900;
final kButtonShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(18.0),
  side: BorderSide(color: Colors.blue.shade900),
);
const kButtonPadding = EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0);
const kButtonOuterPadding = const EdgeInsets.all(8.0);
const kButtonMiniPadding = EdgeInsets.symmetric(horizontal: 50.0);

const kButtonMapPadding = EdgeInsets.symmetric(horizontal: 50.0 , vertical: 10.0);
//---------FormField---------
const kTextFormFieldTextS = TextStyle(
  backgroundColor: Colors.white,
);

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

//---------IconButton---------
const kIconButtonOuterPadding = const EdgeInsets.all(8.0);
const kIconButtonTextS =
    TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.w900);
const kIconButtonMiniTextS =
    TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w900);

const kIconButtonMapTextS =
TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.w700 );
//---------Logo---------
