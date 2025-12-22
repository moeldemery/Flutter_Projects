import 'dart:convert';
import 'package:contract_manger/assets/globals.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:contract_manger/components/add_card_to_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:contract_manger/components/show_notification.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;


class SubmitButton extends StatefulWidget {
  @override
  _SubmitButtonState createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  AddCard addCard = AddCard();


  void saveToLocalMemory()async{
    //creating a json structure to save locally
    var cardData = {};
    cardData["contractName"]      = contractTitleController.text;
    cardData["organisationName"]  = organisationNameController.text;
    cardData["startingDate"]      = startingDate.toIso8601String();
    cardData["endingDate"]        = endingDate.toIso8601String();
    String encodedCardData =jsonEncode(cardData);
    cardDataList.add(encodedCardData);

    //preparing for saving to local memory
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('cardDataList', cardDataList);
    print("$cardDataList : is the new list now");
  }


   Future<void> addingScheduleNotification() async {
     final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
     tz.TZDateTime scheduledDate =    tz.TZDateTime.from(endingDate, tz.local);
     print('$scheduledDate cc');
  //   // if (scheduledDate.isBefore(now)) {
  //   //   // scheduledDate = scheduledDate.add(const Duration(days: 1));
  //   // }
  //
    await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'WARNING',
        'Contract Is About to end soon !!! ',
        scheduledDate,
        const NotificationDetails(
          android: AndroidNotificationDetails(
              'daily notification channel id',
              'daily notification channel name',
              'daily notification description'),
        ),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time);
   }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: ()  {

        setState(() {
          if(endingDate.isBefore(startingDate)){
            Flushbar(
              title: "Adding Failed",
              message: "Ending Date can't be before the Starting Date ! ",
              duration: Duration(seconds: 5),
              margin: EdgeInsets.all(8),
              borderRadius: 8,
              icon: Icon(
                Icons.clear,
                color: Colors.redAccent,
                size: 25.0,
              ),
            )..show(context);
          }
          else if (isContactNameEmpty == false && isOrganizationNameEmpty == false  ) {
            endingDate = DateTime(endingDate.year, endingDate.month, endingDate.day,
                selectedTimeRTL.hour, selectedTimeRTL.minute);
            print(endingDate);
            addingScheduleNotification();
            contractList.add(
                  addCard.addNewCard(
                    contractName: contractTitleController.text,
                    organisationName: organisationNameController.text,
                  )
                );
            saveToLocalMemory();
            Navigator.pop(context);
            Flushbar(
              title: "Contract Added",
              message:
                  "The contract has been successfully added to your list ! ",
              duration: Duration(seconds: 5),
              margin: EdgeInsets.all(8),
              borderRadius: 8,
              icon: Icon(
                Icons.check,
                color: Colors.greenAccent,
                size: 25.0,
              ),
            )..show(context).then((value) {
                clearGlobalVariableDateTime();
              });
          }
          else {
            Flushbar(
              title: "Adding Failed",
              message: "Please check the required Fields ! ",
              duration: Duration(seconds: 5),
              margin: EdgeInsets.all(8),
              borderRadius: 8,
              icon: Icon(
                Icons.clear,
                color: Colors.redAccent,
                size: 25.0,
              ),
            )..show(context);
          }
        });

      },
      child: Text('Submit'),
    );
  }
}


