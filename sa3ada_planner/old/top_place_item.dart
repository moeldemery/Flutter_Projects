import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BannerWidgetArea extends StatelessWidget {
  BannerWidgetArea(
      {this.bannerItems, this.bannerImage, this.bannerDescription});

  final List<String> bannerItems;
  final List<String> bannerImage;
  final List<String> bannerDescription;
  @override
  Widget build(BuildContext context) {
    //getData();

    var screenWidth = MediaQuery.of(context).size.width;

    PageController controller =
    PageController(viewportFraction: 0.8, initialPage: 1);

    List<Widget> banners = new List<Widget>();

    for (int x = 0; x < bannerItems.length; x++) {
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
                  bannerImage[x],
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
                      bannerItems[x],
                      style: TextStyle(fontSize: 25.0, color: Colors.white),
                    ),
                    Text(
                      //description
                      bannerDescription[x],
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
        scrollDirection: Axis.horizontal,
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

//------------------------------------------------------

class BannerLoadingWidgetArea extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //getData();

    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    PageController controller =
    PageController(viewportFraction: 0.85, initialPage: 0);

    List<Widget> banners = new List<Widget>();

    for (int x = 0; x < 3; x++) {
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
                          blurRadius: 30.0,
                          spreadRadius: 1.0)
                    ]),
              ),
              ClipRRect(
                //image
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                child: Image.asset(
                  "assets/images/logo.png",
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
                      "Loading",
                      style: TextStyle(fontSize: 25.0, color: Colors.white),
                    ),
                    Text(
                      //description
                      "......",
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
                        blurRadius: 30.0,
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
    return Expanded(
      flex: 1,
      child: PageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            width: screenWidth,
            height: screenHeight * 1 / 5,
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
