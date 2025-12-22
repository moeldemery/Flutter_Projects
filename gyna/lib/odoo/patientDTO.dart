import 'package:flutter/cupertino.dart';
import 'package:gyna/assets/custom_widget.dart';
import 'package:gyna/odoo/itemsDTO.dart';
import 'package:object_mapper/object_mapper.dart';


class PatientDTO with Mappable {
  // controller for personal info drop down


  static String model = "gyn.clinic.patient";


  var patientControllerName = TextEditingController(text: '');
  SelectedDropDown genderType = new SelectedDropDown(listDrop: ['ms', 'miss']);
  var patientControllerBirthDay = TextEditingController(text: '');
  var controllerAge = TextEditingController(text: '');
  var controllerMobile = TextEditingController(text: '');
  var controllerOccupation = TextEditingController(text: '');

  //SelectedSearchField husbandName = new SelectedSearchField();
  ItemsDTO selectedHusbandSearch = new ItemsDTO();
  List<ItemsDTO> listHusbandSearch = [];
  var controllerHusbandBirthDay = TextEditingController(text: '');
  var controllerHusbandAge = TextEditingController(text: '');
  var controllerHusbandMobile = TextEditingController(text: '');
  var controllerHusbandJobPosition = TextEditingController(text: '');

  var controllerMarriedDate = TextEditingController(text: '');
  var controllerMarriedYears = TextEditingController(text: '');
  var controllerMarriedMonths = TextEditingController(text: '');

  var controllerCity = TextEditingController(text: '');
  var controllerZone = TextEditingController(text: '');
  var controllerStreet = TextEditingController(text: '');
  var controllerPhone = TextEditingController(text: '');
  var controllerMobile2 = TextEditingController(text: '');

  // controllers for medical info
  var controllerMens = TextEditingController(text: '');
  var controllerObs = TextEditingController(text: '');
  var controllerGyne = TextEditingController(text: '');
  List<ItemsDTO> listMedicalHistorySearch = [];
  List<ItemsDTO> listMedicalHistorySelected = [new ItemsDTO()];
  // var controllerGeneralMediceneHistory = TextEditingController(text: '');
  var controllerHis = TextEditingController(text: '');
  List<TextEditingController>  controllerProhibitedDrugsList= [new TextEditingController(text: "")];
  var controllerGeneralHistory = TextEditingController(text: '');

  // controllers for Visits
  //var controllerProhibitedDrugs = TextEditingController(text: '');

  // controllers for diagnostic results
  SelectedDropDown labType = new SelectedDropDown(listDrop: ['lab', 'x-ray', 'path']);
  ItemsDTO selectedLabGroupSearch = new ItemsDTO();
  List<ItemsDTO> listLabGroupSearch = [];
  ItemsDTO selectedLabGroup2Search = new ItemsDTO();
  List<ItemsDTO> listLabGroup2Search = [];
  var controllerCt = TextEditingController(text: '');

  // controllers for Operative Data
  var controllerOperation = TextEditingController(text: '');
  var controllerGeneralNotes = TextEditingController(text: '');

  //controller for report
  SelectedDropDown dropDownReport = new SelectedDropDown(listDrop: ['hsg', 'pap smear', 'kind care', 'endometrial']);
  //controller for scanned
  var controllerUpload = TextEditingController(text: '');

