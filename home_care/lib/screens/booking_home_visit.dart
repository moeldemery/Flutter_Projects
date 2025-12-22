import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:home_care/assets/constants.dart';
import 'package:geolocator/geolocator.dart';
import 'package:home_care/services/location.dart';
import 'package:http/http.dart' as http;

class BookingHomeVisit extends StatefulWidget {
  @override
  _BookingHomeVisitState createState() => _BookingHomeVisitState();
}

List<LatLng> repCoOrdinates = [
  LatLng(31.2070, 29.970),
  LatLng(31.2000, 29.900),
  LatLng(31.2089, 29.9110),
  LatLng(31.2057, 29.9096)
];
var myMarker = repCoOrdinates
    .map((coordinate) => Marker(
          markerId: MarkerId('$coordinate'),
          position: coordinate,
          icon: BitmapDescriptor.fromAsset('assets/images/ambulance2.png'),
        ))
    .toList();

class _BookingHomeVisitState extends State<BookingHomeVisit> {
  BitmapDescriptor mapCarIcon;
  Set<Polyline> _polyLines ={};
  CameraPosition initCameraPos;
  LatLng myCoordinates;
  List<double> routedListDist = [];
  Completer<GoogleMapController> _controller = Completer();
  var smallestdistIndex = 0;

  void setCameraPosition() async {
    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      myCoordinates = LatLng(position.latitude, position.longitude);
    });
  }

  void nearestRep(List<LatLng> repCoordinateLocal) async {
    routedListDist.add(calculateDistance(repCoOrdinates[0]));
    var smallestDistance = routedListDist[0];


    for (int i = 1; i < repCoordinateLocal.length; i++) {
      routedListDist.add(calculateDistance(repCoOrdinates[i]));

      if (smallestDistance > routedListDist[i]) {
        smallestDistance = routedListDist[i];
        smallestdistIndex = i;
      }
      String nroute = await getRouteCoordinates(
          repCoordinateLocal[smallestdistIndex], myCoordinates);
      List<LatLng>polyPoints = _convertToLatLng(_decodePoly(nroute));
      print(polyPoints);
      createRoute(polyPoints);

    }

    // String nroute =
    //     await getRouteCoordinates(repCoordinateLocal[i], myCoordinates);
    // repCoordinateLocal = _convertToLatLng(_decodePoly(nroute));

    // String nroute = await getRouteCoordinates(
    //     repCoordinateLocal[smallestdistIndex], myCoordinates);
    //
    // List<LatLng>polyPoints = _convertToLatLng(_decodePoly(nroute));
    // sendRequestNearestPolygon(polyPoints[smallestdistIndex]);
    // print(routedListDist[smallestdistIndex]);
  }

  Future<String> getRouteCoordinates(LatLng l1, LatLng l2) async {
    String url =
        "https://maps.googleapis.com/maps/api/directions/json?origin=${l1.latitude},${l1.longitude}&destination=${l2.latitude},${l2.longitude}&key=AIzaSyBCbSs9nCxJZLYBl62lYHRCcuPcUv48i7g";
    http.Response response = await http.get(url);
    Map values = jsonDecode(response.body);
    return values["routes"][0]["overview_polyline"]["points"];
  }

  void sendRequestNearestPolygon(LatLng coordinateNearest) async {
    String route = await getRouteCoordinates(myCoordinates, coordinateNearest);
    setState(() {
      _polyLines.clear();
      _polyLines.add(Polyline(
        visible: true,
        polylineId: PolylineId('1'),
        width: 4,
        points: _convertToLatLng(_decodePoly(route)),
        color: Colors.red,
      ));
    });
  }

  List _decodePoly(String poly) {
    var list = poly.codeUnits;
    var fList = new List();
    int index = 0;
    int len = poly.length;
    int c = 0;
    do {
      var shift = 0;
      int result = 0;
      do {
        c = list[index] - 63;
        result |= (c & 0x1F) << (shift * 5);
        index++;
        shift++;
      } while (c >= 32);
      if (result & 1 == 1) {
        result = ~result;
      }
      var result1 = (result >> 1) * 0.00001;
      fList.add(result1);
    } while (index < len);
    for (var i = 2; i < fList.length; i++) fList[i] += fList[i - 2];
    //print(fList.toString());
    return fList;
  }

  List<LatLng> _convertToLatLng(List points) {
    List<LatLng> result = <LatLng>[];
    for (int i = 0; i < points.length; i++) {
      if (i % 2 != 0) {
        result.add(LatLng(points[i - 1], points[i]));
      }
    }
    print(result.toString());
    return result;
  }

  double calculateDistance(LatLng selectedDestination) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((myCoordinates.latitude - selectedDestination.latitude) * p) / 2 +
        c(myCoordinates.latitude * p) *
            c(myCoordinates.latitude * p) *
            (1 -
                c((myCoordinates.longitude - selectedDestination.longitude) *
                    p)) /
            2;
    return 12742 * asin(sqrt(a));
  }

  void createRoute(List<LatLng> polyPointsList) {
    setState(() {
      // _polyLines.clear();
      _polyLines.add(Polyline(
          visible: true,
          polylineId: PolylineId('1'),
          width: 4,
          points: polyPointsList,
          color: Colors.red)
      );
    });
  }


  @override
  void initState() {
    super.initState();
    setCameraPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar,
      body: Container(
        decoration: kBackgroundImage,
        child: Stack(
          children: [
            GoogleMap(
              mapType: MapType.terrain,
              initialCameraPosition: CameraPosition(
                target: myCoordinates,
                zoom: 15.0,
              ),
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              zoomControlsEnabled: true,
              polylines: _polyLines,
              markers: Set.from(myMarker),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
            Column(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: kButtonMapPadding,
                    child: RaisedButton(
                      color: kButtonColor,
                      shape: kButtonShape,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.search,
                            color: Colors.white,
                            size: 20.0,
                          ),
                          Text(
                            '  Find Nearest !',
                            style: kIconButtonMapTextS,
                          ),
                        ],
                      ),
                      onPressed: () {
                        setState(() {
                          nearestRep(repCoOrdinates);
                        });
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: kButtonMapPadding,
                    child: RaisedButton(
                      color: kButtonColor,
                      shape: kButtonShape,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.clock,
                            color: Colors.white,
                            size: 20.0,
                          ),
                          Text(
                            '  Confirm Location',
                            style: kIconButtonMapTextS,
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context,
                            '/login/mainMenu/bookingMenu/bookingHomeVisit/bookingInfo');
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
