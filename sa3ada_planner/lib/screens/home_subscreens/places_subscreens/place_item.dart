import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///home/m/AndroidStudioProjects/sa3ada_planner/old/constants.dart';
import 'package:getwidget/getwidget.dart';

class PlaceItem extends StatelessWidget {
  PlaceItem({this.placeName, this.placeImage, this.placeProvince});

  final String placeName;
  final String placeImage;
  final String placeProvince;

  @override
  Widget build(BuildContext context) {
    //   //getData();
    //
    //   var screenWidth = MediaQuery.of(context).size.width;
    //
    //   return Card(
    //       color: Colors.indigo,
    //       child: Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Column(
    //           mainAxisSize: MainAxisSize.min,
    //           children: [
    //             ClipRRect(
    //               //image
    //
    //                 borderRadius:
    //                 BorderRadius.all(Radius.circular(20.0)),
    //                 child: Image.asset(
    //                   placeImage,
    //                   fit: BoxFit.fill,
    //
    //                 )),
    //
    //             Padding(
    //               padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   Text(placeName,style: TextStyle(fontSize: 25.0),),
    //                   Text(placeProvince),
    //                 ],
    //               ),
    //             ),
    //
    //           ],
    //         ),
    //       ));
    // }

    return GFCard(
      padding: const EdgeInsets.all(4),
      color: Colors.white10,
      boxFit: BoxFit.cover,
      image: Image.network(placeImage),
      title: GFListTile(
        avatar: GFAvatar(
          backgroundImage: AssetImage('assets/images/cake.png'),
        ),
        title: Text(placeName),
        subtitle: Text(placeProvince),
      ),
      content: Text("Some quick example text to build on the card"),
      buttonBar: GFButtonBar(
        children: <Widget>[
          GFButton(
            onPressed: () {},
            text: 'Book',
          ),
          GFButton(
            onPressed: () {},
            text: 'View',
          ),
        ],
      ),
    );
  }

}

/**/

// class PlaceLoadingItem extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     //getData();
//
//     var screenWidth = MediaQuery.of(context).size.width;
//     var screenHeight = MediaQuery.of(context).size.height;
//
//     PageController controller =
//     PageController(viewportFraction: 0.85, initialPage: 0);
//
//     List<Widget> banners = new List<Widget>();
//
//     for (int x = 0; x < 3; x++) {
//       var bannerView = Padding(
//         padding: EdgeInsets.all(10.0),
//         child: FlatButton(
//           padding: EdgeInsets.all(0),
//           onPressed: () {},
//           child: Container(
//             height: 200.0,
//             child: Stack(
//               fit: StackFit.expand,
//               children: <Widget>[
//                 Container(
//                   //back shadow
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                       boxShadow: [
//                         BoxShadow(
//                             color: Colors.black38,
//                             offset: Offset(2.0, 2.0),
//                             blurRadius: 30.0,
//                             spreadRadius: 1.0)
//                       ]),
//                 ),
//                 ClipRRect(
//                   //image
//                   borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                   child: Image.asset(
//                     "assets/images/logo.png",
//                     fit: BoxFit.cover,
//                     /*loadingBuilder: (BuildContext context, Widget child,
//                         ImageChunkEvent loadingProgress) {
//                       if (loadingProgress == null) return child;
//                       return Center(
//                         child: CircularProgressIndicator(),
//                       );
//                     },*/
//                   ),
//                 ),
//                 Container(
//                   //gradient color black on top of image
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                       gradient: LinearGradient(
//                           begin: Alignment.topCenter,
//                           end: Alignment.bottomCenter,
//                           colors: [Colors.transparent, Colors.black])),
//                 ),
//                 Padding(
//                   //lower section name+ description
//                   padding: EdgeInsets.all(10.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Text(
//                         //title
//                         "Loading",
//                         style: TextStyle(fontSize: 25.0, color: Colors.white),
//                       ),
//                       Text(
//                         //description
//                         "......",
//                         style: TextStyle(fontSize: 12.0, color: Colors.white),
//                       )
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       );
//       banners.add(bannerView);
//     }
//
//     return Expanded(
//       flex: 1,
//       child: PageView(
//         controller: controller,
//         scrollDirection: Axis.vertical,
//         children: banners,
//       ),
//     );
//   }
// }

/*
  *
    PageController controller =
    PageController(viewportFraction: 0.8, initialPage: 1);

    List<Widget> banners = new List<Widget>();

    for (int x = 0; x < placeName.length; x++) {
      var bannerView = Padding(
        padding: EdgeInsets.all(10.0),
        child: FlatButton(
          padding: EdgeInsets.all(0),
          onPressed: () {},
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                //back shadow
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black38,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 50.0,
                          spreadRadius: 1.0)
                    ]),
              ),
              ClipRRect(
                //image
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                child: Image.network(
                  placeImage[x],
                  fit: BoxFit.cover,
                  /*loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },*/
                ),
              ),
              Container(
                //gradient color black on top of image
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black])),
              ),
              Padding(
                //lower section name+ description
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      //title
                      placeName[x],
                      style: TextStyle(fontSize: 25.0, color: Colors.white),
                    ),
                    Text(
                      //description
                      placeProvince[x],
                      style: TextStyle(fontSize: 12.0, color: Colors.white),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
      banners.add(bannerView);
    }
    var bannerViewLastPage = Padding(
      padding: EdgeInsets.all(10.0),
      child: FlatButton(
        padding: EdgeInsets.all(0),
        onPressed: () {},
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              //back shadow
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black38,
                        offset: Offset(2.0, 2.0),
                        blurRadius: 50.0,
                        spreadRadius: 1.0)
                  ]),
            ),
            ClipRRect(
              //image
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              child: Container(
                color: Colors.white10,
              ),
            ),
            Padding(
              //lower section name+ description
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.add_circle_outlined,
                    color: Colors.white38,
                    size: 75.0,
                  ),
                  Text(
                    //title
                    "Book Your Party Now",
                    style: TextStyle(fontSize: 25.0, color: Colors.black),
                  ),
                  Text(
                    //description
                    "See More",
                    style: TextStyle(fontSize: 12.0, color: Colors.black),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
    banners.add(bannerViewLastPage);
    return Container(

      child: PageView(
        controller: controller,
        scrollDirection: Axis.vertical,
        children: [
          Container(
            width: screenWidth,
            height: 75.0,
            child: PageView(
              controller: controller,
              scrollDirection: Axis.horizontal,
              children: banners,
            ),
          )
        ],
      ),
    );
  }
  }

  * */
