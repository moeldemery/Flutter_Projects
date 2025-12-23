
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ivf/assets/const.dart';

class CardButton extends StatefulWidget {
  final IconData iconName;
  final Color iconColor;
  final String buttonText;
  final bool colored;
  final Widget newScreen;
  final BuildContext contextGiven;
  final double w;

  const CardButton({
    this.iconName,
    this.iconColor,
    this.buttonText,
    this.colored = true,
    this.newScreen,
    this.contextGiven,
    this.w,
  }) ;

  @override
  _CardButtonState createState() => _CardButtonState();
}

class _CardButtonState extends State<CardButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(15.0),
      elevation: 10,
      //shadowColor: Color(0xFFFF8C3B),
      child: GestureDetector(
        onTap: (){
          //Navigator.pushNamed(widget.contextGiven, widget.routeName);
          Navigator.push(widget.contextGiven, new MaterialPageRoute(
              builder: (context) =>
               widget.newScreen)
          );
        },
        child: Container(
          height: 45,
          width: 18 * widget.w,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: widget.colored
                  ? [kMainColor, kMainColorGradient]
                  : [Colors.grey[300], Colors.white12],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Icon(
                  widget.iconName,
                  color: widget.iconColor,
                ),
              ),
              Text(
                widget.buttonText,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
