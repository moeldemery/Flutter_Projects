import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gyna/assets/constants.dart';
import 'package:gyna/assets/custom_widget.dart';
import 'package:gyna/odoo/medicineDTO.dart';
import 'package:gyna/odoo/odooAuth.dart';
import 'package:gyna/screens/subscreens/drawer_subScreen.dart';
import 'package:odoo_api/odoo_api.dart';

class AddMedicine extends StatefulWidget {

  final OdooClient myClient;
  AddMedicine({this.myClient});

  @override
  _AddMedicineState createState() => _AddMedicineState();
}

class _AddMedicineState extends State<AddMedicine> {
  var myMedicine = new MedicineDTO();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //odooConnectDB();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar2,
      //drawer: DrawerSubScreen(),
      body: SingleChildScrollView(
        child: Column(children: [
          InputField(
              readonly: false,
              hintText: "Medicine ",
              labelText: "Medicine Name ",
              iconName: FontAwesomeIcons.user,
              controller: myMedicine.controllerMedicineName),
          InputDropDownMenu(
              obj: myMedicine.medicamentType,
              iconName: FontAwesomeIcons.transgender,
              labelText: 'Medicament Type'),
          InputField(
              readonly: false,
              hintText: "Dose ",
              labelText: "Dose ",
              iconName: FontAwesomeIcons.user,
              controller: myMedicine.controllerDose),
          SizedBox(height: 30.0),
          InputField(
              readonly: false,
              hintText: "pregnancy and lactancy ",
              labelText: "pregnancy and lactancy ",
              iconName: FontAwesomeIcons.user,
              controller: myMedicine.controllerPregnancy),
          InputField(
              readonly: false,
              hintText: "Indications ",
              labelText: "Indications ",
              iconName: FontAwesomeIcons.user,
              controller: myMedicine.controllerIndication),
          InputField(
              readonly: false,
              hintText: "Composition ",
              labelText: "Composition ",
              iconName: FontAwesomeIcons.user,
              controller: myMedicine.controllerComposition),
          InputField(
              readonly: false,
              hintText: "Over Dosage ",
              labelText: "Over Dosage  ",
              iconName: FontAwesomeIcons.user,
              controller: myMedicine.controllerOverDosage),
          InputField(
              readonly: false,
              hintText: "Dosage instructions ",
              labelText: "Dosage instructions",
              iconName: FontAwesomeIcons.user,
              controller: myMedicine.controllerDosage),
          InputField(
              readonly: false,
              hintText: "Storage ",
              labelText: "Storage Conditions ",
              iconName: FontAwesomeIcons.user,
              controller: myMedicine.controllerStorage),
          InputField(
              readonly: false,
              hintText: "Adverse reactions ",
              labelText: "Adverse reactions ",
              iconName: FontAwesomeIcons.user,
              controller: myMedicine.controllerAdverse),
          InputField(
              readonly: false,
              hintText: "Extra Info ",
              labelText: "Extra Info ",
              iconName: FontAwesomeIcons.user,
              controller: myMedicine.controllerExtraInfo),
          SizedBox(height: 20),
          RaisedButton(
            padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            color: Color(0xFF8dc0c6),
            onPressed: () async {


              widget.myClient.create(MedicineDTO.model, myMedicine.toJson()).then((value) {
                print(value.getStatusCode());
                print(value.getResult());

                if(value.getStatusCode() == 200 && value.getResult() != null){
                  Navigator.pop(context);
                  Flushbar(

                    title: "Medicine Added",
                    message:
                    "The Medicine has been successfully added  ! ",
                    duration: Duration(seconds: 5),
                    margin: EdgeInsets.all(8),
                    borderRadius: 8,
                    icon: Icon(
                      Icons.check,
                      color: Colors.greenAccent,
                      size: 25.0,
                    ),
                  )..show(context).then((value) {
                    //clear old data
                  });
                }

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
        ]),

      ),
    );
  }
}
