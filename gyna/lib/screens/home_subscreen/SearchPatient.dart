

import 'package:flutter/cupertino.dart';
import 'package:getwidget/getwidget.dart';
import 'package:gyna/odoo/itemsDTO.dart';
import 'package:gyna/odoo/odooAuth.dart';
import 'package:gyna/odoo/patientDTO.dart';
import 'package:odoo_api/odoo_api.dart';

Future<List<ItemsDTO>> futurePatientsList;
List<ItemsDTO> patientList;
class SearchPatient extends StatefulWidget {

  final OdooClient myClient;
  SearchPatient({this.myClient});

  @override
  _SearchPatientState createState() => _SearchPatientState();
}

class _SearchPatientState extends State<SearchPatient> {

  PatientDTO myPatient = new PatientDTO();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    OdooAuth.fetchRecordName(widget.myClient, PatientDTO.model);

  }


  @override
  Widget build(BuildContext context) {
    return  GFSearchBar(
      searchList: patientList,
      searchQueryBuilder:(query, List<ItemsDTO> list) {
        return list
            .where((item) =>
            item.controllerItemName.text.toLowerCase().contains(query.toLowerCase()))
            .toList();
      },
      overlaySearchListItemBuilder: (item) {
        return Container(
          //padding: const EdgeInsets.all(8),
          child: Text(
            item.controllerItemName.text,
            style: const TextStyle(fontSize: 18),
          ),
        );
      },
      onItemSelected: (ItemsDTO item) {
        setState(() {
          //widget.obj.valueDrop = item;


        });
      },

    );
  }
}
