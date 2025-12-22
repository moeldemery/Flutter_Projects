import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/components/search_bar/gf_search_bar.dart';
import 'package:gyna/assets/constants.dart';
import 'package:gyna/odoo/itemsDTO.dart';
import 'package:gyna/odoo/odooAuth.dart';
import 'package:gyna/odoo/patientDTO.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:odoo_api/odoo_api.dart';

Future<List<ItemsDTO>> futurePatientsList;
Future<PatientDTO> futureSelectedPatient;
List<ItemsDTO> patientList;

class ViewPatient extends StatefulWidget {
  final OdooClient myClient;
  ViewPatient({this.myClient});
  @override
  _ViewPatientState createState() => _ViewPatientState();
}

class _ViewPatientState extends State<ViewPatient> {
  //final BorderSide side = BorderSide(color: Colors.green, width: 2.0, style: BorderStyle.solid);
  //var patientDTO = PatientDTO();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    futurePatientsList = OdooAuth.fetchRecordName(widget.myClient, PatientDTO.model);
    futurePatientsList.then((value) => print(value));
  }

  //Decode your json string
  String jsonSample = '[{"name":"Ram","email":"ram@gmail.com","age":23,"DOB":"1990-12-01"},'
      '{"name":"Shyam","email":"shyam23@gmail.com","age":18,"DOB":"1995-07-01"},'
      '{"name":"John","email":"john@gmail.com","age":10,"DOB":"2000-02-24"},'
      '{"name":"Ram","age":12,"DOB":"2000-02-01"}]';

  HDTRefreshController _hdtRefreshController = HDTRefreshController();

  static const int sortName = 0;
  static const int sortStatus = 1;
  bool isAscending = true;
  int sortType = sortName;
  Map<int, bool> selectedItems = {};
  int selectedCount = 0;
  List<int> selectedId = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar2,
      floatingActionButton: selectedCount > 0
          ? FloatingActionButton(
              backgroundColor: Colors.red,
              child: Icon(
                FontAwesomeIcons.trashAlt,
                size: 25.0,
                color: Colors.white,
              ),
              onPressed: () {
                for (var value in selectedId) {
                  print(value);
                }
                widget.myClient.unlink(PatientDTO.model, selectedId).then((value) {
                  if(value.getStatusCode() == 200){
                    Flushbar(
                      title: "Deleted Successfully",
                      message:
                      "The patients has been successfully added  ! ",
                      duration: Duration(seconds: 5),
                      margin: EdgeInsets.all(8),
                      borderRadius: 8,
                      icon: Icon(
                        Icons.check,
                        color: Colors.greenAccent,
                        size: 25.0,
                      ),
                    )..show(context).then((value) {
                      //clear old data
                      patientList.clear();
                      futurePatientsList = OdooAuth.fetchRecordName(widget.myClient, PatientDTO.model);
                      setState(() {
                        
                      });
                    });
                  }
                } );
              },
            )
          : null,
      body: Center(
        child: SingleChildScrollView(
          child: FutureBuilder(
              future: futurePatientsList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  patientList = new List.from(snapshot.data);
                  return Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: GFSearchBar(
                          //hideSearchBoxWhenItemSelected: true,
                          searchList: patientList.reversed.toList(),
                          searchQueryBuilder: (query, List<ItemsDTO> list) {
                            return list
                                .where((item) => item.controllerItemName.text
                                    .toLowerCase()
                                    .contains(query.toLowerCase()))
                                .toList();
                          },
                          overlaySearchListItemBuilder: (item) {
                            return Container(
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    child: Text("${item.controllerItemName.text}"),
                                    width: 200,
                                    height: 52,
                                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                    alignment: Alignment.centerLeft,
                                  ),
                                  Container(
                                    child: Text("${item.id.toString()}"),
                                    width: 100,
                                    height: 52,
                                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                    alignment: Alignment.centerLeft,
                                  ),
                                ],
                              ),
                            );
                          },
                          onItemSelected: (ItemsDTO item) async {
                            PatientDTO myPatient = await OdooAuth.fetchPatientRecord(
                                widget.myClient, PatientDTO.model, item.id);
                            generatePatientSummery(myPatient);
                          },
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.70,
                        child: HorizontalDataTable(
                          leftHandSideColumnWidth: 100,
                          rightHandSideColumnWidth: 300,
                          isFixedHeader: true,
                          headerWidgets: _getTitleWidget(),
                          itemCount: snapshot.data.length,
                          leftSideItemBuilder: _generateFirstColumnRow,
                          rightSideItemBuilder: _generateRightHandSideColumnRow,

                          // leftSideItemBuilder: _generateFirstColumnRow(context,index),
                          rowSeparatorWidget: const Divider(
                            color: Colors.black54,
                            height: 1.0,
                            thickness: 0.0,
                          ),
                          leftHandSideColBackgroundColor: Color(0xFFFFFFFF),
                          rightHandSideColBackgroundColor: Color(0xFFFFFFFF),
                          verticalScrollbarStyle: const ScrollbarStyle(
                            isAlwaysShown: true,
                            thickness: 4.0,
                            radius: Radius.circular(5.0),
                          ),
                          horizontalScrollbarStyle: const ScrollbarStyle(
                            isAlwaysShown: true,
                            thickness: 4.0,
                            radius: Radius.circular(5.0),
                          ),

                          //------------------
                          enablePullToRefresh: true,
                          refreshIndicator: const WaterDropHeader(),
                          refreshIndicatorHeight: 60,
                          htdRefreshController: _hdtRefreshController,
                          onRefresh: () async {
                            futurePatientsList =
                                OdooAuth.fetchRecordName(widget.myClient, PatientDTO.model);
                            await Future.delayed(const Duration(milliseconds: 500));
                            _hdtRefreshController.refreshCompleted();
                          },
                          //------------------
                        ),
                      ),
                    ],
                  );
                }
                return CircularProgressIndicator();
              }),
        ),
      ),
    );
  }

  List<Widget> _getTitleWidget() {
    return [
      _getTitleItemWidget('#', 50),
      _getTitleSortableItemWidget('Name', 200, sortName),
      _getTitleSortableItemWidget('Id', 100, sortStatus),
    ];
  }

  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      child: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
      width: width,
      height: 56,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  Widget _getTitleSortableItemWidget(String label, double width, int sortInputType) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      child: _getTitleItemWidget(
          label + (sortType == sortInputType ? (isAscending ? '↓' : '↑') : ''), width),
      onPressed: () {
        sortType = sortInputType;
        isAscending = !isAscending;
        //user.sortName(isAscending);
        setState(() {});
      },
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return Container(
        width: 100,
        height: 52,
        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        alignment: Alignment.centerLeft,
        child: Checkbox(
          value: selectedItems[index] == null ? selectedItems[index] = false : selectedItems[index],
          onChanged: (bool change) {
            setState(() {
              selectedItems[index] = !selectedItems[index];

              if (selectedItems[index] == true) {
                selectedCount++;
                selectedId.add(patientList[index].id);
              } else {
                selectedCount--;
                selectedId.remove(patientList[index].id);
              }


              //print(selectedCount);
            });
            //print(selectedItems[index]);
            //selectedItems[patientList[index].id] = change;
          },
        ));
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    ItemsDTO currentItem = patientList[index];
    return Container(
      child: Row(
        children: <Widget>[
          GestureDetector(
            child: Container(
              child: Text("${patientList[index].controllerItemName.text}"),
              width: 200,
              height: 52,
              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.centerLeft,
            ),
            onTap: () async {
              PatientDTO myPatient = await OdooAuth.fetchPatientRecord(
                  widget.myClient, PatientDTO.model, currentItem.id);
              generatePatientSummery(myPatient);
            },
          ),
          Container(
            child: Text("${patientList[index].id.toString()}"),
            width: 100,
            height: 52,
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.centerLeft,
          ),
        ],
      ),
    );
  }

  void generatePatientSummery(PatientDTO myPatient) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: new Text('${myPatient.patientControllerName.text}'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Type :  ${myPatient.genderType.valueDrop.toString()}'),
                Text('BirthDay :  ${myPatient.patientControllerBirthDay.text}'),
                Text('Age :  ${myPatient.controllerAge.text}'),
                Text('Mobile :  ${myPatient.controllerMobile.text}'),
                Text('Occupation :  ${myPatient.controllerOccupation.text} '),
                Text('Married Date:  ${myPatient.controllerMarriedDate.text}'),
                Text('Married years:  ${myPatient.controllerMarriedYears.text}'),
                Text('Married months:  ${myPatient.controllerMarriedMonths.text}\n'),
                Text('Husband birthday :  ${myPatient.controllerHusbandBirthDay.text} '),
                Text('Husband age :  ${myPatient.controllerHusbandAge.text} '),
                Text('Husband mobile :  ${myPatient.controllerHusbandMobile.text} '),
                Text('Husband job :  ${myPatient.controllerHusbandJobPosition.text} \n'),
                Text('City :  ${myPatient.controllerCity.text}'),
                Text('Zone :  ${myPatient.controllerZone.text}'),
                Text('Street :  ${myPatient.controllerStreet.text}'),
                Text('Phone :  ${myPatient.controllerPhone.text}'),
                Text('Mobile :  ${myPatient.controllerMobile2.text}\n'),
                Text('menstrual history :  ${myPatient.controllerMens.text}'),
                Text('obstetric history :  ${myPatient.controllerObs.text}'),
                Text('gynecologic history :  ${myPatient.controllerGyne.text}'),
              ],
            ),
            actions: <Widget>[
              RaisedButton(
                  child: Text('Ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
            ],
          );
        });
  }
}
