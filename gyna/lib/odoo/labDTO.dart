

import 'package:flutter/cupertino.dart';
import 'package:gyna/assets/custom_widget.dart';
import 'package:object_mapper/object_mapper.dart';

import 'itemsDTO.dart';

class LabDTO with Mappable {

  static String model = "gyn.clinic.requests";

  var controllerName = TextEditingController(text: '');
  SelectedDropDown requestType = new SelectedDropDown(listDrop: ['lab', 'radiology' , 'pathology']);

  ItemsDTO selectedCategorySearch = new ItemsDTO();
  List<ItemsDTO> listCategorySearch = [];

  @override
  void mapping(Mapper map) {

    map("name", controllerName.text, (v) => controllerName.text = v);
    map("type", requestType.valueDrop, (v) => requestType.valueDrop = v);
    map("category_id", selectedCategorySearch.id, (v) => selectedCategorySearch.id = v);

  }

}