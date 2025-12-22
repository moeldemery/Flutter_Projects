import 'package:gyna/odoo/patientDTO.dart';
import 'package:gyna/odoo/visitDTO.dart';
import 'package:object_mapper/object_mapper.dart';
import 'package:odoo_api/odoo_api.dart';
import 'dart:io';

import 'itemsDTO.dart';

// import 'package:odoo_rpc/odoo_rpc.dart';

class OdooAuth{

  //static String  baseUrl = 'http://41.39.45.27:8070';
  static String  baseUrl = 'http://192.168.1.8:8070';

  static String userName = "administrator@gyn.com";
  static String password = "GYNA@20_30";
  static String databaseName = "GYN_CLINIC";

  static Future<void> odooConnectDB(OdooClient myClient) async {
    await myClient.connect().then((version) => print("Connected $version"));

    await myClient
        .authenticate(OdooAuth.userName, OdooAuth.password, OdooAuth.databaseName)
        .then((version) async {
      print(version.isSuccess.toString());
      // myPatientsList = await fetch() ;
    });
  }

  static Future<List<ItemsDTO>> fetchRecordName(OdooClient myClient , String modelName) async {
    // Future<ItemListDTO> myPatientsList;
    // Future<OdooResponse> odooRespnce;
    await OdooAuth.odooConnectDB(myClient);
    return myClient
        .searchRead(modelName, [], ['name'])
        .then((value) => Mapper.fromJson(value.getResult()).toObject<ItemListDTO>())
        .then((value) => value.itemsList);
  }
  static Future<List<VisitItemDTO>> fetchRecordDate(OdooClient myClient , String modelName) async {
    // Future<ItemListDTO> myPatientsList;
    // Future<OdooResponse> odooRespnce;
    await OdooAuth.odooConnectDB(myClient);
    return myClient
        .searchRead(modelName, [], ['name','patient_id' ,'date'])
        .then((value) {
          print(value.getResult());
          return Mapper.fromJson(value.getResult()).toObject<VisitItemListDTO>();
        })
        .then((value) => value.visitItemsList);
  }

  static Future<PatientDTO> fetchPatientRecord(OdooClient myClient , String modelName , int id) async {
    // Future<ItemListDTO> myPatientsList;
    // Future<OdooResponse> odooRespnce;
    await OdooAuth.odooConnectDB(myClient);
    return myClient
        .read(modelName, [id], [])
        .then((value) {
          print(value.getResult());
          return Mapper.fromJson(value.getResult()[0]).toObject<PatientDTO>();
        });
  }

}

// sessionChanged(OdooSession sessionId) async {
//   print('We got new session ID: ' + sessionId.id);
//   // write to persistent storage
// }
