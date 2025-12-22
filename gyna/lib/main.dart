
import 'package:flutter/material.dart';
import 'package:gyna/odoo/visitDTO.dart';
import 'package:gyna/screens/home_subscreen/SearchPatient.dart';
import 'package:gyna/screens/home_subscreen/addLab_screen.dart';
import 'package:gyna/screens/home_subscreen/addPatient_screen.dart';
import 'package:gyna/screens/home_screen.dart';
import 'package:gyna/screens/home_subscreen/addPatient_subscreen/addHusband_screen.dart';
import 'package:gyna/screens/home_subscreen/addVisit.dart';
import 'package:gyna/screens/home_subscreen/viewPatient.dart';
import 'package:gyna/screens/home_subscreen/viewVisit.dart';
import 'package:gyna/screens/home_subscreen/medicine.dart';
import 'package:object_mapper/object_mapper.dart';
 import 'package:odoo_api/odoo_api.dart';

// import 'package:odoo_rpc/odoo_rpc.dart';
import 'odoo/drugsDTO.dart';
import 'odoo/itemsDTO.dart';
import 'odoo/labDTO.dart';
import 'odoo/medicineDTO.dart';
import 'odoo/odooAuth.dart';
import 'odoo/patientDTO.dart';


void main() async{

  // Restore session ID from storage and pass it to client constructor.

  final client = OdooClient(OdooAuth.baseUrl);
  OdooAuth.odooConnectDB(client);
  // Subscribe to session changes to store most recent one
  // var subscription = client.sessionStream.listen(sessionChanged);

  Mappable.factories = {
    PatientDTO: () => PatientDTO(),
    VisitDTO: ()=> VisitDTO(),
    VisitItemDTO: ()=>VisitItemDTO(),
    VisitItemListDTO: ()=> VisitItemListDTO(),
    ItemsDTO: () => ItemsDTO(),
    ItemListDTO: () => ItemListDTO(),
    DrugsDTO: () => DrugsDTO(),
    LabDTO: ()=> LabDTO(),
    MedicineDTO : ()=>MedicineDTO(),
  };

  runApp(MyApp(odooClient: client,));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final OdooClient odooClient;
  MyApp({this.odooClient});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.green[800],
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(), //
        '/addPatient': (context) => AddPatient(myClient: odooClient,),
        '/viewPatient': (context) => ViewPatient(myClient: odooClient,),
        '/addVisit':(context) => AddVisit(myClient: odooClient,),
        '/viewVisit': (context) => ViewVisit(myClient: odooClient,),
        '/addHusband':(context) => AddHusband(),
        '/addLab':(context) => AddLab(myClient: odooClient,),
        '/searchPatient':(context) => SearchPatient(myClient: odooClient,),
        '/addMedicine':(context) => AddMedicine(myClient: odooClient,),
      },
    );
  }
}
