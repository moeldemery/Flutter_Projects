
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gyna/assets/constants.dart';
import 'package:gyna/assets/custom_widget.dart';
import 'package:gyna/odoo/itemsDTO.dart';
import 'package:gyna/odoo/visitDTO.dart';
import 'package:object_mapper/object_mapper.dart';
import 'package:odoo_api/odoo_api.dart';

import 'addPatient_k.dart';


class AddVisit extends StatefulWidget {
  final OdooClient myClient;
  AddVisit({this.myClient});

  @override
  _AddVisitState createState() => _AddVisitState();
}

var flag;
var flag2;

class _AddVisitState extends State<AddVisit> {
  // TextEditingController controlleraggggg;
////////////////////////////////////////////////////////////////////////////////


  VisitDTO newVisit = new VisitDTO();

  void odooConnectDB() async {
    //await widget.myClient.connect().then((version) => print("Connected $version"));

    // await widget.myClient
    //     .authenticate(OdooAuth.userName, OdooAuth.password, OdooAuth.databaseName)
    //     .then((version) {
    //   print(version.isSuccess.toString());
    // });
    if (newVisit.listPatientSearch.isEmpty) {
      await widget.myClient.searchRead("gyn.clinic.patient", [], ["name"]).then((value) {
        var x = value.getResult();
        print(x);
        //String json = jsonEncode(x);
        var y = Mapper.fromJson(x).toObject<ItemListDTO>();

        setState(() {
          newVisit.listPatientSearch.addAll(y.itemsList);
        });
      });
    }

    await widget.myClient.read("gyn.clinic.visit", [83], ["obestatric_spontaneous"]).then((value) async {
      print("*****");
      print(value.getResult());
      print("*****");
      var x = value.getResult();

    });






  }
  void initState() {
    // TODO: implement initState

    super.initState();
    odooConnectDB();


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

              InputSearchField(
                //obj: newPatient.husbandName,
                valueDrop: newVisit.selectedPatientSearch,
                listItems: newVisit.listPatientSearch,
                iconName: FontAwesomeIcons.userAlt,
                labelText: 'Patient Name',
              ),
              InputDateField(
                labelText: 'Date',
                hintText: 'Date',
                controller: newVisit.date,
                iconName: FontAwesomeIcons.calendarAlt,
              ),
              InputDigitField(
                  readonly: false,
                  hintText: " Fees",
                  labelText: "Fees ",
                  iconName: FontAwesomeIcons.moneyBill,
                  controller: newVisit.fee),

              Padding(
                padding: kSingleChildScrollView,
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
                    "Gaynecology",
                    style: kDrawerTitle,
                  ),
                  backgroundColor: Colors.grey[200],
                  children: <Widget>[
                    InputDateField(
                      labelText: 'Date',
                      hintText: 'Date',
                      controller: newVisit.gynaDate,
                        iconName: FontAwesomeIcons.transgender,
                        ),
                    InputField(
                        readonly: false,
                        hintText: " Blood pressure",
                        labelText: "Blood pressure ",
                        iconName: FontAwesomeIcons.user,
                        controller: newVisit.controllerBloodPressure),
                    InputField(
                        readonly: false,
                        hintText: " Temp",
                        labelText: "Temp ",
                        iconName: FontAwesomeIcons.user,
                        controller: newVisit.controllerTemp),
                    InputField(
                        readonly: false,
                        hintText: " Weight",
                        labelText: "Weight ",
                        iconName: FontAwesomeIcons.user,
                        controller: newVisit.controllerWeight),
                    InputField(
                        readonly: false,
                        hintText: " C/O",
                        labelText: "C/O ",
                        iconName: FontAwesomeIcons.user,
                        controller: newVisit.controllerCO),
                    InputDigitField(
                        readonly: false,
                        hintText: " Thick",
                        labelText: "Thick ",
                        iconName: FontAwesomeIcons.user,
                        controller: newVisit.controllerThick),
                    InputDropDownMenu(
                        obj: newVisit.uT1,
                        iconName: FontAwesomeIcons.transgender,
                        labelText: 'UT'),
                    InputDropDownMenu(
                        obj: newVisit.uT2,
                        iconName: FontAwesomeIcons.transgender,
                        labelText: 'UT2'),
                    InputDropDownMenu(
                        obj: newVisit.end,
                        iconName: FontAwesomeIcons.transgender,
                        labelText: 'End'),
                    InputDropDownMenu(
                        obj: newVisit.ovAdhesions,
                        iconName: FontAwesomeIcons.transgender,
                        labelText: 'Ov Adhesion'),

                    InputDropDownMenu(
                        obj: newVisit.ovSize,
                        iconName: FontAwesomeIcons.transgender,
                        labelText: 'Ov Size'),
                    InputField(
                        readonly: false,
                        hintText: "Myuma Submucus No",
                        labelText: "Myuma Submucus No ",
                        iconName: FontAwesomeIcons.user,
                        controller: newVisit.controllerMyumaSubmucusNo),
                    InputField(
                        readonly: false,
                        hintText: " Myuma Submucus Size",
                        labelText: "Myuma Submucus Size ",
                        iconName: FontAwesomeIcons.user,
                        controller: newVisit.controllerMyumaSubmucusSize),
                    InputField(
                        readonly: false,
                        hintText: "Interstitiol No",
                        labelText: "Interstitiol No",
                        iconName: FontAwesomeIcons.user,
                        controller: newVisit.controllerInterstitiolNo),
                    InputField(
                        readonly: false,
                        hintText: "Interstitol Size",
                        labelText: "Interstitol Size ",
                        iconName: FontAwesomeIcons.user,
                        controller: newVisit.controllerInterstitiolSize),
                    InputField(
                        readonly: false,
                        hintText: "Subserous No",
                        labelText: "Subserous No ",
                        iconName: FontAwesomeIcons.user,
                        controller: newVisit.controllerSubserousNo),
                    InputField(
                        readonly: false,
                        hintText: "Subserous Size",
                        labelText: "Subserous Size ",
                        iconName: FontAwesomeIcons.user,
                        controller: newVisit.controllersubSerousSize),
                    InputField(
                        readonly: false,
                        hintText: "Adenomyosis",
                        labelText: "Adenomyosis ",
                        iconName: FontAwesomeIcons.user,
                        controller: newVisit.controllerAdenomyosis),
                    InputField(
                        readonly: false,
                        hintText: " Cervix",
                        labelText: "Cervix ",
                        iconName: FontAwesomeIcons.user,
                        controller: newVisit.controllerCervix),
                    InputDropDownMenu(
                        obj: newVisit.tubes,
                        iconName: FontAwesomeIcons.transgender,
                        labelText: 'Tubes'),
                    InputField(
                        readonly: false,
                        hintText: "D.P",
                        labelText: "D.P ",
                        iconName: FontAwesomeIcons.user,
                        controller: newVisit.controllerDp),
                    InputField(
                        readonly: false,
                        hintText: "Echogenicity",
                        labelText: "Echogenicity ",
                        iconName: FontAwesomeIcons.user,
                        controller: newVisit.controllerEchogenicity),
                  ],
                ),
              ),
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
                    "Obstetric",
                    style: kDrawerTitle,
                  ),
                  backgroundColor: Colors.grey[200],
                  children: <Widget>[
                    InputDropDownMenu(
                        obj: newVisit.gender,
                        iconName: FontAwesomeIcons.transgender,
                        labelText: 'Gender'),
                    InputBoolField(
                      labelText: "spontaneous",
                      obj: newVisit.spontaneous,
                      iconName: FontAwesomeIcons.transgender,
                    ),
                    InputBoolField(
                      labelText: "CHO",
                      obj: newVisit.cho,
                      iconName: FontAwesomeIcons.transgender,
                    ),
                    InputBoolField(
                      labelText: "IUI",
                      obj: newVisit.iui,
                      iconName: FontAwesomeIcons.transgender,
                    ),
                    InputBoolField(
                      labelText: "ICSI",
                      obj: newVisit.icsi,
                      iconName: FontAwesomeIcons.transgender,
                    ),
                    InputDateField(
                        controller: newVisit.lMPObstetric,
                        iconName: FontAwesomeIcons.transgender,
                        labelText: 'LMP'),
                    InputDateField(
                        controller: newVisit.eT,
                        iconName: FontAwesomeIcons.transgender,
                        labelText: 'Et'),
                    InputDateField(
                        controller: newVisit.edd,
                        iconName: FontAwesomeIcons.transgender,
                        labelText: 'EDD'),
                    InputField(
                        readonly: false,
                        hintText: " G.age",
                        labelText: "G.age ",
                        iconName: FontAwesomeIcons.user,
                        controller: newVisit.controllerGAge),
                    InputDigitField(
                        readonly: false,
                        hintText: " Gravida",
                        labelText: "Gravida ",
                        iconName: FontAwesomeIcons.user,
                        controller: newVisit.controllerGravida),
                    InputDropDownMenu(
                        obj: newVisit.Infertility,
                        iconName: FontAwesomeIcons.transgender,
                        labelText: 'Infertility'),
                    InputField(
                        readonly: false,
                        hintText: " Infertility 2",
                        labelText: "Infertility 2 ",
                        iconName: FontAwesomeIcons.user,
                        controller: newVisit.Infertility2),
                    InputDigitField(
                        readonly: false,
                        hintText: " Para",
                        labelText: "Para ",
                        iconName: FontAwesomeIcons.user,
                        controller: newVisit.controllerPara),
                    InputDigitField(
                        readonly: false,
                        hintText: " Abortion",
                        labelText: "Abortion ",
                        iconName: FontAwesomeIcons.user,
                        controller: newVisit.controllerAbortion),
                    InputDigitField(
                        readonly: false,
                        hintText: " NVD",
                        labelText: "NVD ",
                        iconName: FontAwesomeIcons.user,
                        controller: newVisit.controllerNVD),
                    InputDigitField(
                        readonly: false,
                        hintText: " CS",
                        labelText: "CS ",
                        iconName: FontAwesomeIcons.user,
                        controller: newVisit.controllerCs),
                    InputField(
                        readonly: false,
                        hintText: " Preterm",
                        labelText: "Preterm ",
                        iconName: FontAwesomeIcons.user,
                        controller: newVisit.controllerPreTerm),
                    InputDigitField(
                        readonly: false,
                        hintText: " Ectopic",
                        labelText: "Ectopic ",
                        iconName: FontAwesomeIcons.user,
                        controller: newVisit.controllerEctopic),
                    InputDropDownMenu(
                        obj: newVisit.bloodGroup,
                        iconName: FontAwesomeIcons.transgender,
                        labelText: 'Blood Group'),
                    InputDropDownMenu(
                        obj: newVisit.rhType,
                        iconName: FontAwesomeIcons.transgender,
                        labelText: 'Rh Type'),
                    InputDropDownMenu(
                        obj: newVisit.antiBodiesTitle,
                        iconName: FontAwesomeIcons.transgender,
                        labelText: 'Antibodies Title'),
                    InputDropDownMenu(
                        obj: newVisit.texoPlasma1gg,
                        iconName: FontAwesomeIcons.transgender,
                        labelText: 'Toxoplasma 1gG'),
                    InputDropDownMenu(
                        obj: newVisit.texoPlasma1gm,
                        iconName: FontAwesomeIcons.transgender,
                        labelText: 'Texoplasma 1gM'),
                    InputDropDownMenu(
                        obj: newVisit.rubella1gg,
                        iconName: FontAwesomeIcons.transgender,
                        labelText: 'Rubella 1gG'),
                    InputDropDownMenu(
                        obj: newVisit.rubella1gm,
                        iconName: FontAwesomeIcons.transgender,
                        labelText: 'Rubella 1gM'),
                    InputDropDownMenu(
                        obj: newVisit.hcv,
                        iconName: FontAwesomeIcons.transgender,
                        labelText: 'HCV'),
                    InputField(
                        readonly: false,
                        hintText: "Notes",
                        labelText: "Notes ",
                        iconName: FontAwesomeIcons.user,
                        controller: newVisit.controllerNotes),
                    InputDigitField(
                        readonly: false,
                        hintText: " Weight",
                        labelText: "Weight ",
                        iconName: FontAwesomeIcons.user,
                        controller: newVisit.controllerWeightObstetric),
                    InputField(
                        readonly: false,
                        hintText: "Fetal weight",
                        labelText: "Fetal Weight ",
                        iconName: FontAwesomeIcons.user,
                        controller: newVisit.controllerFetalWeight),
                    InputField(
                        readonly: false,
                        hintText: " Blood Pressure",
                        labelText: "Blood Pressure ",
                        iconName: FontAwesomeIcons.user,
                        controller: newVisit.controllerBloodPressureObstetric),
                    InputBoolField(
                      labelText: "Viability",
                      obj: newVisit.viability,
                      iconName: FontAwesomeIcons.transgender,
                    ),
                    InputDigitField(
                        readonly: false,
                        hintText: "CBC",
                        labelText: "CBC ",
                        iconName: FontAwesomeIcons.user,
                        controller: newVisit.controllerCBC),
                    InputDigitField(
                        readonly: false,
                        hintText: " FBC",
                        labelText: "FBC ",
                        iconName: FontAwesomeIcons.user,
                        controller: newVisit.controllerFbc),
                    InputDigitField(
                        readonly: false,
                        hintText: " PP",
                        labelText: "PP ",
                        iconName: FontAwesomeIcons.user,
                        controller: newVisit.controllerPP),
                    InputDropDownMenu(
                        obj: newVisit.placentaPosition,
                        iconName: FontAwesomeIcons.transgender,
                        labelText: 'Placenta Position'),
                    InputDropDownMenu(
                        obj: newVisit.placentaGrading,
                        iconName: FontAwesomeIcons.transgender,
                        labelText: 'Placenta Grading '),
                    InputField(
                        readonly: false,
                        hintText: " Color Doppler",
                        labelText: "Color Doppler ",
                        iconName: FontAwesomeIcons.user,
                        controller: newVisit.controllerColorDoppler),
                    InputDropDownMenu(
                        obj: newVisit.amnioticFluid,
                        iconName: FontAwesomeIcons.transgender,
                        labelText: 'Amniotic Fluid'),
                    InputDropDownMenu(
                        obj: newVisit.presentation,
                        iconName: FontAwesomeIcons.transgender,
                        labelText: 'Presentation'),
                    InputField(
                        readonly: false,
                        hintText: " Other Findings",
                        labelText: "Other Findings ",
                        iconName: FontAwesomeIcons.user,
                        controller: newVisit.controllerOtherFindings),

                  ],
                ),
              ),
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
                    "Requests ",
                    style: kDrawerTitle,
                  ),
                  backgroundColor: Colors.grey[200],
                  children: <Widget>[
                    Column(
                      children: [
                        Padding(
                            padding: kSingleChildScrollView,
                            child: ExpansionTile(
                                onExpansionChanged: (bool isExpanded) {
                                  setState(
                                    () {
                                      if (isExpanded == true) {
                                        flag2 = 1;
                                      } else {
                                        flag2 = 0;
                                      }
                                    },
                                  );
                                },
                                initiallyExpanded: flag2 == 1 ? true : false,
                                title: Text(
                                  "Lab Request ",
                                  style: kDrawerTitle,
                                ),
                                backgroundColor: Colors.grey[200],
                                children: <Widget>[
                                  InputField(
                                      readonly: false,
                                      hintText: " LAB CATEGORY",
                                      labelText: "LAB CATEGORY ",
                                      iconName: FontAwesomeIcons.user,
                                      controller: newVisit.controllerLabCategory),
                                  InputDropDownMenu(
                                      obj: newVisit.labRequest,
                                      iconName: FontAwesomeIcons.transgender,
                                      labelText: 'Lab Request'),
                                ])),
                        Padding(
                          padding: kSingleChildScrollView,
                          child: ExpansionTile(
                            onExpansionChanged: (bool isExpanded) {
                              setState(
                                () {
                                  if (isExpanded == true) {
                                    flag2 = 2;
                                  } else {
                                    flag2 = 0;
                                  }
                                },
                              );
                            },
                            initiallyExpanded: flag2 == 2 ? true : false,
                            title: Text(
                              "Radiology Request ",
                              style: kDrawerTitle,
                            ),
                            backgroundColor: Colors.grey[200],
                            children: <Widget>[
                              InputDropDownMenu(
                                  obj: newVisit.radiologyRequest,
                                  iconName: FontAwesomeIcons.transgender,
                                  labelText: 'Radiology Request'),
                            ],
                          ),
                        ),
                        Padding(
                          padding: kSingleChildScrollView,
                          child: ExpansionTile(
                            onExpansionChanged: (bool isExpanded) {
                              setState(
                                () {
                                  if (isExpanded == true) {
                                    flag2 = 3;
                                  } else {
                                    flag2 = 0;
                                  }
                                },
                              );
                            },
                            initiallyExpanded: flag2 == 3 ? true : false,
                            title: Text(
                              "Pathology Request ",
                              style: kDrawerTitle,
                            ),
                            backgroundColor: Colors.grey[200],
                            children: <Widget>[
                              InputDropDownMenu(
                                  obj: newVisit.pathologyRequest,
                                  iconName: FontAwesomeIcons.transgender,
                                  labelText: 'Pathology Request'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
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
                      "prescription",
                      style: kDrawerTitle,
                    ),
                    backgroundColor: Colors.grey[200],
                    children: <Widget>[
                      InputField(
                          readonly: false,
                          hintText: " Medication",
                          labelText: "Medication ",
                          iconName: FontAwesomeIcons.user,
                          controller: newVisit.controllerMedication),
                    ]),
              ),
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
                    " Summary ",
                    style: kDrawerTitle,
                  ),
                  backgroundColor: Colors.grey[200],
                  children: <Widget>[
                    InputDateField(
                        controller: newVisit.visitDate,
                        iconName: FontAwesomeIcons.transgender,
                        labelText: 'Visit Date'),
                    InputDateField(
                        controller: newVisit.lmpSummary,
                        iconName: FontAwesomeIcons.transgender,
                        labelText: 'LMP'),
                    InputDateField(
                        controller: newVisit.eed,
                        iconName: FontAwesomeIcons.transgender,
                        labelText: 'EED'),

                    InputField(
                        readonly: false,
                        hintText: " Last Weight",
                        labelText: "Last Weight ",
                        iconName: FontAwesomeIcons.user,
                        controller: newVisit.controllerLastWeight),
                    InputField(
                        readonly: false,
                        hintText: "Last Present",
                        labelText: "Last Present ",
                        iconName: FontAwesomeIcons.user,
                        controller: newVisit.controllerLastPresent),

                    InputField(
                        readonly: false,
                        hintText: " Last F Weight",
                        labelText: "Last F Weight ",
                        iconName: FontAwesomeIcons.user,
                        controller: newVisit.controllerLastFWeight),
                    InputField(
                        readonly: false,
                        hintText: "Gravida",
                        labelText: "Gravida ",
                        iconName: FontAwesomeIcons.user,
                        controller: newVisit.controllerGravidaSummary),

                    InputField(
                        readonly: false,
                        hintText: "Para",
                        labelText: "Para ",
                        iconName: FontAwesomeIcons.user,
                        controller: newVisit.controllerParaSummary),
                    InputField(
                        readonly: false,
                        hintText: "Blood Group",
                        labelText: "Blood Group ",
                        iconName: FontAwesomeIcons.user,
                        controller: newVisit.controllerBloodGroup),

                    InputField(
                        readonly: false,
                        hintText: " RH Type",
                        labelText: "RH Type ",
                        iconName: FontAwesomeIcons.user,
                        controller: newVisit.controllerRhType),
                    // InputField(
                    //     readonly: false,
                    //     hintText: " Married Date",
                    //     labelText: "Married Date ",
                    //     iconName: FontAwesomeIcons.user,
                    //     controller: newVisit.controllerMarriedDate),




                  ],
                ),
              ),

              SizedBox(height: 20),
              RaisedButton(
                padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                color: Color(0xFF8dc0c6),
                onPressed: () async {


                  widget.myClient.create(VisitDTO.model, newVisit.toJson()).then((value) {
                    print(value.getStatusCode());
                    print(value.getResult());
                    // print(value.getSessionId());
                    // print(value.getError());
                    // print(value.hasError());
                    // String patientId = value.getResult().toString();
                    if(value.getStatusCode() == 200){

                      Navigator.pop(context);
                    }


                  });
                },
                child: Text(
                  "Save Visit",
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
