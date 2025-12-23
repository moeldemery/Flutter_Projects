// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'file:///home/m/AndroidStudioProjects/sa3ada_planner/old/constants.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:carousel_slider/carousel_slider.dart';
//
// class PlacesMenu extends StatefulWidget {
//   @override
//   _PlacesMenuState createState() => _PlacesMenuState();
// }
//
// class _PlacesMenuState extends State<PlacesMenu> {
//   @override
//   Widget build(BuildContext context) {
//     var rating = 3.0;
//     return Scaffold(
//       appBar: kAppBar,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Card(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Padding(
//                     padding: kCardPadding,
//                     child: FlatButton(
//                       padding: EdgeInsets.all(0), //remove default padding
//                       child: Container(
//                         height: 260.0,
//                         width: MediaQuery.of(context).size.width,
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                               fit: BoxFit.fill,
//                               image: AssetImage("assets/images/1.jpg")),
//                         ),
//                       ),
//                       onPressed: () {
//                         showDialogFunc(
//                             context,
//                             "assets/images/1.jpg",
//                             "this is name of resturant",
//                             "helllooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo from alllll discreption");
//                       },
//                     ),
//                   ),
//                   ExpansionTile(
//                     title: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Wave Resturant",
//                           style: kCardTextS,
//                         ),
//                         RatingBar.builder(
//                           initialRating: 3,
//                           minRating: 1,
//                           direction: Axis.horizontal,
//                           allowHalfRating: true,
//                           itemCount: 5,
//                           itemSize: 20.0,
//                           itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
//                           ignoreGestures: true,
//                           itemBuilder: (context, _) => Icon(
//                             Icons.star,
//                             color: Colors.amber,
//                           ),
//                         ),
//                       ],
//                     ),
//                     children: [
//                       Text(
//                           "hellloooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo"),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//             Card(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Padding(
//                     padding: kCardPadding,
//                     child: Container(
//                       height: 260.0,
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                             fit: BoxFit.fill,
//                             image: AssetImage("assets/images/2.jpg")),
//                       ),
//                     ),
//                   ),
//                   ExpansionTile(
//                     title: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Wave Resturant",
//                           style: kCardTextS,
//                         ),
//                         RatingBar.builder(
//                           initialRating: 3.5,
//                           minRating: 1,
//                           direction: Axis.horizontal,
//                           allowHalfRating: true,
//                           itemCount: 5,
//                           itemSize: 20.0,
//                           itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
//                           ignoreGestures: true,
//                           itemBuilder: (context, _) => Icon(
//                             Icons.star,
//                             color: Colors.amber,
//                           ),
//                         ),
//                       ],
//                     ),
//                     children: [
//                       Text(
//                           "hellloooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo"),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//             Card(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Padding(
//                     padding: kCardPadding,
//                     child: Container(
//                       height: 260.0,
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                             fit: BoxFit.fill,
//                             image: AssetImage("assets/images/2.jpg")),
//                       ),
//                     ),
//                   ),
//                   ExpansionTile(
//                     title: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Wave Resturant",
//                           style: kCardTextS,
//                         ),
//                         RatingBar.builder(
//                           initialRating: 3.5,
//                           minRating: 1,
//                           direction: Axis.horizontal,
//                           allowHalfRating: true,
//                           itemCount: 5,
//                           itemSize: 20.0,
//                           itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
//                           ignoreGestures: true,
//                           itemBuilder: (context, _) => Icon(
//                             Icons.star,
//                             color: Colors.amber,
//                           ),
//                         ),
//                       ],
//                     ),
//                     children: [
//                       Text(
//                           "hellloooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo"),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// final List<String> imgList = [
//   'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
//   'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
//   'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
//   'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
//   'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
//   'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
// ];
//
//  List<Widget> imageSliders () {
//    return imgList.map((item) =>
//        Container(
//          child: Container(
//            margin: EdgeInsets.all(5.0),
//            child: ClipRRect(
//                borderRadius: BorderRadius.all(Radius.circular(5.0)),
//                child: Stack(
//                  children: <Widget>[
//                    Image.network(item, fit: BoxFit.cover, width: 1000),
//                    Positioned(
//                      bottom: 0.0,
//                      left: 0.0,
//                      right: 0.0,
//                      child: Container(
//                        decoration: BoxDecoration(
//                          gradient: LinearGradient(
//                            colors: [
//                              Color.fromARGB(200, 0, 0, 0),
//                              Color.fromARGB(0, 0, 0, 0)
//                            ],
//                            begin: Alignment.bottomCenter,
//                            end: Alignment.topCenter,
//                          ),
//                        ),
//                        padding: EdgeInsets.symmetric(
//                            vertical: 10.0, horizontal: 20.0),
//                        child: Text(
//                          'No. ${imgList.indexOf(item)} image',
//                          style: TextStyle(
//                            color: Colors.white,
//                            fontSize: 20.0,
//                            fontWeight: FontWeight.bold,
//                          ),
//                        ),
//                      ),
//                    ),
//                  ],
//                )),
//          ),
//        ))
//        .toList();
//  }
//
// showDialogFunc(BuildContext context, img, title, desc) {
//   return showDialog(
//     context: context,
//     builder: (context) {
//       return Center(
//         child: Material(
//           type: MaterialType.transparency,
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: Colors.white,
//             ),
//             padding: EdgeInsets.all(15),
//             height: MediaQuery.of(context).size.height * 0.9,
//             width: MediaQuery.of(context).size.width * 0.9,
//             child: Stack(
//               children: [
//                 SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: <Widget>[
//                       Container(
//                         child: CarouselSlider(
//                             options: CarouselOptions(),
//                             items: imageSliders()
//                         ),
//                       ),
//                       /*ClipRRect(
//                         borderRadius: BorderRadius.circular(5),
//                         child: Image.asset(
//                           img,
//                           width: MediaQuery.of(context).size.width * 0.9,
//                           height: 200,
//                         ),
//                       ),*/
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         title,
//                         style: TextStyle(
//                           fontSize: 25,
//                           color: Colors.grey,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Container(
//                         // width: 200,
//                         child: Align(
//                           alignment: Alignment.center,
//                           child: Text(
//                             desc,
//                             maxLines: 3,
//                             style: TextStyle(
//                                 fontSize: 15, color: Colors.grey[500]),
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.bottomCenter,
//                   child: SizedBox(
//                     width: double.infinity,
//                     child: RaisedButton(
//                         color: Colors.amber,
//                         child: Text("Book Now"),
//                         onPressed: () {}),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     },
//   );
// }
