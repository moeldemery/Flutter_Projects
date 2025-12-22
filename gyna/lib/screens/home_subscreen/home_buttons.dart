
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeButtons extends StatefulWidget {
  final  IconData iconName;
  final String  title;
  final String path;
  HomeButtons({this.iconName,this.title ,this.path});
  @override
  _HomeButtonsState createState() => _HomeButtonsState();
}

class _HomeButtonsState extends State<HomeButtons> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        child: Card(
          child: Material(
            color: Color(0xffD2224A), // button color
            child: InkWell(
              splashColor: Colors.green, // splash color
              onTap: () {
                Navigator.pushNamed(context, widget.path);
              }, // button pressed
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                   widget.iconName,
                    size: 50.0,
                    color: Colors.white,
                  ), // icon
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    widget.title,
                    style: TextStyle(
                        color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.w900),
                  ), // text
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
