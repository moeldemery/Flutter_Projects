import 'package:gyna/assets/custom_widget.dart';
import 'package:object_mapper/object_mapper.dart';
import 'package:flutter/material.dart';

class MedicineDTO with Mappable {

  static String model = "gyn.clinic.medicine";

  var controllerMedicineName = TextEditingController(text: '');
  SelectedDropDown medicamentType = new SelectedDropDown(listDrop: [
    'Medicine',
    'Vaccine',
    'Capsules',
    'Syrup',
    'Pills',
    'Suppositories',
    'Injection',
    'Medicine Supplies'
  ]);

  var controllerPregnancy = TextEditingController(text: '');
  var controllerComposition = TextEditingController(text: '');
  var controllerDosage = TextEditingController(text: '');
  var controllerAdverse = TextEditingController(text: '');
  var controllerDose = TextEditingController(text: '');
  var controllerIndication = TextEditingController(text: '');
  var controllerOverDosage = TextEditingController(text: '');
  var controllerStorage = TextEditingController(text: '');
  var controllerExtraInfo = TextEditingController(text: '');

  @override
  void mapping(Mapper map) {

    map("name", controllerMedicineName.text,
            (v) => controllerMedicineName.text = v);



    map("medicament_type", medicamentType.valueDrop,
        (v) => medicamentType.valueDrop = v);
    map("dose", controllerDosage.text, (v) => controllerDosage.text = v);
    map("pregnancy", controllerPregnancy.text,
            (v) => controllerPregnancy.text = v);
    map("indications", controllerIndication.text,
            (v) => controllerIndication.text = v);
    map("composition", controllerComposition.text,
        (v) => controllerComposition.text = v);
    map("overdosage", controllerOverDosage.text,
            (v) => controllerOverDosage.text = v);


    map("Adverse", controllerAdverse.text, (v) => controllerAdverse.text = v);
    map("Dose", controllerDose.text, (v) => controllerDose.text = v);


    map("Storage", controllerStorage.text, (v) => controllerStorage.text = v);
    map("ExtraInfo", controllerExtraInfo.text,
        (v) => controllerExtraInfo.text = v);
  }
}
