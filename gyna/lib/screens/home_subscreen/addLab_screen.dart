import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gyna/assets/constants.dart';
import 'package:gyna/assets/custom_widget.dart';
import 'package:gyna/odoo/itemsDTO.dart';
import 'package:gyna/odoo/labDTO.dart';
import 'package:gyna/odoo/odooAuth.dart';
import 'package:gyna/screens/subscreens/drawer_subScreen.dart';
import 'package:object_mapper/object_mapper.dart';
import 'package:odoo_api/odoo_api.dart';

class AddLab extends StatefulWidget {
  final OdooClient myClient;
  AddLab({this.myClient});

  @override
  _AddLabState createState() => _AddLabState();
}

class _AddLabState extends State<AddLab> {

  var myLab = new LabDTO();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    odooConnectDB();

  }

  void odooConnectDB() async {
    await widget.myClient.connect().then((version) => print("Connected $version"));

    await widget.myClient
        .authenticate(OdooAuth.userName, OdooAuth.password, OdooAuth.databaseName)
        .then((version) {
      print(version.isSuccess.toString());
    });


    if (myLab.listCategorySearch.isEmpty) {
      await widget.myClient.searchRead("gyn.clinic.lab.category", [], ["name"]).then((value) {
        var x = value.getResult();
        print(x);
        //String json = jsonEncode(x);
        var y = Mapper.fromJson(x).toObject<ItemListDTO>();

        setState(() {
          print('done');
          myLab.listCategorySearch.addAll(y.itemsList);
        });
      });
    }
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
              hintText: "Name ",
              labelText: "Lab\'s Name ",
              iconName: FontAwesomeIcons.user,
              controller: myLab.controllerName),
          InputDropDownMenu(
              obj: myLab.requestType,
              iconName: FontAwesomeIcons.transgender,
              labelText: 'Request Type'),

          InputSearchField(
            //obj: newPatient.husbandName,
            valueDrop: myLab.selectedCategorySearch,
            listItems: myLab.listCategorySearch,
            iconName: FontAwesomeIcons.userAlt,
            labelText: 'Category ',
          ),
          SizedBox(height: 20),
          RaisedButton(
            padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            color: Color(0xFF8dc0c6),
            onPressed: () async {


              widget.myClient.create(LabDTO.model, myLab.toJson()).then((value) {
                print(value.getStatusCode());
                print(value.getResult());

                if(value.getStatusCode() == 200){
                  Navigator.pop(context);
                }

                // for(TextEditingController item in newPatient.controllerProhibitedDrugsList){
                //   newDrug.drugControllerName = item.text ;
                //   newDrug.drugPatientId.add(patientId.toString());
                //   newDrug.drugPatientId.add(name);
                //
                //   // client.create(newDrug.model, newDrug.toJson()).then((value) {
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
        ]),
      ),
    );
  }
}
