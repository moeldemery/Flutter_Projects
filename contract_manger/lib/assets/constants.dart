import 'package:flutter/material.dart';

/*constant for easier editing colors and Heights*/
const kBottomContainerHeight = 80.0;
const kCardColor = Color(0xFF455A64);
const kTextColor =Color(0xFF111328);
const kSubTextColor =Color(0xFF454746);
const kWhiteTextColor =Color(0xFFe4ede6);
const kTimeLeftTextColor =Color(0xFFe4ede6);
const kTimeLeftNumberColor =Color(0xFF111328);
const kTimeLeftBackgroundColor =Color(0xFFe30505);

const kIconSize = 30.0;

const kLabelTextStyle = TextStyle(
  fontSize: 18.0,
  color: kTextColor,
);

const kLabelBigText = TextStyle(
  fontSize: 22.0,
  fontWeight: FontWeight.w500,

  color: kTextColor,
);

const kTitleText = TextStyle(
  fontSize: 28.0,
  fontWeight: FontWeight.w700,
  color: kTextColor,
);
const kSubTitleText = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.w100,
  color: kSubTextColor,
);
const kDeleteText = TextStyle(
  fontSize: 30.0,
  fontWeight: FontWeight.w500,
  color: kWhiteTextColor,
);
const kTimeLeftText = TextStyle(
  fontSize: 19.0,
  fontWeight: FontWeight.w500,
  color: kTimeLeftTextColor,
  backgroundColor:kTimeLeftBackgroundColor,
);
const kTimeLeftNumberText = TextStyle(
  fontSize: 45.0,
  fontWeight: FontWeight.w700,
  color: kTimeLeftNumberColor,
);

var kDecorationBox = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.all(Radius.circular(20.0)),
  boxShadow:[ BoxShadow(
    color: Colors.black.withAlpha(100),
    blurRadius: 10.0,
  ),],
);