import 'package:flutter/cupertino.dart';
import 'package:object_mapper/object_mapper.dart';

class DrugsDTO with Mappable {

  String model = "gyn.clinic.drugs";

  String drugControllerName ;
  String drugPatientId ;

  @override
  void mapping(Mapper map) {
    map("name", drugControllerName, (v) => drugControllerName = v);
    map("patient_id", drugPatientId, (v) => drugPatientId = v);
  }
}