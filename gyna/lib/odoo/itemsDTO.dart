


import 'package:flutter/cupertino.dart';
import 'package:gyna/odoo/visitDTO.dart';
import 'package:object_mapper/object_mapper.dart';

class ItemsDTO with Mappable{

  int id;
  var controllerItemName =  TextEditingController(text:'');



  @override
  void mapping(Mapper map) {
    map("id", id, (v) => id = v);
    map("name", controllerItemName.text, (v) => controllerItemName.text = v.toString());
  }
}

class ItemDTO{
  int id;
  var controllerItemName =  TextEditingController(text:'');


  ItemDTO({this.id, this.controllerItemName});
}


class ItemListDTO with Mappable{

  // String model = "res.partner";

  int length;
  List<ItemsDTO> itemsList ;

  @override
  void mapping(Mapper map) {
    map("length", length, (v) => length = v);
    map<ItemsDTO>("records", itemsList, (v) => itemsList = v);
  }
}

class VisitItemDTO with Mappable{

  int id;
  var controllerItemName =  TextEditingController(text:'');
  var controllerItemDate =  TextEditingController(text:'');
  var controllerItemPatientName =  TextEditingController(text:'');
  var controllerItemPatientId =  TextEditingController(text:'');


  @override
  void mapping(Mapper map) {
    map("id", id, (v) => id = v);
    map("name", controllerItemName.text, (v) => controllerItemName.text = v.toString());
    map("date", controllerItemDate.text, (v) {
      if(v != false) {
        return controllerItemDate.text = v.toString();
      }
      return controllerItemDate.text = '';
    });
    map("patient_id", controllerItemDate.text, (v) {
      if(v != false) {
        controllerItemPatientId.text = v[0].toString();
        return controllerItemPatientName.text = v[1].toString();
      }
      controllerItemPatientId.text ='';
      return controllerItemPatientName.text = '';
    });
  }
}

class VisitItemListDTO with Mappable{

  // String model = "res.partner";

  int length;
  List<VisitItemDTO> visitItemsList ;

  @override
  void mapping(Mapper map) {
    map("length", length, (v) => length = v);
    map<VisitItemDTO>("records", visitItemsList, (v) => visitItemsList = v);
  }
}