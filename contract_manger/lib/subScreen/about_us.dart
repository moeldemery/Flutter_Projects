import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


Future<void> showAboutUsConfirm(BuildContext context) async {
  await Alert(
    context: context,
    type: AlertType.info,
    title: "ABOUT US",
    desc: "This is a flutter based Application \n\n   created by \n Diwan Co. ,Alex , Egypt",
    buttons: [
      DialogButton(
        child: Text(
          "Cool",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
        gradient: LinearGradient(colors: [
          Color.fromRGBO(0, 52, 0 , 1.0),
          Color.fromRGBO(0, 255, 255, 1.0),
        ]),
      ),
    ],
  ).show();
}

