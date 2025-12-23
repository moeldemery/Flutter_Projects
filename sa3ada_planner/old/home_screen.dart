// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'file:///home/m/AndroidStudioProjects/sa3ada_planner/old/constants.dart';
// import 'dart:convert' as convert;
// import 'package:http/http.dart' as http;
// import 'file:///home/m/AndroidStudioProjects/sa3ada_planner/old/place_item.dart';
// import 'file:///home/m/AndroidStudioProjects/sa3ada_planner/old/top_place_item.dart';
//
// import '../lib/models/networking.dart';
//
// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   Future<dynamic> getdata() async {
//     const serverURL = 'http://192.168.1.3:5000/api/places/gettopads';
//     NetworkHelper networkHelper = NetworkHelper(serverURL);
//     var data = await networkHelper.getNetworkData();
//     return data;
//   }
//
//   Future<dynamic> topPlacesData;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     topPlacesData = getdata();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var screenHeight = MediaQuery.of(context).size.height;
//     var screenWidth = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       appBar: kAppBar,
//       body: Container(
//         decoration: kBackgroundImage,
//         child: Column(
//           children: [
//             FutureBuilder(
//                 future: topPlacesData,
//                 builder: (context, snapshot) {
//                   if (snapshot.hasData) {
//                     List<String> bannerItems = List<String>();
//                     List<String> bannerImage = List<String>();
//                     List<String> bannerDescription = List<String>();
//
//                     for (var d in snapshot.data) {
//                       bannerImage.add(d["imageUrl"]);
//                       bannerItems.add(d["providerName"]);
//                       bannerDescription.add(d["caption"]);
//                     }
//                     //snapshot.data[0]["imageUrl"];
//
//                     return Column(
//                       children: [
//                         Align(
//                           alignment: Alignment.centerLeft,
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(
//                               //description
//                               "Top Places",
//                               style: TextStyle(
//                                   fontSize: 25.0,
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                         ),
//                         BannerWidgetArea(
//                             bannerItems: bannerItems,
//                             bannerImage: bannerImage,
//                             bannerDescription: bannerDescription),
//
//                       ],
//                     );
//                   }
//                   return Column(
//                     children: [
//                       //BannerLoadingWidgetArea(),
//
//                     ],
//                   );
//                     //Center(child: CircularProgressIndicator());
//                 }),
//           ],
//         ),
//       ),
//     );
//
//     PageController controller = PageController(initialPage: 1);
//   }
// }
//
//
