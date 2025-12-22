import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:home_care/assets/constants.dart';

import 'main_menu_page.dart';

class BookingBranch extends StatefulWidget {
  @override
  _BookingBranchState createState() => _BookingBranchState();
}

const kTableCellStyle =TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 15.0 );

class _BookingBranchState extends State<BookingBranch> {

  String dropdownValue = 'Alexandria Governorate';
  String dropdownValue2 = 'Raml Branch';
  int selectedRadio;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90.0,
        title: Center(
            child: Image.asset('assets/images/logo.png',
                fit: BoxFit.fill, height: 90.00, width: 225.00)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.blue),
      ),
      body: Container(
        width: double.infinity,
        decoration: kBackgroundImage,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '\n\nSelect your Governorate :    اخطر محافظتك ',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w900),
            ),
            DropdownButton<String>(
              dropdownColor: Colors.blue,
              autofocus: false,
              value: dropdownValue,
              icon: Icon(Icons.arrow_downward , color: Colors.white,),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 30.0 ,),
              underline: Container(
                height: 2,
                color: Colors.white,
              ),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              items: <String>['Alexandria Governorate',
                              'Cairo Governorate',
                              'Giza Governorate',
                              'Suez Governorate']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            Text(
              '\n\n\nSelect Nearest Site :   اخطر اقرب فرع ',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w900),
            ),
            DropdownButton<String>(
              dropdownColor: Colors.blue,
              autofocus: false,
              value: dropdownValue2,
              icon: Icon(Icons.arrow_downward , color: Colors.white,),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 30.0 ,),
              underline: Container(
                height: 2,
                color: Colors.white,
              ),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue2 = newValue;
                });
              },
              items: <String>['Raml Branch',
                'Agami Branch',
                'Shatbi Branch']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
        SizedBox(height: 25.0,),
        DataTable(
          columns:  <DataColumn>[
            DataColumn(
              label: Text(' '),
            ),
            DataColumn(
              label: Text(
                'Day',
                style: TextStyle(fontStyle: FontStyle.italic,color: Colors.white,fontWeight: FontWeight.w900,fontSize: 20.0 ),
              ),
            ),
            DataColumn(
              label: Text(
                'Date',
                style: TextStyle(fontStyle: FontStyle.italic,color: Colors.white,fontWeight: FontWeight.w900,fontSize: 20.0 ),
              ),
            ),
            DataColumn(
              label: Text(
                'Time',
                style: TextStyle(fontStyle: FontStyle.italic,color: Colors.white,fontWeight: FontWeight.w900,fontSize: 20.0 ),
              ),
            ),
          ],
          rows: const <DataRow>[
            DataRow(
              cells: <DataCell>[
                DataCell(
                  Radio(
                  value: 0,
                  groupValue: 1,
                ),
                ),
                DataCell(Text('Monday' ,style: kTableCellStyle, )),
                DataCell(Text('19/8/2020',style: kTableCellStyle)),
                DataCell(Text('3:00 Pm',style: kTableCellStyle)),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(
                  Radio(
                    value: 0,
                    groupValue: 1,
                  ),
                ),
                DataCell(Text('Monday',style: kTableCellStyle)),
                DataCell(Text('19/8/2020',style: kTableCellStyle)),
                DataCell(Text('5:00 Pm',style: kTableCellStyle)),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(
                  Radio(
                    value: 1,
                    groupValue: 1,
                  ),
                ),
                DataCell(Text('Wednesday',style: kTableCellStyle)),
                DataCell(Text('21/8/2020',style: kTableCellStyle)),
                DataCell(Text('9:00 Am',style: kTableCellStyle)),
              ],
            ),
          ],
        ),
            SizedBox(height: 50.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: RaisedButton(
                color: Colors.blue.shade800,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.blue.shade900)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.calendar,
                      color: Colors.white,
                      size: 20.0,
                    ),
                    Text(
                      '  Confirm   ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
                onPressed: (){
                  //Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
