import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:contract_manger/assets/constants.dart';
import 'package:contract_manger/assets/globals.dart';

class SelectDate {
  Future<void> selectDate(BuildContext context, DateTypeEnum dateType) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: todayDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2050));

    if (dateType == DateTypeEnum.startingDateE) {
      startingDate =
          (picked != null && picked != startingDate) ? picked : startingDate;
      controllerStartingDate.text = convertDateTimeToPrinting(startingDate);
    } else if (dateType == DateTypeEnum.endingDateE) {
      endingDate =
          (picked != null && picked != endingDate) ? picked : endingDate;
      controllerEndingDate.text = convertDateTimeToPrinting(endingDate);
    }
  }

  Future<void> selectTime(BuildContext context, DateTypeEnum dateType) async {
      selectedTimeRTL = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child,
        );
      },
    );
    controllerNotificationTime.text = selectedTimeRTL.format(context);
  }
}
