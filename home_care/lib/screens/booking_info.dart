import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:home_care/assets/constants.dart';

class BookingInfo extends StatefulWidget {
  @override
  _BookingInfoState createState() => _BookingInfoState();
}

TextEditingController patientNameController = new TextEditingController();
String dropdownValue = 'CPR Test';
enum PaymentType { cash, insurance }
final kCardActiveColor = Colors.blue.shade700;
final kCardInactiveColor = null;

Color cashColor;
Color insuranceColor;

class _BookingInfoState extends State<BookingInfo> {
  final formKey = new GlobalKey<FormState>();
  void updatePayment(PaymentType pay)
  {
    cashColor =
    (pay == PaymentType.cash) ? kCardActiveColor : kCardInactiveColor;
    insuranceColor =
    (pay == PaymentType.insurance) ? kCardActiveColor : kCardInactiveColor;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar,
      body: Container(
        decoration: kBackgroundImage,
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  //autovalidate: _validateOrganisationName,
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Organization name cannot be empty.';
                    } else {
                      var isOrganizationNameEmpty = false;
                      return null;
                    }
                  },
                  readOnly: false,
                  controller: patientNameController,
                  onTap: () {
                    //setState(() => _validateOrganisationName = true);
                  },
                  style: kTextFormFieldTextS,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    icon: Icon(
                      FontAwesomeIcons.user,
                      color: Colors.white,
                    ),
                    hintText: 'Full name',
                    labelText: 'Patient Name',
                    focusedBorder: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    labelText: 'Examination Type',
                    icon: Icon(
                      FontAwesomeIcons.stethoscope,
                      color: Colors.white,
                    ),
                  ),
                  dropdownColor: Colors.white,
                  autofocus: false,
                  value: dropdownValue,
                  icon: Icon(
                    Icons.arrow_downward,
                    color: Colors.blue,
                  ),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w900,
                    fontSize: 30.0,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: <String>[
                    'CPR Test',
                    'Corona Test',
                    'Blood Cell Count',
                    'Blood Test'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        child: Container(
                          margin: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: cashColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Icon(
                                FontAwesomeIcons.moneyBillWave,
                                color: Colors.white,
                                size: 60.0,
                              ),
                              Text('Cash',style: kIconButtonTextS,)
                            ],
                          ),
                        ),
                        onTap: (){
                          setState(() {
                            updatePayment(PaymentType.cash);
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        child: Container(
                          margin: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: insuranceColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Icon(
                                FontAwesomeIcons.fileInvoiceDollar,
                                color: Colors.white,
                                size: 60.0,
                              ),
                              Text('Insurance',style: kIconButtonTextS,)
                            ],
                          ),
                        ),
                        onTap: (){
                          setState(() {
                            updatePayment(PaymentType.insurance);
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: kButtonOuterPadding,
                child: RaisedButton(
                  color: kButtonColor,
                  shape: kButtonShape,
                  padding: kButtonPadding,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.stopwatch,
                        color: Colors.white,
                        size: 20.0,
                      ),
                      Text(
                        '  Book Now ',
                        style: kButtonTextS,
                      ),
                    ],
                  ),
                  onPressed: (){
                    Navigator.popUntil(context,ModalRoute.withName('/login/mainMenu'));
                  },
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
