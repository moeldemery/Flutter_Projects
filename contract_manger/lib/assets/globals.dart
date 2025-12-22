library contract_manger.globals;
import 'package:contract_manger/components/show_notification.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



final CustomNotification notification =  CustomNotification();

DateTime todayDate        = new DateTime.now();
DateTime startingDate     = new DateTime.now();
DateTime endingDate       = new DateTime.now();
TimeOfDay selectedTimeRTL = new TimeOfDay.now() ;

final contractTitleController = TextEditingController();
final organisationNameController = TextEditingController();
final controllerStartingDate = TextEditingController();
final controllerEndingDate   = TextEditingController();
final controllerNotificationTime   = TextEditingController();

bool isContactNameEmpty = true;
bool isOrganizationNameEmpty = true;

List<Widget> contractList=[];
List<String> cardDataList ;



enum DateTypeEnum {
  startingDateE,
  endingDateE
}

String convertDateTimeToPrinting(DateTime dateTime){
  String dateForPrinting =
      "${dateTime.day.toString().padLeft(2,'0')} /"
      "${dateTime.month.toString().padLeft(2,'0')} /"
      "${dateTime.year.toString().padLeft(2,'0')}";

  return dateForPrinting;
}

void clearGlobalVariableDateTime(){
  contractTitleController.clear();
  organisationNameController.clear();
  controllerStartingDate.clear();
  controllerEndingDate.clear();
  controllerNotificationTime.clear();


  isContactNameEmpty=true;
  isOrganizationNameEmpty=true;

  controllerStartingDate.text=null;
  startingDate = new DateTime.now();
  endingDate   = new DateTime.now();
  selectedTimeRTL = new TimeOfDay.now();
}