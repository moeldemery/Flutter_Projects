

import 'package:flutter/cupertino.dart';
import 'package:object_mapper/object_mapper.dart';

class DoctorBooking with Mappable {

  var patientControllerName = TextEditingController(text: '');
  @override
  void mapping(Mapper map) {

    map("name", patientControllerName.text, (v) => patientControllerName.text = v.toString());
  }
}