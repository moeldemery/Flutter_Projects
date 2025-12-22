
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gyna/assets/constants.dart';
import 'package:gyna/assets/custom_widget.dart';
import 'package:gyna/odoo/drugsDTO.dart';
import 'package:gyna/odoo/itemsDTO.dart';
import 'package:gyna/odoo/patientDTO.dart';
import 'package:object_mapper/object_mapper.dart';
import 'addPatient_k.dart';
import 'package:odoo_api/odoo_api.dart';




class AddPatient extends StatefulWidget {
  final OdooClient myClient;
  AddPatient({this.myClient});

  @override
  _AddPatientState createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  var flag = 0;



  var newPatient = PatientDTO();

  @override
  void initState() {
    // TODO: implement initState

    super.initState();


    odooConnectDB();
  }

  void odooConnectDB() async {
    //await widget.myClient.connect().then((version) => print("Connected $version"));

    // await widget.myClient
    //     .authenticate(OdooAuth.userName, OdooAuth.password, OdooAuth.databaseName)
    //     .then((version) {
    //   print(version.isSuccess.toString());
    // });

    await widget.myClient.searchRead("gyn.clinic.medical.history", [], ["name"]).then((value) async {
      print("*****");
      print(value.getResult());
      print("*****");
      var x = value.getResult();

    });


    if (newPatient.listHusbandSearch.isEmpty) {
      await widget.myClient.searchRead("res.partner", [], ["name"]).then((value) {
        var x = value.getResult();
        print(x);
        //String json = jsonEncode(x);
        var y = Mapper.fromJson(x).toObject<ItemListDTO>();

        setState(() {
          newPatient.listHusbandSearch.addAll(y.itemsList);
        });
      });
    }
    if (newPatient.listMedicalHistorySearch.isEmpty) {
      await widget.myClient.searchRead("gyn.clinic.medical.history", [], ["name"]).then((value) {
        var x = value.getResult();
        print(x);
        //String json = jsonEncode(x);
        var y = Mapper.fromJson(x).toObject<ItemListDTO>();

        setState(() {
          newPatient.listMedicalHistorySearch.addAll(y.itemsList);
        });
      });
    }
    if (newPatient.listLabGroupSearch.isEmpty) {
      await widget.myClient.searchRead("gyn.clinic.lab.group", [], ["name"]).then((value) {
        var x = value.getResult();
        print(x);
        //String json = jsonEncode(x);
        var y = Mapper.fromJson(x).toObject<ItemListDTO>();

        setState(() {
          newPatient.listLabGroupSearch.addAll(y.itemsList);
        });
      });
    }
    if (newPatient.listLabGroup2Search.isEmpty) {
      await widget.myClient.searchRead("gyn.clinic.another.lab.group", [], ["name"]).then((value) {
        var x = value.getResult();
        print(x);
        //String json = jsonEncode(x);
        var y = Mapper.fromJson(x).toObject<ItemListDTO>();

        setState(() {
          newPatient.listLabGroup2Search.addAll(y.itemsList);
        });
      });
    }


  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: kAppBar2,
      //drawer: DrawerSubScreen(),
      body: Form(
        key: _formKey,

        // const kSingleChildScrollView
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: kSingleChildScrollView,
                child: Container(
                  // decoration: BoxDecoration(
                  //   color: Colors.grey[300],
                  //   border: Border.all(
                  //     color: Colors.grey,
                  //     width: 3,
                  //   ),
                  //   borderRadius: BorderRadius.circular(12),
                  // ),
                  child: ExpansionTile(
                    onExpansionChanged: (bool isExpanded) {
                      setState(() {
                        if (isExpanded == true) {
                          flag = 1;
                        } else {
                          flag = 0;
                        }
                      });
                    },
                    initiallyExpanded: flag == 1 ? true : false,
                    title: Text(
                      "Personal Info",
                      style: kDrawerTitle,
                    ),
                    backgroundColor: Colors.grey[200],
                    children: <Widget>[
                      // InputSearchListField(
                      //   labelText: "hi",
                      //   searchableList: newPatient.listHusbandSearch,
                      //   selectedItems: [],
                      // ),
                      //------------------Personal --------------------------
                      InputField(
                          readonly: false,
                          hintText: "Name ",
                          labelText: "Patient\'s Name ",
                          iconName: FontAwesomeIcons.user,
                          controller: newPatient.patientControllerName),
                      InputDropDownMenu(
                          obj: newPatient.genderType,
                          iconName: FontAwesomeIcons.transgender,
                          labelText: 'Gender Type'),
                      InputDateField(
                        controller: newPatient.patientControllerBirthDay,
                        controllerYears: newPatient.controllerAge,
                        hintText: "dob ",
                        labelText: "dob ",
                        iconName: FontAwesomeIcons.calendarAlt,
                      ),
                      InputField(
                          readonly: true,
                          hintText: "age ",
                          labelText: "age ",
                          iconName: FontAwesomeIcons.calendarAlt,
                          controller: newPatient.controllerAge),
                      InputDigitField(
                          readonly: false,
                          hintText: "Phone ",
                          labelText: "Patient\'s mobile  ",
                          iconName: FontAwesomeIcons.calendarAlt,
                          controller: newPatient.controllerMobile),
                      InputField(
                          readonly: false,
                          hintText: "Occupation ",
                          labelText: "Patient\'s Occupation ",
                          iconName: FontAwesomeIcons.wrench,
                          controller: newPatient.controllerOccupation),

                      //------------------Married --------------------------
                      InputDateField(
                          controller: newPatient.controllerMarriedDate,
                          controllerYears: newPatient.controllerMarriedYears,
                          hintText: "Married Date ",
                          labelText: "Married Date ",
                          iconName: FontAwesomeIcons.calendarAlt),
                      InputField(
                          readonly: true,
                          hintText: "married years ",
                          labelText: " years ",
                          iconName: FontAwesomeIcons.wrench,
                          controller: newPatient.controllerMarriedYears),

                      //------------------Husband --------------------------
                      InputSearchField(
                        //obj: newPatient.husbandName,
                        valueDrop: newPatient.selectedHusbandSearch,
                        listItems: newPatient.listHusbandSearch,
                        iconName: FontAwesomeIcons.userAlt,
                        labelText: 'Husband Name',
                        onAddTap: '/addHusband',
                      ),

                      InputDateField(
                          controller: newPatient.controllerHusbandBirthDay,
                          controllerYears: newPatient.controllerHusbandAge,
                          hintText: " Date ",
                          labelText: "Husband\'s BirthDate ",
                          iconName: FontAwesomeIcons.calendarAlt),
                      InputField(
                          readonly: true,
                          hintText: "Age ",
                          labelText: "Husband\'s Age ",
                          iconName: FontAwesomeIcons.dailymotion,
                          controller: newPatient.controllerHusbandAge),
                      InputDigitField(
                          readonly: false,
                          hintText: "Mobile ",
                          labelText: "Husband\'s Mobile ",
                          iconName: FontAwesomeIcons.dailymotion,
                          controller: newPatient.controllerHusbandMobile),
                      InputField(
                          readonly: false,
                          hintText: "Job ",
                          labelText: "Husband\'s Job ",
                          iconName: FontAwesomeIcons.dailymotion,
                          controller: newPatient.controllerHusbandJobPosition),

                      //------------------address --------------------------
                      InputField(
                          readonly: false,
                          hintText: "City ",
                          labelText: "Patient\'s City ",
                          iconName: FontAwesomeIcons.city,
                          controller: newPatient.controllerCity),
                      InputField(
                          readonly: false,
                          hintText: "zone ",
                          labelText: "Patient\'s Zone ",
                          iconName: FontAwesomeIcons.map,
                          controller: newPatient.controllerZone),
                      InputField(
                          readonly: false,
                          hintText: "Street ",
                          labelText: "Patient\'s Street ",
                          iconName: FontAwesomeIcons.mapMarker,
                          controller: newPatient.controllerStreet),
                      InputDigitField(
                          readonly: false,
                          hintText: "Home Phone ",
                          labelText: "Patient\'s Home Phone ",
                          iconName: FontAwesomeIcons.phone,
                          controller: newPatient.controllerPhone),
                      InputDigitField(
                          readonly: false,
                          hintText: "Mobile ",
                          labelText: "Patient\'s Mobile ",
                          iconName: FontAwesomeIcons.mobileAlt,
                          controller: newPatient.controllerMobile2),
                    ],
                  ),
                ),
              ),

              //k single tile scroll view const padding
              Padding(
                padding: kSingleChildScrollView,
                child: ExpansionTile(
                  onExpansionChanged: (bool isExpanded) {
                    setState(() {
                      if (isExpanded == true) {
                        flag = 2;
                      } else {
                        flag = 0;
                      }
                    });
                  },
                  initiallyExpanded: flag == 2 ? true : false,
                  title: Text(
                    "Medical Info",
                    style: kDrawerTitle,
                  ),
                  backgroundColor: Colors.grey[200],
                  children: [
                    InputField(
                        readonly: false,
                        hintText: "Menstrual ",
                        labelText: "Menstrual History",
                        iconName: FontAwesomeIcons.notesMedical,
                        controller: newPatient.controllerMens),
                    InputField(
                        readonly: false,
                        hintText: "Obstetric ",
                        labelText: "Obstetric History ",
                        iconName: FontAwesomeIcons.notesMedical,
                        controller: newPatient.controllerObs),
                    InputField(
                        readonly: false,
                        hintText: "Gynecologic ",
                        labelText: "Gynecologic History ",
                        iconName: FontAwesomeIcons.notesMedical,
                        controller: newPatient.controllerGyne),
                    InputSearchListField(
                        labelText: "General medical \nHistory",
                        hintText: "General History ",
                        selectedItems: newPatient.listMedicalHistorySelected,
                        searchableList: newPatient.listMedicalHistorySearch),
                    // InputField(
                    //     readonly: false,
                    //     hintText: "General History ",
                    //     labelText: "General medical History  ",
                    //     iconName: FontAwesomeIcons.notesMedical,
                    //     controller: newPatient.controllerGeneralMediceneHistory),
                    InputField(
                        readonly: false,
                        hintText: "Notes ",
                        labelText: "History Notes ",
                        iconName: FontAwesomeIcons.notesMedical,
                        controller: newPatient.controllerHis),
                    // InputField(
                    //     readonly: false,
                    //     hintText: " Drugs ",
                    //     labelText: "Prohibited Drugs ",
                    //     iconName: FontAwesomeIcons.pills,
                    //     controller: newPatient.controllerProhibitedDrugs),
                    InputListField(
                      controllers: newPatient.controllerProhibitedDrugsList,
                      labelText: "Prohibited Drugs",
                      hintText: "add new drug",
                    ),
                    InputField(
                        readonly: false,
                        hintText: "History ",
                        labelText: "General History ",
                        iconName: FontAwesomeIcons.bookMedical,
                        controller: newPatient.controllerGeneralHistory),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: kSingleChildScrollView,
                    child: ExpansionTile(
                      onExpansionChanged: (bool isExpanded) {
                        setState(() {
                          if (isExpanded == true) {
                            flag = 3;
                          } else {
                            flag = 0;
                          }
                        });
                      },
                      initiallyExpanded: flag == 3 ? true : false,
                      title: Text(
                        "Visits",
                        style: kDrawerTitle,
                      ),
                      children: [
                        // InputField(
                        //     readonly: false,
                        //     hintText: " Drugs ",
                        //     labelText: "Prohibited Drugs ",
                        //     iconName: FontAwesomeIcons.pills,
                        //     controller: newPatient.controllerProhibitedDrugs),
                        RaisedButton(
                          onPressed: () async {
                            // widget.myClient.create(patientRTO.model, {
                            //   patientRTO.patientName: controllerName.text,
                            //   patientRTO.jobPosition: controllerJob.text,
                            //   patientRTO.age: controllerAge.text
                            // }).then((value) => print(value.getStatusCode()));
                          },
                          child: Text("Show Graph"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: kSingleChildScrollView,
                    child: ExpansionTile(
                      onExpansionChanged: (bool isExpanded) {
                        setState(() {
                          if (isExpanded == true) {
                            flag = 4;
                          } else {
                            flag = 0;
                          }
                        });
                      },
                      initiallyExpanded: flag == 4 ? true : false,
                      title: Text(
                        "Diagnostic Results",
                        style: kDrawerTitle,
                      ),
                      children: [
                        InputDropDownMenu(
                            obj: newPatient.labType,
                            iconName: FontAwesomeIcons.flask,
                            labelText: 'Lab Type'),
                        InputSearchField(
                          labelText: 'Lab Group',
                          valueDrop: newPatient.selectedLabGroupSearch,
                          listItems: newPatient.listLabGroupSearch,
                          iconName: FontAwesomeIcons.flask,
                          // addWidget: ,
                        ),
                        InputSearchField(
                          labelText: 'Another Lab Group',
                          valueDrop: newPatient.selectedLabGroup2Search,
                          listItems: newPatient.listLabGroup2Search,
                          iconName: FontAwesomeIcons.flask,
                          // addWidget: ,
                        ),

                        InputField(
                            readonly: false,
                            hintText: " CT ",
                            labelText: "CT ",
                            iconName: FontAwesomeIcons.flask,
                            controller: newPatient.controllerCt),
                      ],
                    ),
                  ),
                ],
              ),

              Column(
                children: <Widget>[
                  Padding(
                    padding: kSingleChildScrollView,
                    child: ExpansionTile(
                      onExpansionChanged: (bool isExpanded) {
                        setState(() {
                          if (isExpanded == true) {
                            flag = 5;
                          } else {
                            flag = 0;
                          }
                        });
                      },
                      initiallyExpanded: flag == 5 ? true : false,
                      title: Text(
                        "Operative Data",
                        style: kDrawerTitle,
                      ),
                      children: [
                        InputField(
                            readonly: false,
                            hintText: " Operations  ",
                            labelText: "Operations",
                            iconName: FontAwesomeIcons.userNurse,
                            controller: newPatient.controllerOperation),
                        InputField(
                            readonly: false,
                            hintText: " Notes ",
                            labelText: "General Notes",
                            iconName: FontAwesomeIcons.clipboard,
                            controller: newPatient.controllerGeneralNotes),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: kSingleChildScrollView,
                    child: ExpansionTile(
                        onExpansionChanged: (bool isExpanded) {
                          setState(() {
                            if (isExpanded == true) {
                              flag = 6;
                            } else {
                              flag = 0;
                            }
                          });
                        },
                        initiallyExpanded: flag == 6 ? true : false,
                        title: Text(
                          "Reports",
                          style: kDrawerTitle,
                        ),
                        children: [
                          InputDropDownMenu(
                              obj: newPatient.dropDownReport,
                              iconName: FontAwesomeIcons.notesMedical,
                              labelText: 'Report'),
                        ]),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: kSingleChildScrollView,
                    child: ExpansionTile(
                      onExpansionChanged: (bool isExpanded) {
                        setState(() {
                          if (isExpanded == true) {
                            flag = 7;
                          } else {
                            flag = 0;
                          }
                        });
                      },
                      initiallyExpanded: flag == 7 ? true : false,
                      title: Text(
                        "Scanned",
                        style: kDrawerTitle,
                      ),
                      children: [
                        InputField(
                            readonly: false,
                            hintText: " upload Your File ",
                            labelText: "upload",
                            iconName: FontAwesomeIcons.fileMedical,
                            controller: newPatient.controllerUpload),
                        RaisedButton(
                          onPressed: () async {},
                          child: Text(
                            "Upload File",
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              RaisedButton(
                padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                color: Color(0xFF8dc0c6),
                onPressed: () async {
                  String name = newPatient.patientControllerName.text;

                  //print(newPatient.husbandName.selectedItemIdName.toString());

                  widget.myClient.create(PatientDTO.model, newPatient.toJson()).then((value) {
                    print(value.getStatusCode());
                    print(value.getResult());
                    // print(value.getSessionId());
                    // print(value.getError());
                    // print(value.hasError());
                    String patientId = value.getResult().toString();

                    for (TextEditingController item in newPatient.controllerProhibitedDrugsList) {
                      var newDrug = DrugsDTO();
                      if (item.text != '') {
                        newDrug.drugControllerName = item.text;
                        newDrug.drugPatientId = patientId;
                        widget.myClient.create(newDrug.model, newDrug.toJson()).then((value) {
                          //drugsId.add(value.getResult());
                          print(value.getStatusCode());
                          print(value.getResult());
                        });
                      }
                    }
                    if(value.getStatusCode() == 200){
                      Navigator.pop(context);
                    }

                    // for(TextEditingController item in newPatient.controllerProhibitedDrugsList){
                    //   newDrug.drugControllerName = item.text ;
                    //   newDrug.drugPatientId.add(patientId.toString());
                    //   newDrug.drugPatientId.add(name);
                    //
                    //   // widget.myClient.create(newDrug.model, newDrug.toJson()).then((value) {
                    //   //   print(value.getStatusCode());
                    //   //   print(value.getResult());
                    //   //   print(value.getSessionId());
                    //   //   print(value.getError());
                    //   //   print(value.hasError());
                    //   // });
                    // }
                  });
                },
                child: Text(
                  "Save Patient",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/*{

                    patientRTO.patientName: controllerName.text,
                    patientRTO.type: genderType.valueDrop ,
                    patientRTO.birthDate: controllerBirthDay.text,
                    patientRTO.age : controllerAge.text,
                    patientRTO.mobileFemale: controllerMobile.text,
                    patientRTO.jobPosition: controllerOccupation.text,

                    //patientRTO.marriedDate: controllerMarriedDate.text,
                    patientRTO.years: controllerMarriedYears.text,//not donr
                    patientRTO.months: controllerBirthDay.text,//not done

                    patientRTO.husbandName : husbandName.valueDrop,
                    patientRTO.husbandBirthDate: controllerHusbandBirthDay.text,
                    patientRTO.mobileHusband:controllerHusbandMobile.text,
                    patientRTO.husbandJobPosition:controllerHusbandJobPosition.text,

                    patientRTO.zone:controllerZone.text,
                    patientRTO.city:controllerCity.text,
                    patientRTO.street:controllerStreet.text,
                    patientRTO.phone:controllerPhone.text,
                    patientRTO.mobile:controllerMobile2.text,

                    //patientRTO.menstrualHistory:controllerMens.text,
                    // patientRTO.obstetricHistory : controllerObs.text,
                    // patientRTO.gynecologicHistory:controllerGyne.text,
                    //
                    // patientRTO.historyNote:controllerHis.text,
                    // patientRTO.history:controllerGenHis.text,


                  }

                  */

// Column(
// crossAxisAlignment: CrossAxisAlignment.stretch,
// children: [
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Icon(
// iconName,
// //FontAwesomeIcons.user,
// color: Colors.blue[800],
// size: 25.0,
// ),
// SizedBox(
// width: 20,
// ),
// Column(
// children: [
// DropdownButton(
// hint: obj.valueDrop == null
// ? Text('Dropdown')
// : Text(
// obj.valueDrop,
// style: TextStyle(color: Colors.blue),
// ),
// isExpanded: false,
// iconSize: 30.0,
// style: TextStyle(color: Colors.blue),
// items: obj.listDrop.map(
// (val) {
// return DropdownMenuItem<String>(
// value: val,
// child: Text(val),
// );
// },
// ).toList(),
// onChanged: (val) {
// setState(
// () {
// obj.valueDrop = val;
// },
// );
// },
// ),
// ],
// ),
// ],
// ),
// ),
