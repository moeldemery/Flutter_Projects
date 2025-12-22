import 'package:flutter/cupertino.dart';
import 'package:gyna/assets/custom_widget.dart';
import 'package:object_mapper/object_mapper.dart';

import 'itemsDTO.dart';





class HusbandDTO with Mappable{

  String model = "res.partner";

  TextEditingController controllerHusbandName = TextEditingController(text: '');

  //controllers for contact and addresses
  TextEditingController controllerStreet = TextEditingController(text: '');
  TextEditingController controllerStreet2 = TextEditingController(text: '');

  TextEditingController controllerCity = TextEditingController(text: '');
  SelectedDropDown State = new SelectedDropDown(listDrop: []);
  TextEditingController controllerZip = TextEditingController(text: '');
  SelectedDropDown Country = new SelectedDropDown (listDrop: []);

  TextEditingController controllerTax = TextEditingController(text: '');
  TextEditingController controllerJop = TextEditingController(text: '');
  TextEditingController controllerPhone = TextEditingController(text: '');
  TextEditingController controllerMobile = TextEditingController(text: '');
  TextEditingController controllerEmail = TextEditingController(text: '');
  TextEditingController controllerWebsite = TextEditingController(text: '');
  SelectedDropDown Title = new SelectedDropDown(listDrop: []);
  SelectedDropDown Language = new SelectedDropDown(listDrop: []);
  SelectedDropDown Tags = new SelectedDropDown(listDrop: []);

  //controllers for internal notes
  TextEditingController controllerNotes = TextEditingController(text: '');

  //controllers for sales and purchased
  TextEditingController controllerBounce = TextEditingController(text: '');
  SelectedDropDown PaymentTerms = new SelectedDropDown(listDrop: []);
  TextEditingController controllerInternalReference = TextEditingController(text: '');
  TextEditingController controllerBarCode = TextEditingController(text: '');
  TextEditingController controllerFiscalPosition = TextEditingController(text: '');




  @override
  void mapping(Mapper map) {

    map("name", controllerHusbandName.text, (v) => controllerHusbandName.text = v);

    map("street", controllerStreet.text, (v) => controllerStreet.text = v);
    map("street2", controllerStreet2.text, (v) => controllerStreet2.text = v);
    map("city", controllerCity.text, (v) => controllerCity.text = v);

    map("zip", controllerZip.text, (v) => controllerZip.text = v);

    map("vat", controllerTax.text, (v) => controllerTax.text = v);
    map("function", controllerJop.text, (v) => controllerJop.text = v);
    map("phone", controllerPhone.text, (v) => controllerPhone.text = v);
    map("mobile", controllerMobile.text, (v) => controllerMobile.text = v);
    map("email", controllerEmail.text, (v) => controllerEmail.text = v);
    map("website", controllerWebsite.text, (v) => controllerWebsite.text = v);





  }
}