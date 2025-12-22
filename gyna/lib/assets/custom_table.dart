

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget generateFirstColumnRow(BuildContext context, int index , {List<bool> selectedItemsList}) {
  return Container(
      width: 100,
      height: 52,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
      child: Checkbox(
        value: selectedItemsList[index] ?? false,
        onChanged: (bool change) {
          // selectedItemsList[index] = change;
        },
      ));
}