  @override
  void mapping(Mapper map) {
    map("name", patientControllerName.text, (v) => patientControllerName.text = v.toString());
    map("female_type", genderType.valueDrop, (v) => genderType.valueDrop = v.toString());

    map("female_birth_date", patientControllerBirthDay.text != '' ? patientControllerBirthDay.text : '1/1/2000', (v) => patientControllerBirthDay.text = v.toString());

    map("female_age", controllerAge.text, (v) => controllerAge.text = v.toString());
    map("female_mobile", controllerMobile.text, (v) => controllerMobile.text = v!= false ? v.toString() : '');
    map("female_occupation", controllerOccupation.text, (v) => controllerOccupation.text =  v!= false ? v : '');


    map("married_date",controllerMarriedDate.text != '' ? controllerMarriedDate.text : '1/1/2000', (v) => controllerMarriedDate.text =  v!= false ? v : '');

    map("year", controllerMarriedYears.text, (v) => controllerMarriedYears.text =  v!= false ? v : '');
    map("month", controllerMarriedMonths.text, (v) => controllerMarriedMonths.text =  v!= false ? v : '');

    map("husband_name", selectedHusbandSearch.id, (v) {
      return selectedHusbandSearch.id = v!=false ? v[0] : null ;
    });


      map("husband_birth_date", controllerHusbandBirthDay.text != '' ? controllerHusbandBirthDay.text : '1/1/2000',
          (v) => controllerHusbandBirthDay.text =  v!= false ? v : '');

    map("husband_age", controllerHusbandAge.text, (v) => controllerHusbandAge.text =  v!= false ? v.toString() : '');
    map("husband_mobile", controllerHusbandMobile.text, (v) => controllerHusbandMobile.text =  v!= false ? v : '');
    map("husband_occupation", controllerHusbandJobPosition.text,
        (v) => controllerHusbandJobPosition.text =  v!= false ? v : '');

    map("city", controllerCity.text, (v) => controllerCity.text =  v!= false ? v : '');
    map("zone", controllerZone.text, (v) => controllerZone.text =  v!= false ? v : '');
    map("street", controllerStreet.text, (v) => controllerStreet.text =  v!= false ? v : '');
    map("phone", controllerPhone.text, (v) => controllerPhone.text =  v!= false ? v : '');
    map("mobile", controllerMobile2.text, (v) => controllerMobile2.text =  v!= false ? v : '');

    // controllers for medical info
    map("menstrual_history", controllerMens.text, (v) => controllerMens.text =  v!= false ? v : '');
    map("obstetric_history", controllerObs.text, (v) => controllerObs.text =  v!= false ? v : '');
    map("gynecologic_history", controllerGyne.text, (v) => controllerGyne.text =  v!= false ? v : '');
    List generalMedicenesIds = [1 , 2];
    // for(ItemsDTO item in listMedicalHistorySelected ){
    //   if(item.id != null){
    //     generalMedicenesIds.add(item.id);
    //   }
    // }
    //print(generalMedicenesIds);
    //map("general_medical_history.id", [6,0,[1]], (v) => generalMedicenesIds = v!=false ? v : null);
    map("history_note", controllerHis.text, (v) => controllerHis.text =  v!= false ? v : '');
    //map("prohibited_drugs", controllerProhibitedDrugsList, (v) => controllerProhibitedDrugsList= v);
    map("history", controllerGeneralHistory.text, (v) => controllerGeneralHistory.text =  v!= false ? v : '');

    // controllers for Visits
    // map("female_type", controllerProhibitedDrugsList.text, (v) => controllerProhibitedDrugsList.text = v);

    // controllers for diagnostic results
    map("lab_type", labType.valueDrop, (v) => labType.valueDrop =  v!= false ? v : '');
    map("lab_group_id", selectedLabGroupSearch.id, (v) => selectedLabGroupSearch.id =  v!=false ? v[0] : null);
    map("another_lab_group", selectedLabGroup2Search.id, (v) => selectedLabGroup2Search.id = v!=false ? v[0] : null);
    // map("female_type", controllerCt.text, (v) => controllerCt.text = v);
    //
    // // controllers for Operative Data
    // map("female_type", controllerOperation.text, (v) => controllerOperation.text = v);
    map("general_notes", controllerGeneralNotes.text, (v) => controllerGeneralNotes.text =  v!= false ? v : '');
    //
    // //controller for report
    map("report_selection", dropDownReport.valueDrop, (v) => dropDownReport.valueDrop =  v!= false ? v : '');
    //
    // //controller for scanned
    // map("female_type", controllerUpload.text, (v) => controllerUpload.text = v);
  }
}


