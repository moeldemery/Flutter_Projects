import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


Future<bool> showDeleteConfirm(BuildContext context) async {
  Future<bool> confirm;
    await Alert(
      context: context,
      type: AlertType.warning,
      title: "DELETING CONTRACT",
      desc: "Are you sure you want to delete this contract ??",
      buttons: [
        DialogButton(
          child: Text(
            "YES",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Navigator.pop(context);
            confirm = Future.value(true);
          },
          gradient: LinearGradient(colors: [
            Color.fromRGBO(0, 0, 52, 1.0),
            Color.fromRGBO(0, 0, 255, 1.0),
          ]),
        ),
        DialogButton(
          child: Text(
            "NO",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
            confirm = Future.value(false);
          },
          gradient: LinearGradient(colors: [
            Color.fromRGBO(255, 0, 0, 1.0),
            Color.fromRGBO(52, 0, 0, 1.0)
          ]),
        )
      ],
    ).show();
    return confirm;
  }

