import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ivf/assets/const.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:ivf/assets/global.dart' as global;


class DatePickerScreen extends StatefulWidget {
  @override
  _DatePickerScreenState createState() => _DatePickerScreenState();
}

class _DatePickerScreenState extends State<DatePickerScreen> {
  final Color indicatorColor = const Color(0xFF5CFFB7);
  final Color highlightColor = const Color(0xFF0000ff);
  final Color cellTextColor = const Color(0xFF000000);



  bool isDateOneOfTheSelected(int givenDateDay){
    bool isFound = false;
    List<int> selectedDates =[2,3,4,5,6,7,9,19,15,21,25,29];
    for(int x in selectedDates){
      if(givenDateDay == x){
        isFound=true;
      }
    }
    return isFound;
  }
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return SafeArea(
        child: MaterialApp(
          home: Container(
            decoration: kBackgroundBox,
            child: ValueListenableBuilder(
            valueListenable: global.isEng,
          builder: (context2, value, widget) {
              return Scaffold(
                appBar: kAppBar(h: 1.h, w: 1.w),
                backgroundColor: Colors.transparent,
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 2.0.h,
                    ),
                    Center(
                      child: Text(
                        value?"Pick an Appointment":"معاد الحجز",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white, fontSize: 9.w),
                      ),
                    ),
                    SizedBox(
                      width: 65.w,
                      height: 3.h,
                      child: Divider(
                        color: Colors.teal.shade100,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(
                        children: [
                          Container(
                            height: 55.h,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15.0),
                              ),
                              image: DecorationImage(
                                colorFilter: new ColorFilter.mode(
                                    Colors.black.withOpacity(0.8), BlendMode.dstATop),
                                image: AssetImage("images/logo.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SfDateRangePicker(
                                view: DateRangePickerView.month,
                                monthViewSettings: DateRangePickerMonthViewSettings(firstDayOfWeek: 0),
                                showActionButtons: false,
                                showNavigationArrow: true,
                                onCancel: (){},
                                onSubmit: (a){},

                                selectionShape: DateRangePickerSelectionShape.rectangle,
                                selectionColor: highlightColor,


                                headerStyle: DateRangePickerHeaderStyle(
                                    textAlign: TextAlign.center,
                                    textStyle: TextStyle(
                                      fontSize: 22,
                                      color: cellTextColor,
                                    ),),

                                cellBuilder: (context , cellDetails){

                                  return Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Container(
                                      decoration:  BoxDecoration(
                                        color:  isDateOneOfTheSelected(cellDetails.date.day)?
                                        Color.fromARGB(150, 64, 196, 255):Colors.transparent,//40C4FF

                                        border: Border.all(
                                          color: Colors.black,
                                          width:isDateOneOfTheSelected(cellDetails.date.day)? 1.5:1,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Center(
                                        child: Text(
                                          cellDetails.date.day.toString(),
                                          style:TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold) ,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                // monthCellStyle: DateRangePickerMonthCellStyle(
                                //   cellDecoration: BoxDecoration(
                                //     color:  Colors.transparent,
                                //
                                //     border: Border.all(
                                //       color: Colors.black,
                                //       width: 1,
                                //     ),
                                //     borderRadius: BorderRadius.circular(12),
                                //   ),
                                //   todayTextStyle: TextStyle(color: Colors.indigo[900],fontSize: 24.0,fontWeight: FontWeight.bold),
                                //   textStyle: TextStyle(fontSize: 16.0),
                                //
                                //
                                // ),

                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3.0.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Material(
                                  elevation: 5.0,
                                  color: Colors.white,
                                  borderRadius: BorderRadius.horizontal(left: Radius.circular(30.0)),
                                  child: MaterialButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    minWidth: 130.0,
                                    height: 7.0.h,
                                    child: Text(
                                      value? 'Back' :"العوده",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: kMainColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )),

                              Material(
                                  elevation: 5.0,
                                  color: kMainColor,
                                  borderRadius: BorderRadius.horizontal(right: Radius.circular(30.0)),
                                  child: MaterialButton(
                                    onPressed: () {

                                      Navigator.pushNamed(context, '/sign_up');
                                    },
                                    minWidth: 170.0,
                                    height: 7.0.h,
                                    child: Text(
                                      value? 'Book Now' :"احجز الان",
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                          // Theme(
                          //   //TODO: change colors
                          //
                          //   data: ThemeData.dark().copyWith(
                          //     textTheme: TextTheme(
                          //
                          //       caption: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                          //       bodyText1: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                          //
                          //     ),
                          //     colorScheme: ColorScheme.dark(
                          //       primary: Colors.deepPurple[500],
                          //       onPrimary: Colors.white,
                          //       surface: Colors.red[800],
                          //       onSurface: Colors.black,
                          //
                          //     ),
                          //     dialogBackgroundColor: Colors.white,
                          //
                          //   ),
                          //   child:  CalendarDatePicker(
                          //
                          //     initialDate: DateTime.now(),
                          //     firstDate: DateTime(2000),
                          //     lastDate: DateTime(2050),
                          //     onDateChanged: (date){},
                          //
                          //
                          //   ),
                          // ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }

            ),
          ),
        ),
      );
    });
  }
}
