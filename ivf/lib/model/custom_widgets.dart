

import 'package:flutter/material.dart';
import 'package:ivf/assets/const.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FormCard extends StatefulWidget {
  final IconData iconName;
  final double vertical;
  final String hint;
  FormCard({this.vertical = 1.0, @required this.iconName, @required this.hint});

  @override
  _FormCardState createState() => _FormCardState();
}

class _FormCardState extends State<FormCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        margin:
            EdgeInsets.symmetric(vertical: widget.vertical.h, horizontal: 2.h),
        child: Container(
            child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(2.h, 0.5.h, 0, 0.5.h),
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: Icon(widget.iconName, color: kMainColor),
                  hintText: widget.hint,
                  labelText: widget.hint,

                ),
                style: TextStyle(
                  color: Colors.teal.shade900,
                  fontSize: 12.0,
                ),
              ),
            ),
          ],
        )));
  }
}
