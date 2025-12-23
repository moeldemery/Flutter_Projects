import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sa3ada_planner/models/placeAD_DTO.dart';
import 'package:sa3ada_planner/screens/home_subscreens/places_subscreens/place_item.dart';
import 'package:sa3ada_planner/screens/home_subscreens/places_subscreens/top_place_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sa3ada_planner/models/networking.dart';

class PlacesMenu extends StatefulWidget {
  @override
  _PlacesMenuState createState() => _PlacesMenuState();
}

class _PlacesMenuState extends State<PlacesMenu> {

  Future<List<PlaceAD_DTO>> futurePlaces;
  Future<List<PlaceAD_DTO>> futureTopPlaces;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futurePlaces = fetchPlaces();
    futurePlaces.then((value) => print(value));

    futureTopPlaces = fetchTopPlaces();
    futureTopPlaces.then((value) => print(value));
  }

  @override
  Widget build(BuildContext context) {
    //return Container();
    var rating = 3.0;
    return Scaffold(
      //appBar: kAppBar,
      body: SingleChildScrollView(
        child: Column(
          children: [

                  FutureBuilder(
                  future: futureTopPlaces,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return  CarouselSlider(
                          items:createTopPlaceWidget(snapshot.data),

                          options: CarouselOptions(
                            height: 270.0,
                            aspectRatio: 16 / 9,
                            viewportFraction: 1,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 5),
                            autoPlayAnimationDuration: Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            scrollDirection: Axis.horizontal,
                          ),
                      );
                    }
                    // By default, show a loading spinner.
                    return CircularProgressIndicator();
                  },
                ),


            FutureBuilder<List<PlaceAD_DTO>>(
              future: futurePlaces,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return createPlaceWidget(snapshot.data);
                }

                // By default, show a loading spinner.
                return CircularProgressIndicator();
              },

            ),
            // PlaceItem(
            //   placeName: "Wave",
            //   placeImage: "assets/images/1.jpg",
            //   placeProvince: "bakooos",
            // ),
            // PlaceItem(
            //   placeName: "Hawaii",
            //   placeImage: "assets/images/1.jpg",
            //   placeProvince: "luran",
            // ),
            // PlaceItem(
            //   placeName: "Wave",
            //   placeImage: "assets/images/1.jpg",
            //   placeProvince: "lol",
            // ),
            // PlaceItem(
            //   placeName: "Wave",
            //   placeImage: "assets/images/1.jpg",
            //   placeProvince: "lol",
            // ),
          ],
        ),
      ),
    );
  }

  List<Widget>  createTopPlaceWidget(List<PlaceAD_DTO> myList) {
    List<Widget> myWidgetList = new List();
    for (var item in myList) {
      myWidgetList.add(TopPlaceItem(
        placeName: item.title,
        placeImage: item.imageUrl,
        placeSubtitle: item.subtitle,

      ));
    }
    return myWidgetList;
  }

  Widget createPlaceWidget(List<PlaceAD_DTO> myList) {
    List<Widget> myWidgetList = new List();
    for (var item in myList) {
      myWidgetList.add(PlaceItem(
        placeName: item.title,
        placeImage: item.imageUrl,
        placeProvince: item.subtitle,

      ));
    }
    return Column(
      children: myWidgetList,
    );
  }

  Future<List<PlaceAD_DTO>> fetchTopPlaces() async {
    NetworkHelper myServer = new NetworkHelper(
        "http://192.168.1.4:5000/api/places/top");
    final response = await myServer.getNetworkData();

    List<PlaceAD_DTO> myList = new List();

    for (var item in response) {
      myList.add(PlaceAD_DTO.fromJson(item));
    }

    return myList;
  }

  Future<List<PlaceAD_DTO>> fetchPlaces() async {
    NetworkHelper myServer = new NetworkHelper(
        "http://192.168.1.4:5000/api/places/top");
    final response = await myServer.getNetworkData();

    List<PlaceAD_DTO> myList = new List();

    for (var item in response) {
      myList.add(PlaceAD_DTO.fromJson(item));
    }

    return myList;
  }
}