

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gyna/assets/constants.dart';
import 'package:gyna/odoo/husbandDTO.dart';
import 'package:gyna/odoo/odooAuth.dart';
import 'package:gyna/assets/custom_widget.dart';
import 'package:gyna/screens/subscreens/drawer_subScreen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:odoo_api/odoo_api.dart';

import 'package:gyna/odoo/itemsDTO.dart';
import '../addPatient_k.dart';

class AddHusband extends StatefulWidget {
  @override
  _AddHusbandState createState() => _AddHusbandState();
}

var flag;

//var client = OdooClient("http://192.168.1.8:8070");
var client = OdooClient("http://41.39.45.27:8070");
var husbandA = HusbandDTO();

void odooConnectDB() async {
  await client.connect().then((version) => print("Connected $version"));

  await client
      .authenticate(OdooAuth.userName, OdooAuth.password, OdooAuth.databaseName)
      .then((version) {
    print(version.isSuccess.toString());
  });
}

class _AddHusbandState extends State<AddHusband> {
  //controllers dropdown for contact and addresses

  void initState() {
    // TODO: implement initState

    super.initState();

    odooConnectDB();
  }
  //File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
       // _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: kAppBar2,
      //drawer: DrawerSubScreen(),
      body: Form(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // CupertinoButton.filled(
              //     child: Text("Select Image"),
              //     onPressed: () async{
              //       Uint8List pngBytes = await ImageSelector.fromGallery(context);
              //       setState(() {
              //         image = Image.memory(
              //           pngBytes,
              //           width: 200,
              //           height: 200,
              //         );
              //       });
              //     }
              // ),
              // Container(
              //     margin: EdgeInsets.all(50),
              //     child: image!=null?image:Text("No image selected")
              // ),
              Padding(
                padding: kSingleChildScrollView,
                child: InputField(
                    readonly: false,
                    hintText: " name",
                    labelText: "Husband name ",
                    iconName: FontAwesomeIcons.user,
                    controller: husbandA.controllerHusbandName),
              ),
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
                      "Contacts & Addresses",
                      style: kDrawerTitle,
                    ),
                    backgroundColor: Colors.grey[200],
                    children: <Widget>[
                      InputField(
                          readonly: false,
                          hintText: " Street",
                          labelText: "Address ",
                          iconName: FontAwesomeIcons.user,
                          controller: husbandA.controllerStreet),
                      InputField(
                          readonly: false,
                          hintText: " Street2",
                          labelText: "Address ",
                          iconName: FontAwesomeIcons.user,
                          controller: husbandA.controllerStreet2),
                      InputField(
                          readonly: false,
                          hintText: " e.g alex,giza",
                          labelText: "City ",
                          iconName: FontAwesomeIcons.user,
                          controller: husbandA.controllerCity),
                      // InputDropDownMenu(
                      //     obj: husbandA.State,
                      //     iconName: FontAwesomeIcons.transgender,
                      //     labelText: 'State'),
                      InputField(
                          readonly: false,
                          hintText: " e.g 43211",
                          labelText: "ZIP ",
                          iconName: FontAwesomeIcons.user,
                          controller: husbandA.controllerZip),
                      InputDropDownMenu(
                          obj: husbandA.Country,
                          iconName: FontAwesomeIcons.transgender,
                          labelText: 'Country'),
                      InputField(
                          readonly: false,
                          hintText: "e.g BEO477472701",
                          labelText: "Tax ID ",
                          iconName: FontAwesomeIcons.user,
                          controller: husbandA.controllerTax),
                      InputField(
                          readonly: false,
                          hintText: " e.g Sales director",
                          labelText: "Jop Position ",
                          iconName: FontAwesomeIcons.user,
                          controller: husbandA.controllerJop),
                      InputField(
                          readonly: false,
                          hintText: " e.g 01030824173",
                          labelText: "Mobile ",
                          iconName: FontAwesomeIcons.user,
                          controller: husbandA.controllerMobile),
                      InputField(
                          readonly: false,
                          hintText: " e.g 032275431",
                          labelText: "Phone ",
                          iconName: FontAwesomeIcons.user,
                          controller: husbandA.controllerPhone),
                      InputField(
                          readonly: false,
                          hintText: " e.g alex@gmail.com",
                          labelText: "Email ",
                          iconName: FontAwesomeIcons.user,
                          controller: husbandA.controllerEmail),
                      InputField(
                          readonly: false,
                          hintText: " e.g www.google.com",
                          labelText: "Website ",
                          iconName: FontAwesomeIcons.user,
                          controller: husbandA.controllerWebsite),
                      InputDropDownMenu(
                          obj: husbandA.Title,
                          iconName: FontAwesomeIcons.transgender,
                          labelText: 'Title'),
                      InputDropDownMenu(
                          obj: husbandA.Language,
                          iconName: FontAwesomeIcons.transgender,
                          labelText: 'Language'),
                      InputDropDownMenu(
                          obj: husbandA.Tags,
                          iconName: FontAwesomeIcons.transgender,
                          labelText: 'Tags'),
                    ],
                  ),
                ),
              ),
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
                          flag = 2;
                        } else {
                          flag = 0;
                        }
                      });
                    },
                    initiallyExpanded: flag == 2 ? true : false,
                    title: Text(
                      "Internal Notes",
                      style: kDrawerTitle,
                    ),
                    backgroundColor: Colors.grey[200],
                    children: <Widget>[
                      InputField(
                          readonly: false,
                          hintText: " Notes",
                          labelText: "Internal Notes ",
                          iconName: FontAwesomeIcons.user,
                          controller: husbandA.controllerNotes),
                    ],
                  ),
                ),
              ),
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
                          flag = 3;
                        } else {
                          flag = 0;
                        }
                      });
                    },
                    initiallyExpanded: flag == 3 ? true : false,
                    title: Text(
                      "Sales & Purchases",
                      style: kDrawerTitle,
                    ),
                    backgroundColor: Colors.grey[200],
                    children: <Widget>[
                      InputDropDownMenu(
                          obj: husbandA.Tags,
                          iconName: FontAwesomeIcons.transgender,
                          labelText: 'Sales Person'),
                      InputField(
                          readonly: false,
                          hintText: "sales ",
                          labelText: " Bounce",
                          iconName: FontAwesomeIcons.user,
                          controller: husbandA.controllerBounce),
                      InputDropDownMenu(
                          obj: husbandA.Tags,
                          iconName: FontAwesomeIcons.transgender,
                          labelText: 'Payment Terms(Sales)'),
                      InputField(
                          readonly: false,
                          hintText: "Misc ",
                          labelText: "Internal Reference ",
                          iconName: FontAwesomeIcons.user,
                          controller: husbandA.controllerInternalReference),
                      InputField(
                          readonly: false,
                          hintText: " Barcode",
                          labelText: "Barcode ",
                          iconName: FontAwesomeIcons.user,
                          controller: husbandA.controllerBarCode),
                      InputDropDownMenu(
                          obj: husbandA.PaymentTerms,
                          iconName: FontAwesomeIcons.transgender,
                          labelText: 'Payment Terms (Purchased)'),
                      InputField(
                          readonly: false,
                          hintText: " Fiscal Position",
                          labelText: "Fiscal Information ",
                          iconName: FontAwesomeIcons.user,
                          controller: husbandA.controllerFiscalPosition),
                    ],
                  ),
                ),
              ),
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
                          flag = 4;
                        } else {
                          flag = 0;
                        }
                      });
                    },
                    initiallyExpanded: flag == 4 ? true : false,
                    title: Text(
                      "Invoicing",
                      style: kDrawerTitle,
                    ),
                    backgroundColor: Colors.grey[200],
                    children: <Widget>[
                      InputDropDownMenu(
                          obj: husbandA.Tags,
                          iconName: FontAwesomeIcons.transgender,
                          labelText: 'Account Receivable'),
                      InputDropDownMenu(
                          obj: husbandA.Tags,
                          iconName: FontAwesomeIcons.transgender,
                          labelText: 'Account Payable'),
                    ],
                  ),
                ),
              ),
              RaisedButton(
                padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                color: Color(0xFF8dc0c6),
                onPressed: () async {
                  client.create(husbandA.model, husbandA.toJson()).then((value) {
                    print(value.getStatusCode());
                    print(value.getResult());

                    if (value.getStatusCode() == 200) {
                      Navigator.of(context).pop(ItemDTO(id: value.getResult() ,controllerItemName: husbandA.controllerHusbandName));
                    }
                  });
                },
                child: Text(
                  "Save Husband",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
