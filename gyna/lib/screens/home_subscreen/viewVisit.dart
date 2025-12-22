import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gyna/assets/constants.dart';
import 'package:gyna/assets/custom_table.dart';
import 'package:gyna/odoo/itemsDTO.dart';
import 'package:gyna/odoo/odooAuth.dart';
import 'package:gyna/odoo/visitDTO.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:odoo_api/odoo_api.dart';

class ViewVisit extends StatefulWidget {
  final OdooClient myClient;
  ViewVisit({this.myClient});

  @override
  _ViewVisitState createState() => _ViewVisitState();
}

Future<List<VisitItemDTO>> futureVisitList;
List<VisitItemDTO> visitList;

class _ViewVisitState extends State<ViewVisit> {
  HDTRefreshController _hdtRefreshController = HDTRefreshController();
  static const int sortName = 0;
  static const int sortStatus = 1;
  bool isAscending = true;
  int sortType = sortName;
  Map<int, bool> selectedItems = {};
  int selectedCount = 0;
  List<int> selectedId = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    futureVisitList = OdooAuth.fetchRecordDate(widget.myClient, VisitDTO.model);
    futureVisitList.then((value) => print(value));
  }

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
          widget.myClient.unlink(VisitDTO.model, selectedId).then((value) {
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
                visitList.clear();
                selectedItems.clear();
                futureVisitList = OdooAuth.fetchRecordDate(widget.myClient, VisitDTO.model);
                setState(() {

                });
              });
            }
          } );
        },
      )
          : null,
      body: Center(
        child: Column(children: [
          FutureBuilder(
              future: futureVisitList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  visitList = new List.from(snapshot.data);
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.78,
                    child: HorizontalDataTable(
                      leftHandSideColumnWidth: 50,
                      rightHandSideColumnWidth: 400,
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
                        futureVisitList = OdooAuth.fetchRecordDate(widget.myClient, VisitDTO.model);
                        await Future.delayed(const Duration(milliseconds: 500));
                        _hdtRefreshController.refreshCompleted();
                      },
                      //------------------
                    ),
                  );
                }
                return Expanded(child: Center(child: CircularProgressIndicator()));
              }),
        ]),
      ),
    );
  }



  List<Widget> _getTitleWidget() {
    return [
      _getTitleItemWidget('#', 50),

      _getTitleItemWidget('date', 100),
      _getTitleItemWidget('patient', 150),
      _getTitleItemWidget('id patient', 50),
      _getTitleItemWidget('id visit', 100),
      // _getTitleSortableItemWidget('Name', 200, sortName),
      // _getTitleSortableItemWidget('Id', 100, sortStatus),
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
                selectedId.add(visitList[index].id);
              } else {
                selectedCount--;
                selectedId.remove(visitList[index].id);
              }


              //print(selectedCount);
            });
            //print(selectedItems[index]);
            //selectedItems[patientList[index].id] = change;
          },
        ));
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            child: Text("${visitList[index].controllerItemDate.text}"),
            width: 100,
            height: 52,
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.centerLeft,
          ),
          Container(
            child: Text("${visitList[index].controllerItemPatientName.text}"),
            width: 150,
            height: 52,
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.centerLeft,
          ),
          Container(
            child: Text("${visitList[index].controllerItemPatientId.text}"),
            width: 50,
            height: 52,
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.centerLeft,
          ),
          Container(
            child: Text("${visitList[index].controllerItemName.text}"),
            width: 100,
            height: 52,
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.centerLeft,
          ),
        ],
      ),
    );
  }
}
