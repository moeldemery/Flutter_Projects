import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MainMenuButton extends StatefulWidget {
  final IconData iconSelected;
  final String inputText;
  final String routeName;
  final BuildContext contextGiven;
  MainMenuButton({this.iconSelected , this.inputText , this.routeName , this.contextGiven});
  @override
  _MainMenuButtonState createState() => _MainMenuButtonState();
}

class _MainMenuButtonState extends State<MainMenuButton> {
  @override
  Widget build(BuildContext context) {
      return InkWell(
        onTap: () {
          Navigator.pushNamed(widget.contextGiven, widget.routeName);
        },
        child: Card(
         shadowColor: Colors.transparent,

          color: Colors.transparent,
          child: Container(
            width: 37.w,
            height: 37.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  widget.iconSelected,
                  size: 75,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  widget.inputText,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    // fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  }
}
